import {Component, EventEmitter, Input, Output, ViewChild} from '@angular/core';

@Component({
  selector: 'app-shortcut-input',
  templateUrl: './shortcut-input.component.html',
  styleUrls: ['./shortcut-input.component.scss']
})
export class ShortcutInputComponent {
  @Input() hotkey = '';
  @Input() isSingleKey = false;
  @Output() hotkeyChange = new EventEmitter<string>();
  @ViewChild('shortcutInput') shortcutInput: any;

  listenShortcut() {
    if (this.isSingleKey) {
      this.listenSingleKeyShortcut();
    } else {
      this.listenShortcutCombination();
    }
  }

  listenSingleKeyShortcut() {
    window.electronAPI.listenKeyForResult([]).then((key: string) => {
      this.hotkey = key;
      window.log.info('Updating hotkey to ' + this.hotkey);
      this.hotkeyChange.emit(this.hotkey);

      // Un-focus the element at the very last to make sure
      // hotkey is updated/sent to the parent component before the element is blurred
      this.shortcutInput.nativeElement.blur();
    });
  }

  listenShortcutCombination() {
    window.electronAPI.listenKeyForResult(['Alt',
      'Control',
      'Modifiers',
      'LMenu',
      'RMenu',
      'Capital',
      'Tab',
      'Shift',
      'Escape',
      'LShiftKey',
      'RShiftKey',
      'LControlKey',
      'RControlKey',
      'ControlKey']).then((key: string) => {

      if (key.trim() === 'None+Back' || key.trim() === 'None+Delete') {
        this.hotkey = '';
      } else {
        this.hotkey = key;
      }

      window.log.info('Updating hotkey to ' + this.hotkey);

      this.hotkeyChange.emit(this.hotkey);

      // Un-focus the element at the very last to make sure
      // hotkey is updated/sent to the parent component before the element is blurred
      this.shortcutInput.nativeElement.blur();
    });
  }

  stopListeningShortcut() {
    try {
      window.electronAPI.listenKeyForResult([]);
    } catch (e) {

    }
  }
}
