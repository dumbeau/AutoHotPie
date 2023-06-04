import {Component, EventEmitter, Output} from '@angular/core';
import {ActivationMode} from '../../../preferences/PieMenu';

@Component({
    selector: 'app-page-selection-mode',
    templateUrl: './page-selection-mode.component.html',
    styleUrls: ['./page-selection-mode.component.scss']
})
export class PageSelectionModeComponent {
    @Output() next = new EventEmitter<number>();
    @Output() prev = new EventEmitter();

    activationMode = ActivationMode.RELEASE_ON_FUNCTION;

    // TODO: complete this component, user can't choose activation mode yet
    onNextClick() {
        this.next.emit(this.activationMode);
    }

    onPrevClick() {
        this.prev.emit();
    }
}
