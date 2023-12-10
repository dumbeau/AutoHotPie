class Page {
    private static pages: Page[] = [];
    private tabNumber: number;
    private globalTabWithSidebar = $('[href="#tab-6"]');
    private mainAppTabs = $('#app-with-sidebar-tab-items');
    public active: boolean = false;

    constructor(tabNumber: number) {
        this.tabNumber = tabNumber;
        this.active = false;
        Page.pages.push(this);
    }

    open() {
        let tab = $('[href="#tab-' + this.tabNumber.toString() + '"]');
        if (tab.parents()[1].id == this.mainAppTabs[0].id) {
            this.globalTabWithSidebar[0].click();
        }
        tab[0].click();
        Page.pages.forEach(page => page.active = false);
        this.active = true;
    }
}

