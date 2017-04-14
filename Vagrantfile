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
   end

   config.vm.provision "shell", inline: $cleanup
   config.vm.provision "shell", path: "bin/install-ansible.sh"
   config.vm.provision "ansible_local" do |ansible|
     ansible.playbook = "setup.yml"
     ansible.install = false
     ansible.verbose = true
     ansible.inventory_path = "inventory"
     ansible.limit = "all"
   end
end
