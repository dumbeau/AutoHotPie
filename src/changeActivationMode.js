async function changeActivationMode(options){     
    // var defaults = {}
    // var savedResolve;
    // var setting = Object.assign({}, defaults, options);

    //Apply Settings to UI

    //Show UI page
    $('[href="#tab-12"]').tab('show');
    //Create promise
    let myPromise = await waitForUserInput()
    return myPromise
    
    function waitForUserInput(){
        return new Promise((resolve, reject) => {
            //Actions that resolve or reject promise 
            
            backBtn = document.getElementById("act-mode-back-btn");
            actMode1Btn = document.getElementById("act-mode-1-card");
            actMode2Btn = document.getElementById("act-mode-2-card"); 
            actMode3Btn = document.getElementById("act-mode-3-card");           
            actMode4Btn = document.getElementById("act-mode-4-card");           
            actMode1Btn.addEventListener("click", function(event){
                resolve(1);
            });              
            actMode2Btn.addEventListener("click", function(event){
                resolve(2);
            });              
            actMode3Btn.addEventListener("click", function(event){
                resolve(3);
            });
            actMode4Btn.addEventListener("click", function(event){
                resolve(4);
            });
            backBtn.addEventListener("click", function(event){
                reject();
            });         
        });
    }
}
var subMenuModeDescriptions = ["Hover over submenus, release on function.",
                        "Release on first function, hover over next.",
                        "Hover over all selections.",
                        "Click selections"]

var actModePage = {
    backBtn: document.getElementById("act-mode-back-btn"),
    actMode1Btn: $("#act-mode-1-card"),
    actMode2Btn: $("#act-mode-2-card"), 
    actMode3Btn: $("#act-mode-3-card"),       
    actMode4Btn: $("#act-mode-4-card"),       
    initialize: function(){
        for(let i=1; i <= 4; i++){
            $("#act-" + i + "-gif").hide();
            $("#act-" + i + "-img").hide();
            $("#act-mode-" + i + "-card")[0].style.border = "1px solid rgba(64,193,179,0)"            
        }

        this.backBtn.addEventListener('click', (event) => {
            
        });
        this.actMode1Btn.mouseenter((event) => {            
            event.currentTarget.style.border = "1px solid rgba(64,193,179,255)"
            imgSrc = $("#act-1-img").toArray()[0].src;
            gifSrc = $("#act-1-gif").toArray()[0].src;
            $("#act-1-container").toArray()[0].src = gifSrc;            
        });
        this.actMode1Btn.mouseleave((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,0)"
            imgSrc = $("#act-1-img").toArray()[0].src;
            gifSrc = $("#act-1-gif").toArray()[0].src;
            $("#act-1-container").toArray()[0].src = imgSrc;         
        });
        this.actMode2Btn.mouseenter((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,255)"
            imgSrc = $("#act-2-img").toArray()[0].src;
            gifSrc = $("#act-2-gif").toArray()[0].src;
            $("#act-2-container").toArray()[0].src = gifSrc;            
        });
        this.actMode2Btn.mouseleave((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,0)"
            imgSrc = $("#act-2-img").toArray()[0].src;
            gifSrc = $("#act-2-gif").toArray()[0].src;
            $("#act-2-container").toArray()[0].src = imgSrc;         
        });
        this.actMode3Btn.mouseenter((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,255)"
            imgSrc = $("#act-3-img").toArray()[0].src;
            gifSrc = $("#act-3-gif").toArray()[0].src;
            $("#act-3-container").toArray()[0].src = gifSrc;            
        });
        this.actMode3Btn.mouseleave((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,0)"
            imgSrc = $("#act-3-img").toArray()[0].src;
            gifSrc = $("#act-3-gif").toArray()[0].src;
            $("#act-3-container").toArray()[0].src = imgSrc;         
        });
        this.actMode4Btn.mouseenter((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,255)"
            imgSrc = $("#act-4-img").toArray()[0].src;
            gifSrc = $("#act-4-gif").toArray()[0].src;
            $("#act-4-container").toArray()[0].src = gifSrc;            
        });
        this.actMode4Btn.mouseleave((event) => {
            event.currentTarget.style.border = "1px solid rgba(64,193,179,0)"
            imgSrc = $("#act-4-img").toArray()[0].src;
            gifSrc = $("#act-4-gif").toArray()[0].src;
            $("#act-4-container").toArray()[0].src = imgSrc;         
        });
    },
    refresh: function(){},
    
}
// actModePage.initialize();