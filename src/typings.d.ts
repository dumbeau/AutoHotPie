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
     * Toggle pie menu service.
     * @param serviceActive
     *
     * @returns The status of the service after toggling, true if active, false if inactive
     */
    toggleService: (serviceActive: boolean) => Promise<boolean>;

    listenKeyForResult: () => Promise<string>;

    globalHotkeyServiceExited: (callback: () => void) => void;

    getVersion: () => Promise<string>;
  };
}
