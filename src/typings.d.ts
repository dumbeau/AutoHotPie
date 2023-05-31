/* SystemJS module definition */

declare const nodeModule: NodeModule;

interface NodeModule {
    id: string;
}

interface Window {
    process: any;
    require: any;
    electronAPI: {
        getSettings: () => Promise<Record<string, any>[]>;
        openInBrowser: (url: string) => void;
        isUpdateAvailable: () => Promise<boolean>;
        getForegroundApplication: () => Promise<string[]>;
        createProfile: (profName: string, exePath: string, iconPath: string) => Promise<number>;
        updateProfileName: (profId: string, newName: string) => Promise<boolean>;
        getProfile: (profId: string) => Promise<string>;
        getProfileIds: () => Promise<string[]>;
    };
}
