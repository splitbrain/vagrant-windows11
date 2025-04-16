# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "win11", primary: true do |win11|
    win11.vm.box = "gusztavvargadr/windows-11"
    win11.vm.hostname = "win11"
  end

  config.vm.define "win10", autostart: false do |win10|
    win10.vm.box = "gusztavvargadr/windows-10"
    win10.vm.hostname = "win10"
  end

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
    vb.memory = "16384"
    vb.customize ["modifyvm", :id, "--vram", "256"]
    vb.customize ["modifyvm", :id, "--accelerate-3d", "on"]
    vb.cpus = 2
  end
end
