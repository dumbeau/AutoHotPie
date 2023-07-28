import { Component } from '@angular/core';
import { Konva } from "konva/lib/Global";

@Component({
  selector: 'app-pie-menu-ui',
  templateUrl: './pie-menu-ui.component.html',
  styleUrls: ['./pie-menu-ui.component.scss']
})
export class PieMenuUIComponent {
  isVisible = false;
  xPosition = 0;
  yPosition = 0;
  hotkey = 'Control+M';

  isInEditor = false;
  editorXPosition = 0;
  editorYPosition = 0;
  overlayXPosition = 0;
  overlayYPosition = 0;

  showOverlay(x: number, y: number) {
    this.isVisible = true;
    this.xPosition = x;
    this.yPosition = y;
  }

  hideOverlay() {
    this.isVisible = false;
  }

  onHotkeyPress(event: KeyboardEvent) {
    if (event.ctrlKey && event.key === 'm') {
      this.isVisible = !this.isVisible;
    }
  }

  drawInEditor(x: number, y: number) {
    this.isInEditor = true;
    this.editorXPosition = x;
    this.editorYPosition = y;
  }

  drawInOverlay(x: number, y: number) {
    this.isInEditor = false;
    this.overlayXPosition = x;
    this.overlayYPosition = y;
  }
}
