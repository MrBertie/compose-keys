#SingleInstance force
#NoEnv
#Persistent

Menu, Tray, Icon, compose.ico

disabled := false

;User settings
IniRead, SoundOnReset, %A_ScriptDir%\config.ini, Settings, SoundOnReset
IniRead, ModifierKey, %A_ScriptDir%\config.ini, Settings, ModifierKey
IniRead, UseCapslock, %A_ScriptDir%\config.ini, Settings, UseCapslock
IniRead, ResetDelay, %A_ScriptDir%\config.ini, Settings, ResetDelay

; Allows user to easily edit the settings
#Include %A_ScriptDir%\ini-editor.ahk

; Convert the 'human' key name to a AHK approved version!
key_map := {RAlt: "Right Alt", LAlt:"Left Alt", RControl: "Right Ctrl" , RWin: "Right Winkey" , LWin: "Left Winkey"  , Esc: Escape  , Insert: Insert, Numlock: "Num Lock", Tab: Tab, None: None}

for key, value in key_map {
	if (value == ModifierKey) {
		key_name := key
		break
	}
}

; Tell the user that compose-keys has loaded, and which modifier is active
TrayTip, Compose Keys, Compose Keys is now running...`nPress [ %ModifierKey% ] to start a new key sequence., 10, 1


Menu, Tray, Click, 1
Menu, Tray, NoStandard

; display the current modifier key at the top of the menu
Menu, Tray, Add, %ModifierKey%, ModifierKey
Menu, Tray, Disable, %ModifierKey%
Menu, Tray, Add, &Capslock, UseCapslock
Menu, Tray, Disable, &Capslock
if (UseCapslock == 1) {
	Menu, Tray, Check, &Capslock
}
Menu, Tray, Add
Menu, Tray, Add, &Disable, DisableKey
Menu, Tray, Add, &Restart, MenuRestart
Menu, Tray, Add
Menu, Tray, Add, &Settings..., MenuSettings
Menu, Tray, Add, &Help, MenuHelp
Menu, Tray, Add, &About, MenuAbout
Menu, Tray, Add, E&xit, MenuExit

Menu, Tray, Default, &Help
Menu, Tray, Tip, Compose Keys : right-click for options.
Menu, Tray, Icon, compose.ico

; this is where the real action is!
; this loads all the compose key combinations
#Include %A_ScriptDir%\hotstring.ahk

return

ModifierKey:
;Void
return

UseCapslock:
;void
return


DisableKey:
	global disabled
	
	if (disabled == true) {
		disabled := false
		Menu, Tray, Uncheck, &Disable
		Menu, Tray, Icon, compose.ico
	} else {
		disabled := true
		Menu, Tray, Check, &Disable
		Menu, Tray, Icon, compose2.ico
	}
return

MenuRestart:
	Reload
return

MenuSettings:
	IniSettingsEditor("Compose", "config.ini")
return

MenuHelp:
	Run, notepad.exe %A_ScriptDir%\help.txt
return

MenuAbout:
	MsgBox, 64, Compose Key, Compose Keys`n`nby Symon Bent`n(hendrybadao@gmail.com)
return

MenuExit:
	ExitApp
return