; Ragnarok Clicker Bot for active-Build for Steam
; Version 0.11
; Date: 12.08.2016
; Author: DOnROn
; Published under MIT License
; Thanks to FlyinPoulpus. I used his Clicker Heroes Bot as template
; and inspiration.
; Thanks to the beta testers: I had none, because i dont have friends because i play idle games all day long.
;


; FOR INSTRUCTIONS HOW TO USE THIS SCRIPT READ THE README
; AVAILABLE UNDER: https://github.com/DOnROnald/Ragnarok-Clicker/blob/master/LICENSE.md
;
; newest version available at: https://github.com/DOnROnald/Ragnarok-Clicker
; 

;====
; WARNING!
; 
; YOU SHOULD READ THE README TO PREVENT ANY MISHAPS WITH THIS SCRIPT
;
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
; INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
; PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
; FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


;====
;====
; COMMANDS
; F1	 turns on/off autoLevelHeroes
; F2	 turns on/off autoProgress
; F3	 turns on/off useDmgSkills
; F4	 lowers LVLup delay
; F5	 raises LVLup delay
; F6	 turns on/off autoTranscend
; F7	 starts script
; F8	 pauses script (it will finish its last cycle. so no insta stop)
; F10	 Exits the script(insta-stop)
;
;====
;====
; FEATURES
; 1. Automatically clicks mobs
; 2. Automatically clicks the 6 OBB locations
; 3. Automatically levels heroes(frequenzy adjustable)
; 4. Automatically uses ZenySkills and mammonite
; 5. Automatically accept equiment drop from mob
; 6. AutoProgeress: ONLY FUNTIONAL IF WINDOW IS IN FOCUS!
;					checks every so often if you are in progressmode if not
;					it activates progressmode.(For this to work )
;		6.1: If Damageskill use is activated it will use the skills after it detected
;			 farmmode.
;		6.2: If autoTranscend: TAKE CARE THIS WILL AUTOSALvage your equiment
;			 is activated it ckecks if you have hit a wall in
;			 progression aka switch back to farmmode more than 2 times in 10 mins.	
;====
;====
; TODO:
; - useskills toggle
; - adjustable autoClicker count
; - Skill use improvements
; - LvLUP Optimization
; - Optimization for higher lvl runs
;====
;====
; MAYBE FUTURE FEATURES:
; - GUI
; - IDLE SUpport
; - Mercs automation
; - Transcend Timer
; - SKillPoring clicker
; - Rebirth heroe Clicker
;====
;====
;NOTES: 

;====
;========================================================
; Defining environment and Variables


CoordMode, Mouse, Relative
SendMode Input
#SingleInstance Force
#Persistent
SetTitleMatchMode 3
#MaxThreadsPerHotkey 2

; If you have perfomance issues change the following 3 values
; they define the delay between actions in ms
SetMouseDelay 75				
SetControlDelay 75				
SetKeyDelay 75					


; Variables
global title := "Ragnarok Clicker" ; steam window name
global stop := false


global lvlupDelay := 5			; default value=5. lower/raise this value to change starting value
global i := 0 ; MainLoop
global k := 0 ; Transcendcheck
global ElapsedTime := 0
global StartTime := 0


global useDmgSkills := false	; if you want the script to start with this feature activated change to "true"
global useSkills := true		; if you want the script to start with this feature activated change to "true"
global autoProgress := false	; if you want the script to start with this feature activated change to "true"
global autoLevelHeroes := false	; if you want the script to start with this feature activated change to "true"
global	autoTranscend := false	; if you want the script to start with this feature activated change to "true"

; Display Computation
global myW := 1136				; change this to your window width(refere to the readme for more information)
global myH := 640				; change this to your window hight(refere to the readme for more information)

global defaultW := 1136			; do not change this
global defaultH := 640			; do not change this





; ================================================================================================================

; ================================================================================================================
; Key configuration section

; F1: toggle hero leveling
F1::
    autoLevelHeroes := !autoLevelHeroes
	DisplayOptionsValue()
    return

; F2: toggles autoprogress
F2::
    autoProgress := !autoProgress
	DisplayOptionsValue()
    return
	
; F3: toggle Dmgskill use. only takes effect if autoProgress is activated
F3::
	useDmgSkills := !useDmgSkills
	DisplayOptionsValue()
    return 
; F4: 
F4::
	if (lvlupDelay > 2)
	{
		lvlupDelay -= 1
	}
	DisplayOptionsValue()
	return
	
; F5 : 
F5::
	if (lvlupDelay < 50)
	{
		lvlupDelay += 1
	}
	DisplayOptionsValue()
	return
	
; F6: autoTranscend only takes effect if autoProgress is activated
F6::
	autoTranscend := !autoTranscend
	DisplayOptionsValue()
	return



; F7:	Starts Script. Only auto-clicks, obb-location-clicks and equimentwindow-clicks are on by default.
;		for other features use hotkeys to activate them.
F7::
	DisplayOptionsValue()
    MainLoop(lvlupDelay)
    return

; F8:	will pause the script. After hitting the key the script will still finish one cycle auf action.
;		so you have to wait.
F8::
    stop := true
	TrayTip, Options State
	, Pause initiated`nPlease wait for the`ncycle to finish`n
	, 15, 34
	return
  
; F10 will exit the script entirely
F10::
    ExitApp
    return
; ================================================================================================================
 
; ================================================================================================================
; Logic section


MainLoop(lvlupDelay)
{
    stop := false		 

	
	while(!stop)
	{
		ControlClick, % "x" . (530*myW/defaultW) . " " . "y" (350*myH/defaultH), Ragnarok Clicker,, Left, 1, Na ;Click on Equipment
		Sleep, 500
		ControlClick, % "x" . (920*myW/defaultW) . " " . "y" (130*myH/defaultH), Ragnarok Clicker,, Left, 1, Na ;Click on X Equiment
		sleep, 300
		ClickOBBLocations()
		Sleep, 100
		autoClicker(100)
		Sleep, 100
		
		if(i >= lvlupDelay && autoLevelHeroes )
		{
			ControlClick, % "x" . (45*myW/defaultW) . " " . "y" (125*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA  ; open upgradetab 
            Sleep, 50
			
			Loop, 10 ; Upgrades upgraden
            {
                ControlClick, % "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, WheelDown, 2 NA
                Sleep, 75
            }
            ControlClick, % "x" . (364*myW/defaultW) . " " . "y" (600*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA  ; upgrades
            Sleep, 100			
			
            Loop, 8 ; LVLUPS
            {
				ControlSend,, {z down}, Ragnarok Clicker				
			
                
                ControlClick, % "x" . (100*myW/defaultW) . " " . "y" (460*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
                
				ControlClick, % "x" . (100*myW/defaultW) . " " . "y" (415*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
              
				ControlClick, % "x" . (100*myW/defaultW) . " " . "y" (360*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
               
				ControlClick, % "x" . (100*myW/defaultW) . " " . "y" (315*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
               
				ControlClick, % "x" . (100*myW/defaultW) . " " . "y" (260*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
               
				ControlClick, % "x" . (100*myW/defaultW) . " " . "y" (215*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
				
				autoClicker(25)                
               
                Loop, 2
                {
                    ControlClick, % "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, WheelUp, 1 NA
                    Sleep, 75
                }
                Sleep, 100
				
				ControlSend,, {z up}, Ragnarok Clicker
				Sleep, 100
				
				
            }
            Loop, 10 ; Second time Upgrades upgraden
            {
                ControlClick, % "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, WheelDown, 2 NA
                Sleep, 75
            }
            ControlClick, % "x" . (364*myW/defaultW) . " " . "y" (600*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA  ; upgrades
            Sleep, 100
			
			i := 0
            
		}
		
		if(autoProgress)
		{
		EnableAutoProgress()
		}
		
		if(useSkills)
		{
		EnableSkills()
		}
		
		
		i++
		
	}

	return
}

autoClicker(c)

{	
   ControlClick,% "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, Left, c,  NA
}


ClickOBBLocations()
{
		ControlClick, % "x" . (1000*myW/defaultW) . " " . "y" (450*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA        
        ControlClick, % "x" . (740*myW/defaultW) . " " . "y" (430*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA       
        ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA        
        ControlClick, % "x" . (1050*myW/defaultW) . " " . "y" (440*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA        
        ControlClick, % "x" . (875*myW/defaultW) . " " . "y" (525*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
        ControlClick, % "x" . (750*myW/defaultW) . " " . "y" (375*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
		return
}

EnableAutoProgress()
{
	
	Sleep 50
	CoordMode, Pixel, Window
    PixelSearch, FoundX, FoundY, 1111*myW/defaultW, 230*myH/defaultH, 1122*myW/defaultW, 244*myH/defaultH, 0xFF0000, 0, Fast RGB
    Sleep, 20
	
	if (ErrorLevel = 0 && k = 0)
	{
		StartTime := A_TickCount
		;MsgBox, StartTime ist %StartTime%		; for script development
	}
	
	if(ErrorLevel = 0)
	{
		ControlSend,, A, Ragnarok Clicker
		k++
	}
	
	if (ErrorLevel = 0 && k != 0)
	{
		Sleep, 20
		ElapsedTime := A_TickCount - StartTime
		;MsgBox, Elaspsedtime is %ElapsedTime%		; for script development
		;MsgBox, % (ElapsedTime/1000) .  " seconds" ; for script development
				
		if (useDmgSkills)
		{
			ControlSend,, 123879, Ragnarok Clicker
		
		}
		
	
	}
		
	
	
	if(ElapsedTime > 660000 )
	{
		
		
		
		if(ElapsedTime/k < 230000 && autoTranscend)
		{
			
			ControlClick, % "x" . (320*myW/defaultW) . " " . "y" (130*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; equiment tap
			sleep, 3000
			ControlClick, % "x" . (272*myW/defaultW) . " " . "y" (484*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Salvage			
			sleep, 3000
			ControlClick, % "x" . (494*myW/defaultW) . " " . "y" (430*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Salvage	"yes"		
			sleep, 3000
			ControlClick, % "x" . (1120*myW/defaultW) . " " . "y" (280*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Transcend button
			sleep, 3000
			ControlClick, % "x" . (500*myW/defaultW) . " " . "y" (500*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Transcend "yes"
			sleep, 3000
		}
		ElapsedTime := 0
		k := 0
	return
	}	
		
	if (ErrorLevel != 0)
	{
		return
	}
	
	
	

    return
}

EnableSkills()
{

ControlSend,, 456, Ragnarok Clicker

return
}


DisplayOptionsValue()
{
	TrayTip, Options State
	, DOnROns Ragnarok-Clicker`n[F7 to start] [F8 to stop]`n[F10 to exit script]`nHeroes leveling[F1]: %autoLevelHeroes%`nAutoprogress[F2]: %autoProgress%`nuseDmgSkills[F3]: %useDmgSkills%`nautoTranscend[F6]: %autoTranscend%`nlvlupDelay[F4-/F5+]: %lvlupDelay%`n
	, 10, 33
}
; ================================================================================================================

