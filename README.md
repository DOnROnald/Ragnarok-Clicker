# Ragnarok-Clicker
AHK BOT Active-Build for Ragnarok Clicker
Latest version 0.3 released on 12.9.2016

Thanks to [TUF]DR4LUC0N for beta testing and suggestions.

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

**3.** download latest bot version as a zip file(including the image folder and gdip_all.ahk).(green button on the right[clone or download])

**4.** extract the zip file to your desire location.

**5.** open the donron-ragnarok-clicker-bot.ahk with autohotkey

**6.** There should be a Gui-Pop-Up. Choose your Settings.

This should do it the bot is ready to rumble.

## Windowsize changed since v0.3

i implemented some imagesearch for Lvlup process. for this to work you can no longer change the windowsize from the default.
but now the script works id the window is behind other windows(BUT not minimized)


## Requirements

You should have the 'Buy Available Upgrades' Button and the 'Farm/Progression mode'
button unlocked

## Features


 * Automatically clicks mobs
 * Automatically clicks the 6 OBB locations
 * Automatically levels heroes(frequenzy adjustable)
 * Automatically uses ZenySkills and mammonite
 * Automatically accept equiment drop from mob
 * AutoProgress: ONLY FUNCTIONAL IF Ragnarok Clicker is not minimized
					checks every so often if you are in progressmode if not
					it activates progressmode.(For this to work )
					
		- If Damageskill use is activated it will use the skills after it detected
			 farmmode.
			 
		- If autoTranscend: TAKE CARE THIS WILL AUTOSALVAGE YOUR EQUIMENT BEFORE
			ASCENDING
			 is activated it ckecks if you have hit a wall in
			 progression aka switch back to farmmode more than 2 times in 5 mins.
 * AutoTranscend Timer
 * Screenshot of last autoTranscend
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

* 12.9.16 v0.3
	- Added functionality for inactive window
	- Added Screenshot of last autoTranscend
	- Optimized Lvlup
	- Implemented Lvlup functionality for late game
	

*18.8.26 v.0.22
- added 100 Auto-Clicks after AutoTranscension(so that Idle-Build transcension works.)
- Changed autoTranscensionWall conditions to 3 times Farmmode-detections in 5 mins.
- Added autoClicks after skill usage. improves Active- and Idle-Build.

*15.8.16 V0.21
- Changes in Lvlup Process for Idle-Build


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

- AutoRaid
- 

## Maybe future features
















[AutoHotkey]: http://autohotkey.com
[latest bot release]: https://github.com/DOnROnald/Ragnarok-Clicker
