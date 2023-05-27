"use strict";
class SideBar {
    constructor() {
        this.column = $('#sidebar-column');
        this.collapseButton = $('#toggle-sidebar-btn');
        this.collapseIconLeft = $('#sidebar-collapse-icon-left');
        this.collapseIconRight = $('#sidebar-collapse-icon-right');
        this.addNewProfileButton = $('#add-new-profile-btn');
        this.sidebarApplicationProfileDiv = $('#sidebar-application-profiles-div');
        this.profiles = [];
        this.collapseIconRight.hide();
        this.refresh();
        //Create collapse/expand button listener
        this.collapseButton.on('click', () => {
            this.toggle();
        });
        this.addNewProfileButton.on('click', () => {
            newProfilePage.createNewProfile().then((applicationProfile) => {
                ahp.applicationProfiles.push(applicationProfile);
                editProfilePage.open();
                this.refresh();
            }).catch(err => {
                // console.log(err);
                editProfilePage.open();
            });
        });
    }
    expand() {
        this.column.attr('style', 'width: 300px');
        this.collapseIconRight.hide();
        this.collapseIconLeft.show();
    }
    ;
    collapse() {
        this.column.attr('style', 'width: 50px');
        this.collapseIconLeft.hide();
        this.collapseIconRight.show();
    }
    ;
    toggle() {
        let sidebarWidth = parseInt(this.column.css('width').replace(/[a-z]/gi, ''));
        if (sidebarWidth > 100) {
            this.collapse();
        }
        else {
            this.expand();
        }
        setTimeout(() => { editPieMenuPage.pieMenuDisplay.resizeCanvas(); }, 100);
    }
    ;
    refresh() {
        this.sidebarApplicationProfileDiv.empty();
        this.profiles = [];
        ahp.applicationProfiles.forEach((profile) => {
            console.log(profile.executables[0].filePath);
            // let sidebarProfileElement = new SidebarProfileElement(profile.executables[0].filePath, profile.name)       
            let sidebarProfileElement = new SidebarProfileElement(profile);
            this.profiles.push(sidebarProfileElement);
            this.sidebarApplicationProfileDiv.append(sidebarProfileElement.element);
        });
    }
    ;
}
class SidebarProfileElement {
    constructor(applicationProfile) {
        this.clipboardSidebarProfileDiv = $('#clipboard-sidebar-profile-div').clone();
        this.iconDiv = this.clipboardSidebarProfileDiv.find('[name=sidebar-profile-icon-div]')[0];
        this.text = this.clipboardSidebarProfileDiv.find('h5')[0];
        this.deleteButton = this.clipboardSidebarProfileDiv.find('.minimized-sidebar-delete-div')[0];
        this.applicationProfile = applicationProfile;
        this.icon = applicationProfile.executables[0].filePath;
        this.name = applicationProfile.name;
        this.required = (applicationProfile.executables[0].ahkHandle == "regApps");
        this.buildElement();
    }
    ;
    test() {
        console.log(this.clipboardSidebarProfileDiv);
    }
    buildElement() {
        console.log(this.icon);
        this.iconDiv.innerHTML = "";
        if (this.icon.endsWith(".exe")) {
            window.processIcon.get(this.icon).then((fileIcon) => {
                // this.iconDiv.src = "data:image/png;base64," + fileIcon   
                let imgElement = new Image();
                imgElement.width = 30;
                imgElement.src = "data:image/png;base64," + fileIcon;
                this.iconDiv.append(imgElement);
            });
        }
        else {
            this.iconDiv.innerHTML = createPieIcon('#1EE8E2', '#1E1E1E');
            function createPieIcon(selectionColor, backgroundColor) {
                // let svgSource = "assets/img/AutoHotPieIcon.svg";              
                let svgString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><svg id=\"Annotation\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1024 1024\"><defs><style>.cls-1 {fill: " + backgroundColor + ";}.cls-2 {fill: " + selectionColor + ";      }    </style>  </defs>  <path class=\"cls-2\" d=\"m512,1009.92c-64.62,0-127.65-12.27-187.32-36.47-61.83-25.07-117.27-61.87-164.77-109.37-47.5-47.5-84.3-102.94-109.37-164.77-24.2-59.67-36.47-122.69-36.47-187.32s12.27-127.65,36.47-187.32c25.07-61.83,61.87-117.27,109.37-164.77,47.5-47.5,102.94-84.3,164.77-109.37,59.67-24.2,122.69-36.47,187.32-36.47s127.65,12.27,187.32,36.47c61.83,25.07,117.27,61.87,164.77,109.37,47.5,47.5,84.3,102.94,109.37,164.77,24.2,59.67,36.47,122.69,36.47,187.32s-12.27,127.65-36.47,187.32c-25.07,61.83-61.87,117.27-109.37,164.77-47.5,47.5-102.94,84.3-164.77,109.37-59.67,24.2-122.69,36.47-187.32,36.47Zm0-793.84c-79.04,0-153.36,30.78-209.25,86.67-55.89,55.89-86.67,130.21-86.67,209.25s30.78,153.36,86.67,209.25c55.89,55.89,130.21,86.67,209.25,86.67s153.36-30.78,209.25-86.67c55.89-55.89,86.67-130.21,86.67-209.25s-30.78-153.36-86.67-209.25c-55.89-55.89-130.21-86.67-209.25-86.67Z\"/>  <path class=\"cls-1\" d=\"m935.46,340.09c-23-56.72-56.77-107.58-100.37-151.18-5.68-5.68-11.49-11.2-17.41-16.54l-80.35,89.14c4.38,3.95,8.69,8.03,12.91,12.25,131.37,131.37,131.37,345.12,0,476.48-131.37,131.37-345.11,131.37-476.48,0-131.37-131.36-131.37-345.11,0-476.48l-84.85-84.85c-43.6,43.6-77.37,94.46-100.37,151.18-22.2,54.76-33.46,112.6-33.46,171.91s11.26,117.16,33.46,171.91c23,56.72,56.77,107.59,100.37,151.19,43.6,43.59,94.46,77.36,151.18,100.36,54.75,22.21,112.59,33.47,171.91,33.47s117.16-11.26,171.91-33.47c56.72-23,107.58-56.77,151.18-100.36,43.6-43.6,77.37-94.47,100.37-151.19,22.2-54.75,33.46-112.59,33.46-171.91s-11.26-117.15-33.46-171.91Z\"/></svg>";
                return svgString;
            }
        }
        if (this.required) {
            this.deleteButton.remove();
        }
        // this.iconDiv.src = "C://Users//Beau//AppData//Roaming//Electron//process_icons//brave.png";
        this.text.innerHTML = this.name;
        this.element = this.clipboardSidebarProfileDiv;
        this.element.on('click', () => {
            editProfilePage.loadProfile(this.applicationProfile);
        });
    }
}
;
var sideBar = new SideBar();
//# sourceMappingURL=sidebar.js.map