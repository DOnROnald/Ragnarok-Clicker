# Ragnarok-Clicker
AHK BOT Active-Build for Ragnarok Clicker
Latest version 0.11 released on 13.8.2016

## Overview

* [How-to install](#how-to-install)
	- [Different windowsize](#different-windowsize)
* [Requirements](#requirements)
* [Features](#features)
* [Hotkeys](#hotkeys)
* [Known issues](#known-issues)
* [Changelog](#changelog)
* [To Do](#to-do)
* [Maybe future features](#maybe-future-features)

## How-to Install

* I highly recommend disabling the Steam-Overlay-Feature. since there is a shop button 
	in this game im not sure if there could be complications if something goes ascew with
	the coordinates. so disable the Overlay.

**1.** Start steam version of Ragnarok Clicker

**2.** Download and install latest version of [AutoHotkey][]

**3.** download latest bot version as a zip file.(green button on the right[clone or download])

**4.** extract the zip file to your desire location.

**5.** open the donron-ragnarok-clicker-bot.ahk with autohotkey

This should do it the bot is ready to rumble.
But to be sure you should follow the following steps to make sure
alll the clicks are at the right coordinates.

### Different windowsize
ATTENTION!  if you change the size of the ragnarok Clicker window you need to
			configure the bot further.

**1.**  Start ragnarok Clicker and reshape it to the size you want it, 
		BUT it has to be to a size WITHOUT black bars in the window.

**2.** Start the bot

**3.** right click on the green 'H' in your taskbar. choose windowspy
		THis opens a nifty window which shows stats about the ACTIVE
		window below the cursor.  So left click on Ragnarok Clicker.

**4.** Next to 'Client' are the attributes of your Ragnarok Clicker.
		note down the width 'w' and the hight 'h'

**5.** Go to the script in your explorer and open it with a texteditor.
		can be the standard windows editor but i recommend using 'notepad++'.

**6.** Search for the 2 Variables 'global myW' and 'global myH'
		change the values to the values you got via windowspy.

**7.** save the changes.

**8.** right click on the green 'H' in your taskbar and choose 'Reload this Script'

**9.** you are good to go.

## Requirements

You should have the 'Buy Available Upgrades' Button and the 'Farm/Progression mode'
button unlocked

## Features


 * Automatically clicks mobs
 * Automatically clicks the 6 OBB locations
 * Automatically levels heroes(frequenzy adjustable)
 * Automatically uses ZenySkills and mammonite
 * Automatically accept equiment drop from mob
 * AutoProgress: ONLY FUNCTIONAL IF Ragnarok Clicker WINDOW IS IN FOCUS!
					checks every so often if you are in progressmode if not
					it activates progressmode.(For this to work )
					
		- If Damageskill use is activated it will use the skills after it detected
			 farmmode.
			 
		- If autoTranscend: TAKE CARE THIS WILL AUTOSALVAGE YOUR EQUIMENT BEFORE
			ASCENDING
			 is activated it ckecks if you have hit a wall in
			 progression aka switch back to farmmode more than 2 times in 10 mins.

##Hotkeys

| Hotkey | Function |
| ------ | -------- |
<kbd>F1</kbd>       | turns on/off autoLevelHeroes
<kbd>F2</kbd>       | turns on/off autoProgress
<kbd>F3</kbd>         | turns on/off useDmgSkills
<kbd>F4</kbd>     | lowers LVLup delay
<kbd>F5</kbd>   | raises LVLup delay
<kbd>F6</kbd>        | turns on/off autoTranscend
<kbd>F7</kbd> | starts script
<kbd>F8</kbd>        | pauses script (it will finish its last cycle. so no insta stop)
<kbd>F10</kbd>        | Exits the script(insta-stop)

##	Known issues

* Progression mode only works if the Ragnarok Clicker window is active.
	if autoProgression is enabled and another window is open, the bot will search in
	a small square in this window for the true RGB red colour. if found the script will send
	the following actions to the active window.
* the automatic heroe lvling levels some heroes more often than other. i try to
	remedy this.

## Changelog

*13.8.16: Realase Version: 0.11

##To Do
- useskills toggle
- adjustable autoClicker count
- LvLUP Optimization
- Optimization for higher lvl runs

## Maybe future features
- GUI
- IDLE SUpport
- Mercs automation
- Transcend Timer
- SKillPoring clicker
- Rebirth heroe Clicker














[AutoHotkey]: http://autohotkey.com
[latest bot release]: https://github.com/DOnROnald/Ragnarok-Clicker