; Auto-execute section
VimScriptPath := A_LineFile
VimGroup := "ahk_exe sm18.exe"
VimEscNormal := "0"
VimJJ := "1"
VimTwoLetterEsc := "jk" ; add any number of character pairs comma separated
VimDisableUnused := "2"
VimIconCheckInterval := "400"

Vim := new VimAhk()
Return

#Include %A_LineFile%\..\lib\vim_ahk.ahk
