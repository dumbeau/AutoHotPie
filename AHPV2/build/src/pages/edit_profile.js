"use strict";
class EditProfilePage extends Page {
    constructor(pageTabNumber) {
        super(pageTabNumber);
        this.applicationProfileNameHeading = $('#application-profile-name-heading');
        this.settingsButton = $('#edit-profile-settings-btn');
        this.saveAndRunButton = $('#edit-profile-save-and-run-btn');
        this.addNewPieMenuButton = $('#edit-profile-add-new-pie-menu-btn');
        this.pieMenuTable = {
            element: $('#pie-menu-overview-table'),
            refresh: () => {
                this.pieMenuTable.element.empty();
                this.selectedApplicationProfile.pieMenus.forEach((pieMenu) => {
                    this.pieMenuTable.add(pieMenu);
                });
            },
            row: captureElementTemplate('pie-menu-table-row-template'),
            add: (pieMenu) => {
                let values = {
                    color: pieMenu.selectionColor.toRgbHex(),
                    hotkey: pieMenu.hotkey,
                    name: pieMenu.name,
                    isGlobal: pieMenu.applyToAllApplicationProfiles
                };
                let newTableRow = this.pieMenuTable.row;
                let cells = newTableRow.find('td');
                let elements = {
                    edit: $(cells[0]),
                    hotkey: $(cells[2]),
                    name: $(cells[3]),
                    isGlobal: $(cells[4]).find('input'),
                    delete: $(cells[5]),
                    row: $(cells[0]).parent()
                };
                elements.edit.on('click', () => { editPieMenuPage.loadPieMenu(pieMenu); });
                elements.row.on('dblclick', () => { editPieMenuPage.loadPieMenu(pieMenu); });
                elements.hotkey.html(values.hotkey.displayKey);
                elements.name.html(values.name);
                $(elements.isGlobal[0]).prop('checked', values.isGlobal); //How to assign checkboxes using JQuery.
                var addedTable = this.pieMenuTable.element.append(newTableRow);
                jscolor.install(); //Need to reinstall JSColor when a new color control is added.
                let colorControl = addedTable.find('button')[0].jscolor;
                colorControl.processValueInput(pieMenu.selectionColor.toRgbHex());
            }
        };
        this.selectedApplicationProfile = ahp.applicationProfiles[0];
        this.addNewPieMenuButton.on('click', () => {
            newPieMenuPage.addPieMenu(this.selectedApplicationProfile).then(() => {
                this.open();
                this.refresh();
            });
        });
        this.loadProfile(ahp.applicationProfiles[0]);
    }
    refresh() {
        this.pieMenuTable.refresh();
    }
    loadProfile(applicationProfile) {
        this.selectedApplicationProfile = applicationProfile;
        this.applicationProfileNameHeading.html(this.selectedApplicationProfile.name);
        this.refresh();
    }
}
var editProfilePage = new EditProfilePage(2);
//# sourceMappingURL=edit_profile.js.map