
class PieMenuOverlayCanvas {
    constructor(){         
    }

    private canvasElement: HTMLElement;    
    // width: number;
    // height: number;

    canvas: fabric.Canvas;

    initializeCanvas(){
        this.canvasElement = document.getElementById('pie-menu-overlay-canvas');
        this.canvasElement.width = window.innerWidth;
        this.canvasElement.height = window.innerHeight;
    
        this.canvas = new fabric.Canvas('pie-menu-overlay-canvas');

        this.canvas.on('mouse:move', (options) => {
        });
    }
    show(){
        let radius = 30;
        let duration = 150;

        // Create a circle (ring) with a small radius
        let circle = new fabric.Circle({
            radius: radius-10,  // start with a small radius
            fill: null,
            stroke: 'red',
            strokeWidth: 5,  // thickness of the ring
            left: this.canvasElement.width / 2,
            top: this.canvasElement.height / 2,
            originX: 'center',
            originY: 'center',
            selectable: false,
            opacity: 0
        });
    
        // Add the circle to the canvas
        this.canvas.add(circle);
    
        // Animate the radius of the circle
        circle.animate('radius', radius, {
            duration: duration,
            onChange: this.canvas.renderAll.bind(this.canvas),
            easing: fabric.util.ease.easeOutSine
        });
        circle.animate('opacity', 1, {
            duration: duration,
            onChange: this.canvas.renderAll.bind(this.canvas),
            easing: fabric.util.ease.easeOutExpo
        });

    }

    clear(){
        console.log('canvas cleared')
        this.canvas.clear();
    }
}

const pieMenuOverlayCanvas = new PieMenuOverlayCanvas()


createOverlayCanvasListener( () => { 
    //Runs when the overlay window is first created, not shown.       
    pieMenuOverlayCanvas.initializeCanvas();
});

clearCanvasListener( ()=> {
    pieMenuOverlayCanvas.clear();
});


// let myHotkey = new Hotkey("r");
// myHotkey.bind(()=>{
//     pieMenuOverlayCanvas.show();
// });
