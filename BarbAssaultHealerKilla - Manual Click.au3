#include <ImageSearch2015.au3>

HotKeySet("{END}", "_Exit")
HotKeySet("{3}", "_clickMeat")
HotKeySet("{1}", "_clickTofu")
HotKeySet("{2}", "_clickWorms")

$meat = @ScriptDir & "\images\meat.png"
$tofu = @ScriptDir & "\images\tofu.png"
$worms = @ScriptDir & "\images\worms.png"
Global $MousePos,$meat, $tofu,$worms,$wormsx,$wormsy,$worms1,$meatx,$tofux,$meaty,$tofuy,$meat1,$tofu1,$snarex,$snarey,$enfeeblex,$enfeebley,$alchx,$alchy,$alchmouse = random(2, 8, 1),$alchsleep = random(1000, 3000, 1),$itemx,$itemy,$itemmouse = random(2, 8, 1),$itemsleep = random(1000, 3000, 1),$stunx,$stuny,$stunmouse = random(2, 8, 1),$stunsleep = random(1000, 3500, 1),$monkmouse = random(2, 8, 1)


_FindClient()
_SetActiveClient()

While 1
WEnd

func _clickMeat()
_ogMousePos()
$meat1 = _ImageSearchArea($meat,1,$aPos[0],$aPos[1],$aPos[0]+$aPos[2],$aPos[1]+$aPos[3],$meatx,$meaty,10,0)
MouseMove( $meatx, $meaty, 1)
MouseClick($MOUSE_CLICK_LEFT)
MouseMove( $MousePos[0], $MousePos[1], 1)
;~ sleep (20)
;~ MouseClick($MOUSE_CLICK_LEFT)
EndFunc

func _clickTofu()
_ogMousePos()
$tofu1 = _ImageSearchArea($tofu,1,$aPos[0],$aPos[1],$aPos[0]+$aPos[2],$aPos[1]+$aPos[3],$tofux,$tofuy,10,0)
MouseMove( $tofux, $tofuy, 1)
MouseClick($MOUSE_CLICK_LEFT)
MouseMove( $MousePos[0], $MousePos[1], 1)
;~ sleep (20)
;~ MouseClick($MOUSE_CLICK_LEFT)
EndFunc

func _clickWorms()
_ogMousePos()
$worms1 = _ImageSearchArea($worms,1,$aPos[0],$aPos[1],$aPos[0]+$aPos[2],$aPos[1]+$aPos[3],$wormsx,$wormsy,10,0)
MouseMove( $wormsx, $wormsy, 1)
MouseClick($MOUSE_CLICK_LEFT)
MouseMove( $MousePos[0], $MousePos[1], 1)
;~ sleep (20)
;~ MouseClick($MOUSE_CLICK_LEFT)
EndFunc

func _ogMousePos()
$MousePos = MouseGetPos()
$MousePos[0] ; Mouse X position
$MousePos[1] ; Mouse Y position
EndFunc

func _Exit()
   Exit 0
EndFunc


Func _FindClient()
   Global $rs_window = WinList("[REGEXPTITLE:^(.*?)(OS\-Scape|OSBuddy\sFree|OSBuddy\sGuest|OSBuddy\sPro|Old\sSchool\sRuneScape|RuneLoader|Konduit|SwiftKit|Exilent|Dawntained|Elkoy|SpawnPK|Soulplay|Alora)(.*?)$$]")
   If $rs_window[0][0] >= 1 Then
	  If StringLen($rs_window[1][1]) > 1 Then
		 Global $aPos = WinGetPos($rs_window[1][1])
		 return $aPos
	  EndIf
   EndIf
   return False
EndFunc

Func _SetActiveClient()
   If _elementExists($rs_window, 1) Then
	  If WinActive($rs_window[1][1]) = 0 Then
		  WinActivate($rs_window[1][1])
	   EndIf
   EndIf
EndFunc

Func _elementExists($array, $element)
    If $element > UBound($array)-1 Then Return False ; element is out of the array bounds
    Return True ; element is in array bounds
EndFunc