import {AfterViewInit, Component, OnInit, ViewChild} from '@angular/core';
import {Router} from '@angular/router';
import {NbPosition} from '@nebular/theme';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, AfterViewInit {
    @ViewChild('profileListItemComponent') profileListItemComponent: any;
    @ViewChild('profileEditorHeaderComponent') profileEditorHeaderComponent: any;
    @ViewChild('profInput') profInput: any;

    profSettingsRevealed = false;
    selectingApp = false;

    selectedAppName = '';
    selectedAppIcon = '';

    remainingSec = 5;

    profIds: string[] = [];

    protected readonly NbPosition = NbPosition;

    constructor(private router: Router) {
    }

    ngOnInit(): void {
        console.log('HomeComponent INIT');

        window.electronAPI.getProfileIds().then((profIds: string[]) => {
            this.profIds = profIds;
        });
    }

    ngAfterViewInit(): void {
        this.profileListItemComponent.setProfileUpdateListener(this.profileEditorHeaderComponent);
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
}
