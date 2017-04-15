# -*- mode: ruby -*-
# vi: set ft=ruby 

## Vagrant config
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "devstack"
	
	config.vm.network :private_network, ip: "172.16.11.2"
	config.vm.provider "virtualbox" do |vb|
		vb.cpus = 2
		vb.memory = 4096
		vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
	end


	config.vm.provision "shell", path: "./provision-script/provision.sh", privileged: false
	config.vm.provision "file", source: "./provision-script/local.conf", destination: "./devstack/local.conf"
	config.vm.provision "shell", inline: "/home/vagrant/devstack/stack.sh", privileged: false

end

