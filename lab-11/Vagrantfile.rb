# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "gitlab" do |gitlab|
    gitlab.vm.box = "generic/debian9"
    gitlab.vm.network "private_network", type: "dhcp"
    gitlab.vm.hostname = "gitlab"
    gitlab.vm.provider "virtualbox" do |v|
      v.name = "gitlab"
      v.memory = 4096
      v.cpus = 2
    end
    gitlab.vm.provision :shell do |shell|
      shell.path = "install_gitlab.sh"
    end
  end
end