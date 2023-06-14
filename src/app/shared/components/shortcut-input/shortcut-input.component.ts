import {Component, EventEmitter, Input, Output, ViewChild} from '@angular/core';
import {db} from "../../../../../app/src/preferences/AHPDB";

@Component({
  selector: 'app-shortcut-input',
  templateUrl: './shortcut-input.component.html',
  styleUrls: ['./shortcut-input.component.scss']
})
export class ShortcutInputComponent {
  @Input() hotkey = '';
  @Output() hotkeyChange = new EventEmitter<string>();
  @ViewChild('shortcutInput') shortcutInput: any;

  listenShortcut() {
    window.electronAPI.listenKeyForResult().then((key: string) => {

      if (key.trim() === 'None+Back' || key.trim() === 'None+Delete') {
        this.hotkey = '';
      } else {
        this.hotkey = key;
      }

      console.log('PieMenuListComponent.getLastKeyPress(): listenKeyForResult() returned ' + key);

      this.hotkeyChange.emit(this.hotkey);

      // Un-focus the element at the very last to make sure
      // hotkey is updated/sent to the parent component before the element is blurred
      this.shortcutInput.nativeElement.blur();
    });
  }

  stopListeningShortcut() {
    window.electronAPI.listenKeyForResult();
  }
}
