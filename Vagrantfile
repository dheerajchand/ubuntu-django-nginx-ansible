# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.provider :virtualbox do |v|
	host = RbConfig::CONFIG['host_os']
	if host =~ /darwin/
		mem = `sysctl -n hw.memsize`.to_i / 1024
	elsif host =~ /linux/
		mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's kB//'` .to_i
	elsif host =~ /mswin|mingw|cygwin/
		mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
	end

    mem = mem / 1024 / 4
    v.customize ["modifyvm", :id, "--memory", mem] 

    # basic networking
    config.vm.network :private_network, ip: "192.168.33.10"

    # Basic web port for Django
    config.vm.network "forwarded_port", guest: 80, host: 8080

    # This is port for GeoServer, which is normally 8080 when installed locally, so I am offsetting by 1
    config.vm.network "forwarded_port", guest: 8080, host:8081

    # Hadoop ports, which I am similarly offsetting by 1


    config.vm.network "forwarded_port", guest: 9870, host: 9871 # hadoop port
    config.vm.network "forwarded_port", guest: 50070, host: 50071 # NameNode daemon
    config.vm.network "forwarded_port", guest: 50090, host: 50091 # Secondary Node daemon
    config.vm.network "forwarded_port", guest: 8088, host: 8089 # Resource Manager

    config.ssh.forward_x11 = true

    config.vm.hostname = "vagrant-gisvm"
    config.vm.synced_folder ".", "/vagrant",
      owner: "vagrant"

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/deployment/site.yml"
      ansible.verbose = "vv"
    end
  end
end
