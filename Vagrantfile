# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  #config.vm.box_url = "file://Users/jerm/Downloads/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  #config.vm.box_url = "https://dl.dropboxusercontent.com/u/165709740/boxes/quantal64-vanilla.box"
  #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box" 
  #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box" 

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8181
  config.vm.network :forwarded_port, guest: 8000, host: 8000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :private_network, ip: "192.168.56.101"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  #config.vm.synced_folder "~", "/home/ubuntu", :owner => "ubuntu"
  config.vm.synced_folder "~/repos", "/home/vagrant/repos", type: "nfs"
  config.vm.synced_folder "~/.oh-my-zsh", "/home/vagrant/.oh-my-zsh", type: "nfs"
  config.vm.synced_folder "~/.vim", "/home/vagrant/.vim", type: "nfs"
  config.nfs.map_uid = :auto

  config.cache.auto_detect = true
  config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", 768] 
      vb.customize ["modifyvm", :id, "--uart1", "0x3F8", 4]
      vb.cpus = 2
  end
  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "rhw_site2.yml"
      ansible.inventory_path = "vagrant_inventory"
      #ansible.ask_sudo_pass = true
      ansible.extra_vars = { hosts: "vagrant" , bizportal_build_env: "workstation"}
      ansible.host_key_checking = false
      ansible.sudo = true
      ansible.limit = 'all'
      ansible.tags = ENV['TAGS']
      ansible.raw_arguments  = "--ask-vault-pass"
  
  end
end
