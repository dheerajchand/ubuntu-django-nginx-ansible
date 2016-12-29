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
