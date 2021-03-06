#If WinActive("ahk_group " . Vim.GroupName)
;Functions
; Commander
; Description: Opens Supermemo Commander Window and searches for "Command" then performs selected command
; Parameters
;   Command : string. Can be containing string, not full string if needed
; 
; Uses clipboard, not callee save!
Commander(Command){
  Clipboard := Command
  Send, ^{Enter}
  Send, ^v
  Send, {Enter}
}

; CutAndParseHtml
; Description: changes selected text to [...] with cloze class. Like alt+Z but use on items 
;
; Clipboard is filled with the selected text! 
CutAndParseHtml(){
  Clipboard :=
  Send, ^c
  ClipWait, 1
  bak := Clipboard
  Clipboard := "<SPAN class=""cloze"">[...]</SPAN>"
  Send, ^v
  Send, ^+{Left 9}
  Send ^+{1}
  Send {Esc}
  Clipboard := bak
}

; ApplyTemplate
; Description: Apply the Template "Name" to current item/topic
; Parameters
;   Name: string. Name of the template to switch to. Expects an existing name.
;
ApplyTemplate(Name){
  Send, ^+m
  Send, %Name% 
  Send, {Enter}
}

; SetPriority
; Description: Opens the priority window and sets priority percentage to a number between Min and Max
; Parameters
;   Min: number. Minimum percentage. Expects 0 - 100. Can be float.
;   Max: number. Maximum percentage. Expects 0 - 100. Can be float.
;
SetPriority(Min, Max){
  Send, !p
  Random, rand, Min, Max
  Send, %rand%
  Send, {Enter}
}

; ---------------------
; priorities with Tab + QWERTY
; Q  urgent
; we applicable 
; rty interested/explore
Tab & q::SetPriority(0,5.20)

Tab & w::SetPriority(5.21,15.34)

Tab & e::SetPriority(15.35,31.20)

Tab & r::SetPriority(31.21, 55.62)

Tab & t::SetPriority(55.63, 75.23)

Tab & y::SetPriority(75.24, 100)

; ---------------------
;COMMANDER SHORTCUTS
;Split article
Tab & s::Commander("Split")

;Clear search highlights
Tab & l::Commander("Highlight: Clear")

; ---------------------
;Misc

;Go to html file of current element in editor
Tab & h::
  Send, ^{F9}
Return

;Cut drills
Tab & c::
  Send, {Alt}
  Send, l
  Send, c
  Send, {Enter}
Return

;no matter where the cursor is it will go to learnbar then press Enter
`::   
ControlGetFocus, foc, ahk_class TElWind
  if (foc = "Internet Explorer_Server1") or (foc = "Internet Explorer_Server2"){
	  Send, {Esc}
  }
  Send, {Enter}
Return

;Apply "item" template
Tab & 1::ApplyTemplate("Item")

;Done and dismiss warnings
Tab & d::
  Send, ^+{Enter}
  Send, {Enter}
  Send, {Enter}
 Return

;Filter, advertising, remove tables, font, comments, buttons, scripts, frames 
Tab & f::
  Send, {F6}
  Send, r
  Send, f
  Send, {Enter}
Return

; window notes
; from WinGetClass
; TBrowser - Browser
; TContents - Content Window (Knowledge Tree)
; TElWind - Element window
; TElDATAWind - Element Data window
; TSMMain - Toolbar
; TStats - Statistics[general] window
; TRegistryForm - Registry Window