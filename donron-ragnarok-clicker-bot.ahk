; Ragnarok Clicker Bot for active-Build for Steam
; Version 0.3
; Date: 12.09.2016
; Author: DOnROn
; Published under MIT License
; Thanks to FlyinPoulpus. I used his Clicker Heroes Bot as template
; and inspiration.
; Thanks to the poeple who contributed to the script.
; Special Thanks to [TUF]DR4LUC0N for beta-testing and suggestions.


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
; FEATURES
; 1. Automatically clicks mobs
; 2. Automatically clicks the 6 OBB locations
; 3. Automatically levels heroes(frequenzy adjustable)
; 4. Automatically uses ZenySkills and mammonite
; 5. Automatically accept equiment drop from mob
; 6. AutoProgeress: checks every so often if you are in progressmode if not
;					it activates progressmode.(For this to work )
;		6.1: If Damageskill use is activated it will use the skills after it detected
;			 farmmode.
;		6.2: If autoTranscend: TAKE CARE THIS WILL AUTOSALvage your equiment
;			 is activated it ckecks if you have hit a wall in
;			 progression aka switch back to farmmode more than 2 times in 5 mins.
; 7. Automatically Transcend after a certain duration. TAKE CARE THIS WILL ;			AUTOSALvage your equiment
; 8. Logs time/date of autoTrascends. and saves a screenshot of Ragnarock-Clicker. ;    So you can check the progress/manuals you made.

;====
;====
; TODO:
; - Skill use improvements
; - autoRaid

;====
;====
; MAYBE FUTURE FEATURES:

; - Mercs automation
; - SKillPoring clicker
; - Rebirth heroe Clicker
;====
;====
;NOTES: 

;====
;========================================================
; Defining environment



CoordMode, Mouse, Relative
SendMode Input
#SingleInstance Force
#KeyHistory 0
SetWorkingDir %A_ScriptDir%
#Persistent
SetTitleMatchMode 3
#MaxThreadsPerHotkey 2

#include %A_ScriptDir%\Gdip_All.ahk


; Remove .ahk and .exe from filename to get name for INI file
ScriptName := A_ScriptName
StringReplace, ScriptName, ScriptName, .ahk,, All
StringReplace, ScriptName, ScriptName, .exe,, All

 
global i := 0 ; MainLoop
global k := 0 ; Transcendcheck
global ElapsedTime := 0
global StartTime := 0
global Stop := 0
global ClickCountLvL := 0
global l := 0
global StartTranscendTimer := 0



WinGetPos,,, WinW, WinH, ahk_exe Ragnarok Clicker.exe
global myW := WinW
global myH := WinH     
 
global defaultW := 1144         ; do not change this
global defaultH := 672          ; do not change this


 
;========================================================
; GUI startup
;Variablen
version := "v0.30"
bb := 0


;Read prevously saved settings from .ini
IniRead, Delay, %ScriptName%.ini, Settings, Delay
IniRead, UseDmgSkills, %ScriptName%.ini, Settings, UseDmgSkills, %UseDmgSkills%
IniRead, AutoProgress, %ScriptName%.ini, Settings, AutoProgress, %AutoProgress%
IniRead, AutoLevelHeroes, %ScriptName%.ini, Settings, AutoLevelHeroes, %AutoLevelHeroes%
IniRead, AutoTranscendWall, %ScriptName%.ini, Settings, AutoTranscendWall, %AutoTranscendWall%
IniRead, UseSkills, %ScriptName%.ini, Settings, UseSkills, %UseSkills%
IniRead, AutoClicker, %ScriptName%.ini, Settings, AutoClicker, %AutoClicker%
IniRead, AutoOBBClicker, %ScriptName%.ini, Settings, AutoOBBClicker, %AutoOBBClicker%
IniRead, AutoEquipmentClicker, %ScriptName%.ini, Settings, AutoEquipmentClicker, %AutoEquipmentClicker%
IniRead, ClickCount, %ScriptName%.ini, Settings, ClickCount, %ClickCount%
IniRead, LevelCycle, %ScriptName%.ini, Settings, LevelCycle, %LevelCycle%
IniRead, AutoTranscendTime, %ScriptName%.ini, Settings, AutoTranscendTime, %AutoTranscendTime%
IniRead, TranscendTimer, %ScriptName%.ini, Settings, TranscendTimer, %TranscendTimer%



Gui, Add, CheckBox, x6 y12 w160 h20 vAutoClicker Checked%AutoClicker%, autoClicks
Gui, Add, CheckBox, x6 y72 w160 h20 vAutoOBBClicker Checked%AutoOBBClicker%, autoOBBClicker
Gui, Add, CheckBox, x6 y102 w160 h20 vAutoEquipmentClicker Checked%AutoEquipmentClicker%, autoEquipmentclicker
Gui, Add, CheckBox, x6 y132 w160 h20 vAutoProgress Checked%AutoProgress%, autoProgress
Gui, Add, CheckBox, x36 y152 w130 h20 vUseDmgSkills Checked%UseDmgSkills% , useDmgSkills
Gui, Add, CheckBox, x36 y172 w130 h20 vAutoTranscendWall Checked%AutoTranscendWall%, autoTranscendWall
Gui, Add, Edit, x6 y32 w25 h15 vClickCount Limit3 Number, %ClickCount%
Gui, Add, Text, x33 y32 w150 h20, Clicks per Cycle(1-999)
Gui, Add, CheckBox, x6 y202 w120 h30 vAutoLevelHeroes Checked%AutoLevelHeroes%, AutoLevelHeroes
Gui, Add, Edit, x6 y234 w25 h15 vLevelCycle Limit2 Number, %LevelCycle%
Gui, Add, Text, x33 y228 w100 h30, LevelHeroes every`nx Cycles(1-99)
Gui, Add, CheckBox, x6 y272 w160 h50 vUseSkills Checked%UseSkills%, useZenySkills/`nmammonite(once every cycle)
Gui, Add, Button, x186 y12 w130 h50 gReadme, readme/latest version opens browser
Gui, Add, Edit, x186 y290 w25 h15 vDelay Limit3 Number, %Delay%
Gui, Add, Text, x211 y285 w100 h30, Delay between`nActions(in ms)
Gui, Add, CheckBox, x186 y195 w160 h50 vAutoTranscendTime Checked%AutoTranscendTime%, Transcends after a certain duration
Gui, Add, Edit, x186 y240 w25 h15 vTranscendTimer Limit3 Number, %TranscendTimer%
Gui, Add, Text, x211 y240 w100 h30, Time to Transcend (in min)
Gui, Add, Button, x186 y332 w130 h60 gGuiClose, Exit
Gui, Add, Button, x6 y332 w80 h60 gstartMainLoop, Start
Gui, Add, Button, x86 y332 w80 h60 gStop, Stop`n(will finish 1 last cycle)

Gui, Add, Text, x186 y82 w130 h100 , Please refer to the readme for more detailed Information`n`nFor a Idle-build only use autoProgress and AutoLevelHeroes
Gui, Show, x168 y172 h400 w327, DOnROns Rangnarok Clicker Bot %version%
Return



Stop:
{
	Stop :=!Stop
	Gui, Submit, NoHide
	TrayTip, Options State
	, Pause initiated`nPlease wait for the`ncycle to finish`n
	, 15, 34
	return
}

Readme:
{
	run, https://github.com/DOnROnald/Ragnarok-Clicker
	return
}
GuiClose:
ExitApp

;========================================================
;========================================================
; Logic Section

startMainLoop:
{ 	
	Stop := false
	Gui, Submit, NoHide
	

	ClickCountLvL :=  Round(ClickCount)/4* AutoClicker
	IniWrite, %Delay%, %ScriptName%.ini, Settings, Delay
	IniWrite, %UseDmgSkills%, %ScriptName%.ini, Settings, UseDmgSkills
	IniWrite, %AutoProgress%, %ScriptName%.ini, Settings, AutoProgress
	IniWrite, %AutoLevelHeroes%, %ScriptName%.ini, Settings, AutoLevelHeroes
	IniWrite, %AutoTranscendWall%, %ScriptName%.ini, Settings, AutoTranscendWall
	IniWrite, %UseSkills%, %ScriptName%.ini, Settings, UseSkills
	IniWrite, %AutoClicker%, %ScriptName%.ini, Settings, AutoClicker
	IniWrite, %AutoOBBClicker%, %ScriptName%.ini, Settings, AutoOBBClicker
	IniWrite, %AutoEquipmentClicker%, %ScriptName%.ini, Settings, AutoEquipmentClicker
	IniWrite, %ClickCount%, %ScriptName%.ini, Settings, ClickCount
	IniWrite, %LevelCycle%, %ScriptName%.ini, Settings, LevelCycle
	IniWrite, %AutoTranscendTime%, %ScriptName%.ini, Settings, AutoTranscendTime
	IniWrite, %TranscendTimer%, %ScriptName%.ini, Settings, TranscendTimer
	
	SetMouseDelay %Delay%               
	SetControlDelay %Delay%	
	SetKeyDelay %Delay% 
	
	
    while(!Stop)
    {		
		if(AutoEquipmentClicker)
		{
		EquipmentClicker()
		}
		
		if(AutoOBBClicker)
		{
        ClickOBBLocations()
        }
		
		if(AutoClicker)
		{
		Clicker(ClickCount)
		}
			
        if(AutoLevelHeroes)
		{
		LevelHeroes(LevelCycle, AutoClicker, ClickCountLvL)
		}
       
        if(AutoProgress)
        {
        EnableAutoProgress(AutoTranscendWall, UseDmgSkills)
        }
       
        if(UseSkills)
        {
        EnableSkills()
        }
		
		if(AutoTranscendTime)
		{
		EnableAutoTranscendTime(TranscendTimer)
		}
       
        i++
		
       
    }
	
    return
}
;===================================================================
;==================== Functionssection ============================

EquipmentClicker()
{
    ControlClick, % "x" . (530*myW/defaultW) . " " . "y" (350*myH/defaultH), Ragnarok Clicker,, Left, 1, Na ;Click on Equipment
    Sleep, 500
    ControlClick, % "x" . (920*myW/defaultW) . " " . "y" (130*myH/defaultH), Ragnarok Clicker,, Left, 1, Na ;Click on X Equiment
    sleep, 300	
}
 
Clicker(ClickCount)
 
{  
	ControlClick,% "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, Left, %ClickCount%,  NA
}
 
 
ClickOBBLocations()
{
        ControlClick, % "x" . (1000*myW/defaultW) . " " . "y" (450*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA        
        ControlClick, % "x" . (740*myW/defaultW) . " " . "y" (430*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA      
        ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA        
        ControlClick, % "x" . (1050*myW/defaultW) . " " . "y" (440*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA        
        ControlClick, % "x" . (875*myW/defaultW) . " " . "y" (525*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA
        ControlClick, % "x" . (750*myW/defaultW) . " " . "y" (375*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA      
}

LevelHeroes(LevelCycle, AutoClicker, ClickCountLvL)
{	
	if(i >= LevelCycle)
    {
		pToken := Gdip_Startup()

	
		ControlClick, % "x" . (45*myW/defaultW) . " " . "y" (125*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA  ; open upgradetab
		Sleep, 50
		
        
		while Xscrolldown != 180
		{
			Loop, 10 ; scroll
			{
				ControlClick, % "x" . (75*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, WheelDown, 2 NA
				Sleep, 75
			}
		
			pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
			Gdip_SaveBitmapToFile(pBitmapHaystack, "images\lvlscrolldowncontrol.png")
			pBitmapNeedle := Gdip_CreateBitmapFromFile("images\lvlscrolldown.PNG")    
			ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA 
			Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, lvlscrolldowncoords,0,0,0,0,0,0,2)
			out:=StrSplit(lvlscrolldowncoords,"`,")
			Xscrolldown :=out[1]
			Yscrolldown :=out[2]
		;	FileAppend, %A_DD%.%A_MMMM% %A_Hour%:%A_Min%:%A_Sec% === %Xscrolldown% %Yscrolldown%`n, bug1.txt
			Gdip_DisposeImage(pBitmapNeedle)
					
		}
		
		Xscrolldown := 0
		
		
		pBitmapNeedle := Gdip_CreateBitmapFromFile("images\buyUpgrades.PNG")
		ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA 		
		Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, buyUpgradescoords,0,0,0,0,0,0,2)
		out:=StrSplit(buyUpgradescoords,"`,")
		Xupgrade :=out[1]
		Yupgrade :=out[2]
	
		If ErrorLevel = 0
		{			
			ControlClick, x%Xupgrade% y%Yupgrade%, Ragnarok Clicker,, left, 1, NA
			sleep, 50
		}
				
		Gdip_DisposeImage(pBitmapHaystack)
		Gdip_DisposeImage(pBitmapNeedle)      
	
		ControlSend,, {q down}, Ragnarok Clicker
		while Xscrollup !=	332
		{	
					
			Loop, 7
			{
				pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
				Gdip_SaveBitmapToFile(pBitmapHaystack, "images\lvlupcontrol1.png")
				pBitmapNeedle := Gdip_CreateBitmapFromFile("images\lvlupmax.PNG")    
				ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA 
				Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, lvlupcoords,0,0,0,0,0,0,2)
				out:=StrSplit(lvlupcoords,"`,")
				Xlvlup :=out[1]
				Ylvlup :=out[2]
			
				Gdip_DisposeImage(pBitmapHaystack)
				Gdip_DisposeImage(pBitmapNeedle)
									
				If ErrorLevel = 0
				{			
					
					ControlClick, x%Xlvlup% y%Ylvlup%, Ragnarok Clicker,, left, 1, NA
					sleep, 50
				}
			
			 		 	
			i := 0
			}
			
			if (AutoClicker)
			{
				Clicker(ClickCountLvL)
			}
			
			pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
			Gdip_SaveBitmapToFile(pBitmapHaystack, "images\lvlscrollupcontrol.png")
			pBitmapNeedle := Gdip_CreateBitmapFromFile("images\lvlscrollup.PNG")    
			ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA 
			Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, lvlscrollupcoords,0,0,0,0,0,0,2)
			out:=StrSplit(lvlscrollupcoords,"`,")
			Xscrollup :=out[1]
			Yscrollup :=out[2]

			Gdip_DisposeImage(pBitmapHaystack)
			Gdip_DisposeImage(pBitmapNeedle)
		
			Loop, 2
			{
				ControlClick, % "x" . (75*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, WheelUp, 1 NA 
			} 
		}
		ControlSend,, {q up}, Ragnarok Clicker 
		Xscrollup := 0
		
		while Xscrolldown != 180
		{
			Loop, 10 ; scroll
			{
				ControlClick, % "x" . (75*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, WheelDown, 2 NA
				Sleep, 75
			}
		
			pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
			pBitmapNeedle := Gdip_CreateBitmapFromFile("images\lvlscrolldown.PNG")  
			ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA 			
			Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, lvlscrolldowncoords,0,0,0,0,0,0,2)
			out:=StrSplit(lvlscrolldowncoords,"`,")
			Xscrolldown :=out[1]
			Yscrolldown :=out[2]
		;	FileAppend, %A_DD%.%A_MMMM% %A_Hour%:%A_Min%:%A_Sec% === %Xscrolldown% %Yscrolldown%`n, bug.txt
			Gdip_DisposeImage(pBitmapNeedle)
					
		}	
	
		pBitmapNeedle := Gdip_CreateBitmapFromFile("images\buyUpgrades.PNG")    
		ControlClick, % "x" . (525*myW/defaultW) . " " . "y" (485*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA 
		Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, buyUpgradescoords,0,0,0,0,0,0,2)
		out:=StrSplit(buyUpgradescoords,"`,")
		Xupgrade :=out[1]
		Yupgrade :=out[2]
;		MsgBox, %Xupgrade% %Yupgrade%
		If ErrorLevel = 0
		{				
			ControlClick, x%Xupgrade% y%Yupgrade%, Ragnarok Clicker,, left, 1, NA
			sleep, 50
		}
				
		Gdip_DisposeImage(pBitmapHaystack)
		Gdip_DisposeImage(pBitmapNeedle)   
		Xscrolldown := 0
		
		Gdip_ShutDown(pToken)	

	}
		
	return
}
 
EnableAutoProgress(AutoTranscendWall, UseDmgSkills)
{	
	
	pToken := Gdip_Startup()
	pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
	Gdip_SaveBitmapToFile(pBitmapHaystack, "images\farmcontrol1.png")
    pBitmapNeedle := Gdip_CreateBitmapFromFile("images\farmmode.PNG")    
	Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, farmmodecoords,0,0,0,0,0,0,2)
	out:=StrSplit(farmmodecoords,"`,")
	Xfarmmode :=out[1]
	Yfarmmode :=out[2]
	Gdip_DisposeImage(pBitmapHaystack)
	Gdip_DisposeImage(pBitmapNeedle)
	Gdip_ShutDown(pToken)
					
    if (Xfarmmode > 0 && k = 0)
    {
        StartTime := A_TickCount
        ;MsgBox, StartTime ist %StartTime%      ; for script development
    }
   
  	If (Xfarmmode > 0 )
	{						
		ControlClick, x%Xfarmmode% y%Yfarmmode%, Ragnarok Clicker,, left, 1, NA
		sleep, 50
		k++						
	}

   
    if (Xfarmmode > 0  && k != 0)
    {
        Sleep, 20
        ElapsedTime := A_TickCount - StartTime        
               
        if (UseDmgSkills)
        {
            ControlSend,, 123879, Ragnarok Clicker
			ControlClick,% "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, Left, 300,  NA
       
        }
	       
	return
    }
       

    if(ElapsedTime > 300000 )
    {
		if(AutoTranscendWall)
		{
		EnableAutoTranscendWall()
		}

    return
    } 
   
 
    return
}

EnableAutoTranscendWall()
{	
	
	if(ElapsedTime/k < 150000)
    {	
		pToken := Gdip_Startup()
		pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
		Gdip_SaveBitmapToFile(pBitmapHaystack, "images\lastAutotranscend.png")
		Gdip_DisposeImage(pBitmapHaystack)
		Gdip_ShutDown(pToken)
        ControlClick, % "x" . (320*myW/defaultW) . " " . "y" (130*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; equiment tap
        sleep, 3000
        
		ControlClick, % "x" . (272*myW/defaultW) . " " . "y" (484*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Salvage         
        sleep, 3000
        ControlClick, % "x" . (494*myW/defaultW) . " " . "y" (430*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Salvage  "yes"      
        sleep, 3000
        ControlClick, % "x" . (1120*myW/defaultW) . " " . "y" (280*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Transcend button
        sleep, 3000
        ControlClick, % "x" . (500*myW/defaultW) . " " . "y" (500*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Transcend "yes"
        sleep, 3000
		FileAppend, %A_DD%.%A_MMMM% %A_Hour%:%A_Min%:%A_Sec% === Last autoTranscendWall`n, autoTranscendLog.txt
			
		ControlSend,, A, Ragnarok Clicker
			
		loop, 10
		{
			ControlClick,% "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, Left, 5,  NA
			Sleep, 100
		}
	}
		
    ElapsedTime := 0
    k := 0
	l := 0
	

	
	return
}

EnableAutoTranscendTime(TranscendTimer)
{	
	
	if(l = 0)
	{		
		StartTranscendTimer := A_TickCount
		l++
	}

	if(l > 0)
	{		
		ElapsedTranscendTimer := (A_TickCount - StartTranscendTimer)/60000	
	}
	
	
	If(ElapsedTranscendTimer > TranscendTimer)
	{
		pToken := Gdip_Startup()
		pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
		Gdip_SaveBitmapToFile(pBitmapHaystack, "images\lastAutotranscend.png")
		Gdip_DisposeImage(pBitmapHaystack)
		Gdip_ShutDown(pToken)
        ControlClick, % "x" . (320*myW/defaultW) . " " . "y" (130*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; equiment tap
        sleep, 3000
        ControlClick, % "x" . (272*myW/defaultW) . " " . "y" (484*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Salvage         
        sleep, 3000
        ControlClick, % "x" . (494*myW/defaultW) . " " . "y" (430*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Salvage  "yes"      
        sleep, 3000
        ControlClick, % "x" . (1120*myW/defaultW) . " " . "y" (280*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Transcend button
        sleep, 3000
        ControlClick, % "x" . (500*myW/defaultW) . " " . "y" (500*myH/defaultH), Ragnarok Clicker,, Left, 1,  NA ; Transcend "yes"
        sleep, 3000
		FileAppend, %A_DD%.%A_MMMM% %A_Hour%:%A_Min%:%A_Sec% === Last autoTranscendTimer`n, autoTranscendLog.txt
		l := 0
		ControlSend,, A, Ragnarok Clicker
		
		loop, 25
		{
		ControlClick,% "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, Left, 5,  NA
		Sleep, 100
		}	
	}
return	 
}
 
EnableSkills()
{
 
	ControlSend,, 456, Ragnarok Clicker
	ControlClick,% "x" . (864*myW/defaultW) . " " . "y" (420*myH/defaultH), Ragnarok Clicker,, Left, ClickCount,  NA

 
return
}
 

 ;================================================================================================================
