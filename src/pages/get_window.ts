declare function getActiveWindowProcess(): Promise<ExeInfo>;
declare type ExeInfo = {
    path: string;
    icon: Buffer;
    name: string;
    exe: string;
}

class GetFocusedWindowPage extends Page {
    public constructor(pageTabNumber:number){
        super(pageTabNumber); 
        //Inject lottie stuff
        this. timerAnimation = new Lottie('lottie-timer-div', './lottie/timer.json');
        // $('#lottie-timer-div').html('<lottie-player src="./lottie/timer.json" background="transparent"  speed="1"  style="width: 300px; height: 300px;" loop controls autoplay></lottie-player>');
    }
    timerAnimation: Lottie;
    run(): Promise<ExeInfo> {
        this.open();
        this.timerAnimation.play();
        return new Promise((resolve => {
            setTimeout(() => {
                resolve(getActiveWindowProcess());
            }, 5000);
        }));        
    }
}
var getFocusedApplicationPage = new GetFocusedWindowPage(8);