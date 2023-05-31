import {AfterViewInit, Component, OnInit, ViewChild} from '@angular/core';
import {NbPosition} from '@nebular/theme';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, AfterViewInit {
    @ViewChild('profileListItemComponent') profileListItemComponent: any;
    @ViewChild('profInput') profInput: any;
    @ViewChild('profileEditorComponent') profileEditorComponent: any;

    selectingApp = false;

    selectedAppName = '';
    selectedAppIcon = '';
    selectedProfId = '';

    remainingSec = 5;

    profIds: string[] = [];


    protected readonly NbPosition = NbPosition;

    ngOnInit(): void {
        console.log('HomeComponent INIT');

        window.electronAPI.getProfileIds().then((profIds: string[]) => {
            this.profIds = profIds;
            this.selectedProfId = profIds[0];
        });
    }

    ngAfterViewInit(): void {
    }

    trackIds(index: number, profIds: string) {
        return profIds;
    }

    getActiveApp() {
        this.selectingApp = true;
        this.selectedAppName = '';
        this.selectedAppIcon = '';

        this.remainingSec = 5;

        const countdown = setInterval(() => {
            if (this.remainingSec > 0) {
                this.remainingSec--;
            }
        }, 1000);

        setTimeout(() => {
            clearInterval(countdown);

            this.selectingApp = false;
            window.electronAPI.getForegroundApplication().then((value) => {
                this.selectedAppName = value[0];
                this.selectedAppIcon = value[1];
            });
        }, 5000);
    }

    createProfile() {
        window.electronAPI
            .createProfile(this.profInput.nativeElement.value, this.selectedAppName, this.selectedAppIcon)
            .then((success) => {
                if (success) {
                    // TODO: Add profile to list
                    // TODO: Open the profile in the body
                } else {
                    // TODO: Show error message using toaster
                }
            });
    }

    updateSelectedProfile($event: string) {
        this.selectedProfId = $event;
    }

    reloadProfEditor() {
        this.profileEditorComponent.ngOnChanges();
    }
}
