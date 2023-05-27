"use strict";
class Lottie {
    constructor(elementID, sourceJSONFile, style = 'width: 300px; height: 300px;') {
        console.log('Created Lottie');
        this.element = $('#' + elementID);
        this.element.on('click', () => {
            // this.refresh();
        });
        this.src = sourceJSONFile;
        console.log(this.src);
        this.style = style;
        this.refresh();
    }
    play() {
        this.element.html('<lottie-player src="' + this.src + '" background="transparent"  speed="1"  style="' + this.style + '" autoplay debug"></lottie-player>');
    }
    refresh() {
        this.element.html('<lottie-player src="' + this.src + '" background="transparent"  speed="1"  style="' + this.style + '" autoplay debug"></lottie-player>');
    }
}
//# sourceMappingURL=lottie.js.map