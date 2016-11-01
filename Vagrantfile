# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.provider :virtualbox do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8080, host:8081
  config.ssh.forward_x11 = true

  config.vm.hostname = "vagrant-gisvm"
  config.vm.synced_folder ".", "/vagrant",
    owner: "vagrant", group: "www-data"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/deployment/site.yml"
    ansible.verbose = "vv"
  end
end
