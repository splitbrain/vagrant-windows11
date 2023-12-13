# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "gusztavvargadr/windows-11"

  # workaround for gusztavvargadr/packer#420
  config.winrm.transport = :plaintext
  config.winrm.basic_auth_only = true

  # provisioning
  config.vm.provision "shell", path: "scripts/keyboard.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/network.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/debloat.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/install-npp.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/install-firefox.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/install-chrome.ps1", privileged: false
  config.vm.provision "shell", reboot: true


  # Display the VirtualBox GUI when booting the machine
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
  end
end
