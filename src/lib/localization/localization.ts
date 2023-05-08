import {app} from "electron";

/**
 * Text localization class.
 * This class is used to localize text in electron's main process (i.e. outside the chromium renderer).
 *
 * Language is controlled using app.commandLine.appendSwitch(); which sets the language of the browser.
 *
 * Check https://www.electronjs.org/docs/latest/api/command-line-switches for more information.
 *
 * You should call Localization.initialize() before using Localization.tr() if you wish to use a custom path
 * for the locale files.
 *
 * @example Localization.tr("hello");
 * */
export class Localization {
    private static initialized = false;
    private static translation = JSON.parse("{}");
    private static fallBackTranslation = JSON.parse("{}");
    private static path : string;

    /**
     * Initialize the localization class.
     *
     * This function may not be called if you wish to use the default path for the locale files.
     *
     * @param path The path to the locale files.
     * */
    public static initialize(path = "./src/locales/"): void {
        if (Localization.initialized) {
            return;
        }

        this.path = path;

        const fs = require('fs');
        let raw = fs.readFileSync(this.path + app.getLocale().split("-")[0] + '.json');
        Localization.translation = JSON.parse(raw);

        raw = fs.readFileSync(this.path + 'en.json');
        Localization.fallBackTranslation = JSON.parse(raw);

        Localization.initialized = true;
    }

    /**
     * Get translation for a given key.
     *
     * @return The translated text if exists, default (fallback) language otherwise.
     * */
    public static tr(key: string): string {
        if (!Localization.initialized) {
            Localization.initialize();
        }

        if (!this.translation.hasOwnProperty(key)) {
            return this.fallBackTranslation[key];
        }

        return this.translation[key];
    }
}