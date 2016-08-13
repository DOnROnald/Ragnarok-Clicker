# Ragnarok-Clicker
AHK BOT Active-Build for Ragnarok Clicker

## Overview

* [How-to install](#how-to-install)
* [Features](#features)
* [Known issues](#known-issues)

## How-to Install

* I highly recommend disabling the Steam-Overlay-Feature. since there is a shop button 
	in this game im not sure if there could be complications if something goes ascew with
	the coordinates. so disable the Overlay.

**1.** Start steam version of Ragnarok Clicker

**2.** Download and install latest version of [AutoHotkey][]

**3.** download [latest bot version] as a zip file

**4.** extract the the zip file

**5.** open the ragnarokv??.ahk with autohotkey

This should do it the bot is ready to rumble

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

## Features


 * Automatically clicks mobs
 * Automatically clicks the 6 OBB locations
 * Automatically levels heroes(frequenzy adjustable)
 * Automatically uses ZenySkills and mammonite
 * Automatically accept equiment drop from mob
 * AutoProgeress: ONLY FUNTIONAL IF WINDOW IS IN FOCUS!
					checks every so often if you are in progressmode if not
					it activates progressmode.(For this to work )
		- If Damageskill use is activated it will use the skills after it detected
			 farmmode.
		- If autoTranscend: TAKE CARE THIS WILL AUTOSALvage your equiment
			 is activated it ckecks if you have hit a wall in
			 progression aka switch back to farmmode more than 2 times in 10 mins.


##	Known issues

* Progression mode only works if the Ragnarok Clicker window is active.
	if autoProgression is enabled and another window is open, the bot will search in
	a small square in this window for the true RGB red colour. if found the script will send
	the following actions to the active window.














[AutoHotkey]: http://autohotkey.com
[latest bot release]: https://github.com/DOnROnald/Ragnarok-Clicker