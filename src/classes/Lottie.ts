class Lottie {
    constructor(elementID:string,sourceJSONFile:string, style:string='width: 300px; height: 300px;'){
        console.log('Created Lottie');
        this.element = $('#' + elementID)
        this.element.on('click', ()=>{
            // this.refresh();
        });        
        this.src = sourceJSONFile;
        console.log(this.src);
        this.style = style; 
        this.refresh();   

    }
    element:JQuery; 
    src: string;
    style: string;
    
    play(): void {        
        this.element.html('<lottie-player src="' + this.src + '" background="transparent"  speed="1"  style="' + this.style + '" autoplay debug"></lottie-player>');        
    }
    
    refresh(): void{ 
        this.element.html('<lottie-player src="' + this.src + '" background="transparent"  speed="1"  style="' + this.style + '" autoplay debug"></lottie-player>');
    }
}