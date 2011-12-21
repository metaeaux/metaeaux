#SingleInstance, force
#InstallKeybdHook
^Down::Send, ^{Tab}
^Up::Send, ^+{Tab}
RCtrl & Left::Send, !{Left}
RCtrl & Right::Send, !{Right}
RCtrl & .::Send, ^{w}
RCtrl & ,::Send, ^+{t}

#IfWinActive,ahk_class mintty
CapsLock::Send, {Esc}
#IfWinActive
CapsLock::Ctrl

^+/::Send, {F11}
^/::Send, ^{t}
AppsKey & Down::Send, {PageDown}
AppsKey & Up::Send, {PageUp}
AppsKey & Left::Send, {Home}
AppsKey & Right::Send, {End}


#x::RunOrActivate("C:\Program Files (x86)\JetBrains\PhpStorm 3.0\bin\PhpStorm.exe")
#a::RunOrActivate("C:\Program Files (x86)\Ableton\Live 8.2.6\Program\Live 8.2.6.exe")
#c::RunOrActivate("C:\Users\metaeaux\AppData\Local\Google\Chrome\Application\chrome.exe", "Google Chrome")
+#c::
RunOrActivate("C:\Users\metaeaux\AppData\Local\Google\Chrome\Application\chrome.exe", "Google Chrome")
Send, ^{t}
return
#v::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
#n::RunOrActivate("C:\Program Files (x86)\Notepad++\notepad++.exe")
#z::RunOrActivate("C:\Program Files (x86)\Songbird\songbird.exe")
#m::RunOrActivate("C:\Users\metaeaux\AppData\Local\Google\Chrome\Application\chrome.exe  --app=https://mail.google.com/mail/u/0")
#p::RunOrActivate("C:\Program Files\Adobe\Adobe Photoshop CS5.1\Photoshop.exe")
#t::RunOrActivate("C:\Program Files (x86)\Trillian\trillian.exe", "ahk_class icoMSN")
#=::RunOrActivate("calc.exe")

RunOrActivate(Target, WinTitle = "")
{
   ; Get the filename without a path
   SplitPath, Target, TargetNameOnly

   Process, Exist, %TargetNameOnly%
   If ErrorLevel > 0
      PID = %ErrorLevel%
   Else
      Run, %Target%, , , PID

   ; At least one app (Seapine TestTrack wouldn't always become the active
   ; window after using Run), so we always force a window activate.
   ; Activate by title if given, otherwise use PID.
   If WinTitle <> 
   {
      SetTitleMatchMode, 2
      WinWait, %WinTitle%, , 3
      TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
      WinActivate, %WinTitle%
   }
   Else
   {
      WinWait, ahk_pid %PID%, , 3
      TrayTip, , Activating PID %PID% (%TargetNameOnly%)
      WinActivate, ahk_pid %PID%
   }


   SetTimer, RunOrActivateTrayTipOff, 1500
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
   SetTimer, RunOrActivateTrayTipOff, off
   TrayTip
Return


#IfWinActive, ahk_class Chrome_WidgetWin_0
{
	^t::
	Send, ^{t}
	Sleep, 200
	Send, ^{l}
	return
}
