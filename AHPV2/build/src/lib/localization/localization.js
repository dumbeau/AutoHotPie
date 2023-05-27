"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Localization = void 0;
const electron_1 = require("electron");
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
 * @example Localization.initialize("./custom/path/to/locales/");
 *          Localization.tr("hello");
 *
 * @example Localization.tr("hello");
 * */
class Localization {
    /**
     * Initialize the localization class.
     *
     * This function may not be called if you wish to use the default path for the locale files.
     *
     * @param path The path to the locale files.
     * */
    static initialize(path = "./src/locales/") {
        if (Localization.initialized) {
            return;
        }
        this.path = path;
        const fs = require('fs');
        let raw = fs.readFileSync(this.path + electron_1.app.getLocale().split("-")[0] + '.json');
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
    static tr(key) {
        if (!Localization.initialized) {
            Localization.initialize();
        }
        if (!this.translation.hasOwnProperty(key)) {
            return this.fallBackTranslation[key];
        }
        return this.translation[key];
    }
}
Localization.initialized = false;
Localization.translation = JSON.parse("{}");
Localization.fallBackTranslation = JSON.parse("{}");
exports.Localization = Localization;
//# sourceMappingURL=localization.js.map