!`::

DetectHiddenWindows, on
IfWinExist ahk_class mintty
{
	IfWinActive ahk_class mintty
	{
		WinHide ahk_class mintty
		WinActivate ahk_class Shell_TrayWnd
	}
	else
	{
		WinShow ahk_class mintty
		WinActivate ahk_class mintty
	}
}
else {
	
	Run C:\Cygwin\bin\mintty.exe -
	WinWait ahk_class mintty
	Send, !{F11}
}
DetectHiddenWindows, off
return

; hide Console on "esc".
#IfWinActive ahk_class mintty
+esc::
{
   	WinHide ahk_class mintty
	WinActivate ahk_class Shell_TrayWnd
}
return

