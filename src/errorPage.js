window.onerror = function(message, source, lineno, colno, error){    
    ErrorPage.open(message);
}

var ErrorPage = {
    open: function(errorMessage){
        $('[href="#tab-32"]').tab('show');
        this.errorTextField.html(errorMessage);               
    }, 
    errorTextField: $('#error-text-paragraph'),
    backToMainBtn: $('#error-back-to-main-btn'),
    initialize:function(){
        this.backToMainBtn.on('click', () =>{
            profileManagement.open();
            profileManagement.selectProfile(0);
        }); 
    },
}
// ErrorPage.initialize();