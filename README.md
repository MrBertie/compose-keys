Compose Keys
============

**"compose-keys"** mimics the functionality of the "Compose" key on Linux computers, and allows you to type accented letters and special symbols by pressing a modifier key followed by intuitive 2-letter combinations.

Installation
------------

Download the latest version of [compose-keys](https://github.com/downloads/MrBertie/compose-keys/ComposeKeys-20121002.zip).  Unzip it, and copy the contents to a folder on your computer. Then double-click the "compose.exe" file to start the program.  You can of course create a shortcut to this file if you need to.  There is also a 64bit version ("compose64.exe") for those who prefer it.

A new icon will appear in your tray menu; this controls "compose-keys".  Right-click to access the menu to Enable/Disable, change Settings, to Restart and to view the Help file.  At the top of the menu you can also see the currently active "modifier key".

> "compose-keys" is written in AutoHotKey, compiled to an .exe, and would not be possible without the help/libraries of many others on the AHK forum.  Thank you all!

If you find compose-keys useful and would like to express your appreciation, please consider [**donating**](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DZGNMG6V478M4).

How To Use
----------

Press and **release** the 'modifier' key¹, then type any of the 2-letter sequences listed below to obtain the accent or symbol you need.

>¹ by default [ Right Alt ] key; however this can easily be changed in the settings dialog

**Example:**

To obtain [ **á** ] you would press [ **Right-Alt** ] then [ **'** ] then [ **a** ].  The order is important!

  - Generally for accented letters the key sequence is: **modifier => accent => letter**
  - For symbols it varies according to the list below.  The 2 characters chosen are usually quite logical and easy to learn.

Settings
--------

Using the tray icon menu (right click) you can access this help file, and the configuration file, where the following can be changed:

1. *SoundOnReset* : plays a small blip sound to tell you the modifier key has been reset (by pressing it twice)
2. *ModifierKey* : which key should be used as a modifier, e.g. Caps Lock, Right Alt, Left Alt, Right Control, Left Control, Right Shift, Left Shift, etc...
3. *ResetDelay* : delay (in microseconds: 1000 = 1 sec) before the modifier key is reset, to prevent unwanted key compositions.  Default = 2000ms

Compose Key Table
-----------------

These are the various Linux [compose key options](http://hermit.org/Linux/ComposeKeys.html), all 385 of them!