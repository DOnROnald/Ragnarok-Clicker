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

**6.** There should be a Gui-Pop-Up. Choose your Settings.

This should do it the bot is ready to rumble.

## Different Windowsize

If you want to change the windowsize.
Change it in a way that there are no black bars.
Then open the Bot. Otherwise the clicklocation will be wrong.


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
 * Saves settings into .ini file
##Hotkeys

* Since Version 0.2 no more Hotkeys 

##	Known issues

* Progression mode only works if the Ragnarok Clicker window is active.
	if autoProgression is enabled and another window is open, the bot will search in
	a small square in this window for the true RGB red colour. if found the script will send
	the following actions to the active window.
* the automatic heroe lvling levels some heroes more often than other. i try to
	remedy this.

## Changelog
*15.8.16 Great Overhaul! Version: 0.2
	- New Gui. No more Hotkeys.
	- Added Support for Idle-Build
	- Added autoTranscend log.
	- Improved the Lvlup process.
	
	- BugFix: Changes in the Lvlup Delay werent detected. 

*14.8.16 Release Version: 0.14
	- NO Keystroke History anymore
	- Added save settings in an .ini file

*13.8.16: Release Version: 0.13
	-Added automatic windowsize detection.
	
*13.8.16: Release Version: 0.11

##To Do

- Transcend Timer(adjustable)
- further LvLUP Optimization
- Optimization for higher lvl runs

## Maybe future features

- Mercs automation
- SKillPoring clicker
- Rebirth heroe Clicker














[AutoHotkey]: http://autohotkey.com
[latest bot release]: https://github.com/DOnROnald/Ragnarok-Clicker