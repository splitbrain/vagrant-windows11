# Windows 11 Vagrant Setup

This vagrant box spins up a Windows 11 Enterprise Evaluation machine with Chrome, Firefox and Notepad++ preinstalled.

The Windows is debloated during the setup (removing all the bullshit Microsoft is preinstalling).

The keyboard is set to a German layout. Adjust `scripts/keyboard.ps1` if you want something else.


## Run

To start the machine run

  vagrant up

To stop the machine run

  vagrant halt

When the license expires or you want to restart from scratch run

  vagrant destroy

## GUI

When using virtualbox as VM provider (I haven't tested anything else), the box will start in GUI mode.

Login with vagrant/vagrant

## Access via RDP

Use the following to connect:

  xfreerdp /u:vagrant /p:vagrant /v:localhost:53389 /size:1800x1000 +clipboard +home-drive
