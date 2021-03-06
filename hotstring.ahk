; trigger inside words; replace immediately; case-sensitive; no auto-backspace
#Hotstring ? * c b0

if (key_name != "None") {
	; Capture the modifier key options
	; the actual one used to trigger the replacement is defined in the config.ini file
	Hotkey, %key_name%, modifier
	modifier:
	cp("modify")
	return
}

; If no modifier is specified then use Capslock by default
if (UseCapslock || key_name == "None") {
	; Special modifier Capslock
	Capslock::
	cp("modify")
	return

	+Capslock::Capslock
}

; Main list of character replacements, adapt to your needs
; they consist of 2-character triggers, followed by a call to the cp() function with the replacement character
#Include %A_ScriptDir%\keys.ahk


; The main Compose function
cp(char) {
	global SoundOnReset, ResetDelay, disabled, use_capslock
	static modify := false
	
	if (disabled == true) {
		return
	}
	
	; first check for the modifier key
	if (char = "modify") {
		if (modify = false) {
			modify := true
			SetTimer, ResetModifier, %ResetDelay%		; reset after a short period to avoid unwanted compose keys
		} else {
			; pressing the modifier twice will reset it
			modify := false
			if (SoundOnReset = 1) {
				SoundBeep, 200, 130  ; quick blip to tell user that modifier was cancelled
			}
		}

	; handle the replacement if the modifier is active
	} else if (modify = true ) {
		modify := false
		SendInput {bs 2}   ; remove the trigger characters
		SendInput %char%   ; send replacement
	}
	return
	
	ResetModifier:
	modify := false
	SetTimer, ResetModifier, Off
	return
}
