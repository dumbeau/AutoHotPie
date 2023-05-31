import {Component, EventEmitter, OnInit, Output} from '@angular/core';

@Component({
    selector: 'app-page-assign-hot-key',
    templateUrl: './page-assign-hot-key.component.html',
    styleUrls: ['./page-assign-hot-key.component.scss']
})
export class PageAssignHotKeyComponent implements OnInit {
    @Output() next = new EventEmitter<string>();
    @Output() prev = new EventEmitter();

    hotkey = '';

    onNextClick() {
        this.next.emit(this.hotkey);
    }

    onPrevClick() {
        this.prev.emit();
    }

    ngOnInit(): void {
        window.electronAPI.listenHotkeyForResult().then((result) => {
            console.log(result);
            this.hotkey = result;
        });
    }
}
