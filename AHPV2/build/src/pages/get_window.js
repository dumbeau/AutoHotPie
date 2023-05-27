"use strict";
class GetFocusedWindowPage extends Page {
    constructor(pageTabNumber) {
        super(pageTabNumber);
        //Inject lottie stuff
        this.timerAnimation = new Lottie('lottie-timer-div', './lottie/timer.json');
        // $('#lottie-timer-div').html('<lottie-player src="./lottie/timer.json" background="transparent"  speed="1"  style="width: 300px; height: 300px;" loop controls autoplay></lottie-player>');
    }
    run() {
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
//# sourceMappingURL=get_window.js.map