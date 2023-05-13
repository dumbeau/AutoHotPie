/**
 * Custom HTML element for text localization.
 * Language is controlled using app.commandLine.appendSwitch(); which sets the language of the browser.
 *
 * Check https://www.electronjs.org/docs/latest/api/command-line-switches for more information.
 *
 * This class is not supposed to be used directly, instead include this file in <head>
 * in the HTML file and use the <localized-text> tag.
 *
 * <localized-text> provides 2 attributes, key and lang, where lang is optional:
 * @example <localized-text key="text to be translated" lang="en" /localized-text>
 * */
class LocalizedTextElement extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        let key = this.hasAttribute('key') ? this.getAttribute('key') : '';
        let lang = this.hasAttribute('lang') ? this.getAttribute('lang') : this.defaultLang();

        console.log("Custom object local-t connected: {key: " + key + ", lang: " + lang + "}");

        this.translate(key, lang).then((translated) => {
            console.log("Translated: " + key + " -> " + translated);
            this.innerText = translated;
        });

    }

    defaultLang() {
        let lang = (navigator.languages !== undefined) ? navigator.languages[0] : navigator.language;

        // Ignore country code (example: en-US -> en)
        return lang.split("-")[0];
    }

    async translate(key, lang) {
        let translated = (await (await fetch("./locales/" + lang + ".json")).json())[key];
        if (translated === undefined) translated = (await (await fetch("./locales/en.json")).json())[key];

        return translated;
    }
}

customElements.define('localized-text', LocalizedTextElement);