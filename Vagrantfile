# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.customize ["modifyvm", :id, "--vram", "16"]
  end

  config.vbguest.iso_path = "/usr/share/virtualbox/VBoxGuestAdditions.iso"
  config.vm.provision "shell" do |sh|
    sh.inline = "cd /vagrant && make ansible"
    sh.privileged = false
  end
end
