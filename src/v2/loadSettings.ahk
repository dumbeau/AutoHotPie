#Requires AutoHotkey v2.0+

/**
 * Load AHPSettings.json for the v2 runtime.
 * Mirrors v1 loadSettingsFile() path rules without mutating globals yet.
 *
 * JSON decoding is intentionally stubbed until a maintained v2 JSON library
 * is chosen; callers should treat MissingJsonLibraryError as "not ready".
 */

class MissingJsonLibraryError extends Error {
    __New(message := "v2 JSON library not wired yet") {
        super.__New(message, -1)
    }
}

DecodeAhpSettingsJson(text) {
    ; Placeholder: replace with the chosen v2 JSON decoder during the port.
    throw MissingJsonLibraryError()
}

LoadAhpSettings(scriptDir := A_ScriptDir) {
    loop files scriptDir "\*.json", "F" {
        text := FileRead(A_LoopFileFullPath, "UTF-8")
        settings := DecodeAhpSettingsJson(text)
        return {
            settings: settings,
            userDataFolder: scriptDir,
            standAlone: true,
            path: A_LoopFileFullPath,
        }
    }

    userDataFolder := A_AppData "\..\Local\AutoHotPie"
    settingsPath := userDataFolder "\AHPSettings.json"
    if FileExist(settingsPath) {
        text := FileRead(settingsPath, "UTF-8")
        settings := DecodeAhpSettingsJson(text)
        return {
            settings: settings,
            userDataFolder: userDataFolder,
            standAlone: false,
            path: settingsPath,
        }
    }

    throw Error("No valid AHPSettings.json found", -1, settingsPath)
}
