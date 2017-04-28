#InstallKeybdHook
Run, bash -c "/opt/wsl/init.sh", %userprofile% , Hide

Process, Exist, "pulseaudio.exe"
If (ErrorLevel= 0) 
	{
	FileRemoveDir, %userprofile%\.config\pulse, 1
	Run, bin\pulseaudio.exe, C:\soft\pulse6 , Hide
	}

^`::
	Run, bash -c "DISPLAY=:0 xdotool key ctrl+grave", , Hide
Return

Media_Play_Pause::
	Run, bash -c "DISPLAY=:0 xdotool key ctrl+shift+super+F9", , Hide
Return

Media_Stop::
	Run, bash -c "DISPLAY=:0 xdotool key ctrl+shift+super+F10", , Hide
Return

Media_Prev::
	Run, bash -c "DISPLAY=:0 xdotool key ctrl+shift+super+F11", , Hide
Return

Media_Next::
	Run, bash -c "DISPLAY=:0 xdotool key ctrl+shift+super+F12", , Hide
Return

