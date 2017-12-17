# -*- mode: ruby -*-
# vi: set ft=ruby :

$cleanup = <<SCRIPT
sed -i '/Proxy/d' /etc/apt/apt.conf
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "viruzzo/xubuntu-xenial64"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.customize ["modifyvm", :id, "--vram", "16"]
  end

  config.vbguest.iso_path = "/usr/share/virtualbox/VBoxGuestAdditions.iso"
  config.vm.provision "shell", inline: $cleanup
  config.vm.provision "shell", path: "bin/install-ansible.sh"
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "setup.yml"
    ansible.install = false
    ansible.verbose = true
    ansible.inventory_path = "inventory"
    ansible.limit = "all"
    #ansible.tags = "i3"
  end
end
