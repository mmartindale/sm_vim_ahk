; Auto-execute section
VimScriptPath := A_LineFile
VimGroup := "ahk_exe sm18.exe"
VimSendEscNormal := "1"
VimDisableUnused := "2"

Vim := new VimAhk()
Return

#Include %A_LineFile%\..\lib\vim_ahk.ahk
