"use strict";
//@ts-nocheck
// import Konva from 'konva';
class KonvaCanvas {
    constructor(canvasID) {
        this.canvasID = canvasID;
        const container = document.getElementById(canvasID);
        this.canvasSize = {
            width: $(`#${canvasID}`).width() || 0,
            height: $(`#${canvasID}`).height() || 0
        };
        this.center = {
            x: this.canvasSize.width / 2,
            y: this.canvasSize.height / 2
        };
        this.stage = new Konva.Stage({
            container: container,
            width: this.canvasSize.width,
            height: this.canvasSize.height
        });
        this.layers = {
            background: new Konva.Layer(),
            graphics: new Konva.Layer(),
            top: new Konva.Layer()
        };
        this.stage.add(this.layers.background);
        this.stage.add(this.layers.graphics);
        this.stage.add(this.layers.top);
        // window.addEventListener('resize', this.resizeCanvas.bind(this));
    }
    ;
    drawBoxAndX() {
        const box = new Konva.Rect({
            x: 0,
            y: 0,
            width: this.canvasSize.width,
            height: this.canvasSize.height,
            stroke: 'black',
            strokeWidth: 4
        });
        this.layers.graphics.add(box);
        const line1 = new Konva.Line({
            points: [0, 0, this.canvasSize.width, this.canvasSize.height],
            stroke: 'black',
            strokeWidth: 4
        });
        this.layers.graphics.add(line1);
        const line2 = new Konva.Line({
            points: [this.canvasSize.width, 0, 0, this.canvasSize.height],
            stroke: 'black',
            strokeWidth: 4
        });
        this.layers.graphics.add(line2);
        this.stage.add(this.layers.graphics);
    }
    resizeCanvas() {
        console.log('pls resize');
        this.canvasSize = {
            width: $(`#${this.canvasID}`).width() || 0,
            height: $(`#${this.canvasID}`).height() || 0
        };
        this.center = {
            x: this.canvasSize.width / 2,
            y: this.canvasSize.height / 2
        };
        this.centerAlignedGroup = new Konva.Group({
            x: this.center.x,
            y: this.center.y
        });
        this.stage.width(this.canvasSize.width);
        this.stage.height(this.canvasSize.height);
        this.stage.draw();
        this.drawBoxAndX();
    }
}
class EditPieMenuPage extends Page {
    constructor(pageTabNumber) {
        super(pageTabNumber);
        this.pieMenuNameHeaderText = $('#edit-pie-menu-name-text');
        this.backButton = $('#edit-pie-menu-back');
        this.selectedPieMenu = new PieMenu();
        this.pieMenuDisplay = new KonvaCanvas("pie-menu-canvas");
        window.addEventListener('resize', this.pieMenuDisplay.resizeCanvas.bind(this.pieMenuDisplay));
        this.initialize();
        // Use fabric.js or p5.js for interactive canvas
        // createCanvas(400, 400);        
    }
    initialize() {
        // this.pieMenuTable = captureElementTemplate(this.pieMenuTemplate)
        this.pieMenuNameHeaderText.on('change', (event) => {
            this.selectedPieMenu.name = event.target.value;
        });
        this.backButton.on('click', () => {
            editProfilePage.open();
        });
    }
    refresh() {
        let selectedPieMenu = this.selectedPieMenu;
        this.pieMenuNameHeaderText.html(selectedPieMenu.name);
        console.log(this.pieMenuNameHeaderText);
    }
    loadPieMenu(pieMenu) {
        this.selectedPieMenu = pieMenu;
        this.open();
        this.refresh();
        this.pieMenuDisplay.resizeCanvas();
    }
}
var editPieMenuPage = new EditPieMenuPage(3);
//# sourceMappingURL=edit_pie_menu.js.map