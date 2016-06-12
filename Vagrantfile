# -*- mode: ruby -*-
# vi: set ft=ruby 

## Vagrant config
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "devstack"
	
	config.vm.network :private_network, ip: "192.168.77.70"

	config.vm.provider "virtualbox" do |vb|
		vb.cpus = 2
		vb.memory = 8192
		vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
	end

	config.vm.provision "shell", path: "./provision-script/provision.sh"
	config.vm.provision "file", source: "./provision-script/local.conf", destination: "./devstack/local.conf"
end

