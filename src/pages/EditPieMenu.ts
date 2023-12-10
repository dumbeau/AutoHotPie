class EditPieMenuPage extends Page {
    public constructor(pageTabNumber:number){
        super(pageTabNumber); 
        this.selectedPieMenu = new PieMenu();
        // this.pieMenuDisplay = new KonvaCanvas("pie-menu-canvas");
        this.pieMenuDisplay = fabric.Canvas
        // window.addEventListener('resize', this.pieMenuDisplay.resizeCanvas.bind(this.pieMenuDisplay));
        this.initialize();
        // Use fabric.js or p5.js for interactive canvas

        // createCanvas(400, 400);        
    }
    initialize(): void { 
        this.pieMenuNameHeaderText.on('change', (event) => {
          const target = event.target as HTMLInputElement;
          this.selectedPieMenu.name = target.value;
        })
        this.backButton.on('click', ()=>{
            // editProfilePage.open(); pageManager fix
        });
    }
    refresh(): void {
        let selectedPieMenu = this.selectedPieMenu;
        this.pieMenuNameHeaderText.html(selectedPieMenu.name);
        console.log(this.pieMenuNameHeaderText);
        
    }
    loadPieMenu(pieMenu: PieMenu): void {
        this.selectedPieMenu = pieMenu;
        this.open();
        this.refresh();        
        this.pieMenuDisplay.resizeCanvas();          
    }

    pieMenuNameHeaderText = $('#edit-pie-menu-name-text');
    backButton = $('#edit-pie-menu-back');

    selectedPieMenu: PieMenu;

    pieMenuDisplay: any;
    
}