# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest:8080, host:8081

  config.vm.hostname = "vagrant-dev-django"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/deployment/site.yml"
    ansible.verbose = "vv"
  end
end
