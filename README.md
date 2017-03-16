# wsl
Windows Subsystem for Linux scripts and tools

This repository contains my scripts and tools for *Bash on Ubuntu on Windows*, also known as *WSL*.

Currently listed here:
* AutoHotkey.akh
  * Autohotkey script that does some magic:
  * Starts init.sh in hidden CMD window
  * Starts PulseAudio server on Windows
  * Provides some hotkeys passthrough between Windows and X Server that allows to use X11 global hotkeys from Windows
  * Note to above: I had troubles with X11 Media Keys and xdotool (they worked just once for each X session) - that's why it uses ctrl-shift-super-fXX combos.

* init.sh
  * Magic script that starts all services and [Tilda](https://github.com/lanoxx/tilda) terminal emulator
  * Should be placed in /opt/wsl/ 
  * Keeps Tilda alive as long as X server is running, in case of accidental exit
  * has PID lock so it won't run if one process is already running
  * script should be altered to use your username (linux side)

* pulse6.zip
  * Ready to use binary distribution of PulseAudio 6.0 for Windows
  * Should be placed in c:\soft
  * Created from rpm packages provided by user mikedep333 at [builds.opensuse.org](https://build.opensuse.org/package/binary/home:mikedep333:branches:home:mkbosmans:mingw32:pulseaudio/mingw32-pulseaudio6?arch=x86_64&filename=mingw32-pulseaudio-6.0-11.64.noarch.rpm&repository=openSUSE_13.2)
  * Preconfigured - sound hardcoded to two speakers and disabled input devices (workaround for error when no sound input device is connected to host)


## Prerequisites
* WSL installed and configured without auto-login to "normal" user (running bash.exe will open root prompt)
* Disabled Windows built-in SSH server (yes, Win10 has one, it's enabled in developer mode!)
  * SSH server broker
  * SSH server proxy
* Installed following packages in WSL
  * tilda
  * openssh-server
  * pulseaudio from [PPA](https://launchpad.net/~aseering/+archive/ubuntu/wsl-pulseaudio)
* Enabled incoming TCP port 22 in Windows Firewall  
* Installed X-Server for Windows 
  * [Xming](https://sourceforge.net/projects/xming/) or [Vcxsrv](https://sourceforge.net/projects/vcxsrv/)
  * Vcxsrv preferred as it's much newer (last free Xming is from 2007!)
  * Add X server to windows Autorun
* Installed [AutoHotkey](https://autohotkey.com/)
* probably I missed something here ;)
