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
