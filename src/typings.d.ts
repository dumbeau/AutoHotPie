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

        /**
         * Returns the path to the executable and the path to the icon of the foreground application
         * @returns JSON string of ForegroundWindow returned by ForegroundWindow.toJsonString()
         */
        getForegroundApplication: () => Promise<string>;

        /**
         * Creates a new profile
         *
         * @param profName The name of the new profile
         * @param exePath The path to the executable of the profile
         * @param iconBase64 The base64 encoded icon of the profile
         * @returns The ID of the newly created profile, -1 if failed
         */
        createProfile: (profName: string, exePath: string, iconBase64: string) => Promise<string>;

        /**
         * Updates the name of a profile
         * @returns True if successful, false if failed
         */
        updateProfileName: (profId: string, newName: string) => Promise<boolean>;

        /**
         * Updates the properties of the pie menu in the user data file
         * @returns True if successful, false if failed
         */
        updatePieMenu: (json: string) => Promise<boolean>;

        /**
         * Returns the profile with the given ID
         *
         * @returns The profile settings (or properties) as a JSON string
         */
        getProfile: (profId: string) => Promise<string>;
        getProfileIds: () => Promise<string[]>;

        /**
         * Returns the pie menu with the given ID
         *
         * @returns The pie menu settings (or properties) as a JSON string
         */
        getPieMenu: (pieId: string) => Promise<string>;

        /**
         * Returns the hotkey that was pressed
         *
         * @returns The string representation of the hotkey that was pressed, e.g. "Ctrl+Shift+Alt+Q"
         */
        listenHotkeyForResult: () => Promise<string>;

        /**
         * Creates a new pie menu
         *
         * @returns True if successful, false if failed
         */
        createPieMenuIn: (profId: string) => Promise<boolean>;

        /**
         *
         * @param profId
         * @param pieId
         *
         * @returns True if successful, false if failed
         */
        removePieMenuFromProfile: (profId: string, pieId: string) => Promise<boolean>;

        getPieItem: (pieItemId: string) => Promise<string | undefined>;

        /**
         * Toggle pie menu service.
         * @param serviceActive
         *
         * @returns The status of the service after toggling, true if active, false if inactive
         */
        toggleService: (serviceActive: boolean) => Promise<boolean>;

        listenKeyForResult: () => Promise<string>;

        updateProfile: (json: string) => Promise<boolean>;

        globalHotkeyServiceExited: (callback: () => void) => void;

    };
}
