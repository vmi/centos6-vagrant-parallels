# -*- mode: ruby -*-
# vi: set ft=ruby :

$VAGRANTFILE_API_VERSION = "2"

Vagrant.configure($VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "centos6"
  config.vm.define "centos6"
  config.vm.box = "parallels/centos-6.6"

  config.vm.provision "shell", inline: "bash /vagrant/provision.sh"

  config.vm.network "private_network", type: "dhcp"

  config.vm.network "forwarded_port", guest:  80, host: 10080
  config.vm.network "forwarded_port", guest: 443, host: 10443

  config.vm.provider "parallels" do |v|
    v.name = "CentOS6"
    v.update_guest_tools = true
    v.memory = 1024
    v.cpus = 1
  end
end
