for profiles in settings
	{
	; msgbox, boop		
	if settings[profiles].ahkHandle == "ahk_group regApps"
		{
		; msgbox, boop
		Hotkey, IfWinNotActive, ahk_group regApps
		for menus in settings[profiles].pieMenus
			{
			Hotkey, % settings[profiles].pieMenus[menus].hotkey, pieLabel
			}
		}
	else
		{
		; msgbox, % settings[profiles].ahkHandle
		Hotkey, IfWinActive, % settings[profiles].ahkHandle
		for menus in settings[profiles].pieMenus
			{
			; msgbox, % settings[profiles].pieMenus[menus].hotkey
			Hotkey, % settings[profiles].pieMenus[menus].hotkey, pieLabel
			}
		}
	}