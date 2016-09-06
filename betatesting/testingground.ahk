CoordMode, Mouse, Relative
CoordMode, Pixel, Relative
SendMode Input
#SingleInstance Force
#KeyHistory 0
SetWorkingDir %A_ScriptDir%
#Persistent
SetTitleMatchMode 3
SetBatchLines, -1
#MaxThreadsPerHotkey 2
global title := "Ragnarok Clicker" ; steam window name

#include %A_ScriptDir%/Gdip_all.ahk





F1::
{
	pToken := Gdip_Startup()
	pBitmapHaystack := Gdip_BitmapFromHwnd(hwnd := WinExist("Ragnarok Clicker"))
					Gdip_SaveBitmapToFile(pBitmapHaystack, "Image1.png")
                    pBitmapNeedle := Gdip_CreateBitmapFromFile("farmmode.PNG")    
					Gdip_SaveBitmapToFile(pBitmapNeedle, "Image2.png")
					Gdip_Imagesearch(pBitmapHaystack, pBitmapNeedle, lvlupcoords,0,0,0,0,0,0,2)
					out:=StrSplit(lvlupcoords,"`,")
					Xlvlup :=out[1]
					Ylvlup :=out[2]
					listVars
							If ErrorLevel = 0
					{			
					
					ControlClick, x%Xlvlup% y%Ylvlup%, Ragnarok Clicker,, left, 1, NA
					sleep, 50
					
					
					}
					Gdip_DisposeImage(pBitmapHaystack)
					Gdip_DisposeImage(pBitmapNeedle)
					
	Gdip_ShutDown(pToken)
return
}

F2::
{
	ImageSearch, FoundX, FoundY, 527, 247, 1092, 547, OBBPRONCORNER.PNG
	If ErrorLevel = 0
	Click, %FoundX%, %FoundY%, 0
	
	If ErrorLevel
	Loop, 2
		SoundBeep

return
}

F3::
{
	PixelSearch, FoundX, FoundY, 527, 247, 1092, 547, 0x24211A, 0, Fast RGB
	If ErrorLevel = 0
	Click, %FoundX%, %FoundY%, 0
	If ErrorLevel
	Loop, 2
		SoundBeep
return
}

F4::
{
	PixelSearch, FoundX, FoundY, 70, 220, 154, 668, 0xFECB00, 0, Fast RGB
	If ErrorLevel = 0
	Click, %FoundX%, %FoundY%, 0
	If ErrorLevel
	Loop, 2
		SoundBeep
return
}


F10::
    ExitApp
    return
