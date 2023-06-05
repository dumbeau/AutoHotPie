import {AfterViewInit, Component, OnChanges, OnInit, SimpleChanges, ViewChild} from '@angular/core';
import {NbPopoverDirective, NbPosition, NbTrigger} from '@nebular/theme';
import {ForegroundWindow} from '../../nativeAPI/ForegroundWindow';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, OnChanges {
    @ViewChild('profileListItemComponent') profileListItemComponent: any;
    @ViewChild('profInput') profInput: any;
    @ViewChild('profileEditorComponent') profileEditorComponent: any;
    @ViewChild(NbPopoverDirective) popover: NbPopoverDirective | any;

    selectingApp = false;

    focusedFgWin: ForegroundWindow | undefined;
    selectedProfId = 'global';

    remainingSec = 5;

    profIds: string[] = [];
    iconPath: any;


    protected readonly NbPosition = NbPosition;

    ngOnInit(): void {
        console.log('HomeComponent INIT');

        window.electronAPI.getProfileIds().then((profIds: string[]) => {
            this.profIds = profIds;
            this.selectedProfId = profIds[0];
        });
    }


    trackIds(index: number, profIds: string) {
        return profIds;
    }

    getActiveApp() {
        this.selectingApp = true;

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
                this.focusedFgWin = ForegroundWindow.fromJsonString(value);

                if (this.focusedFgWin === undefined) {
                    console.warn('HomeComponent: Failed to retrieve foreground window details.');
                }

            });
        }, 5000);
    }

    ngOnChanges(changes: SimpleChanges): void {
        console.log('HomeComponent: ngOnChanges() called');
    }

    createProfile() {
        if (this.focusedFgWin === undefined) {
            console.warn('HomeComponent: Foreground window details are empty.');
            console.warn('HomeComponent: Aborting profile creation.');
            return;
        }

        window.electronAPI
            .createProfile(this.profInput.nativeElement.value, this.focusedFgWin.exePath, this.focusedFgWin.iconBase64)
            .then((id) => {
                if (id !== '-1') {
                    this.profIds.push(id);
                    this.updateSelectedProfile(id);

                    this.focusedFgWin = undefined;
                } else {
                    // TODO: Show error message using toaster
                }
            });
    }

    updateSelectedProfile($event: string) {
        this.selectedProfId = $event;
    }

    reloadProfEditor() {
        console.log('home.component.ts: Reloading profile editor');
        this.profileEditorComponent.ngOnChanges();
    }

    clearPopover() {
        if (this.profInput !== undefined) {return;}

        this.focusedFgWin = undefined;
    }

}
