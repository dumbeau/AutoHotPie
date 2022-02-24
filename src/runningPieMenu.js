var runningPieMenu = {
    loadingGIF:$('#loading-animation'),
    loadingHeading:$('#loading-heading'),
    loadingText:$('#long-time-text'),
    initialize: function(){
        // this.loadingGIF.hide();
        this.loadingText.hide();
    },
    open:function(){
        $('[href="#tab-24"]').tab('show');
        this.loadingGIF.fadeIn(10)
        setTimeout(function(){runningPieMenu.loadingText.fadeIn(500);},10000)
    }
}
// runningPieMenu.initialize();