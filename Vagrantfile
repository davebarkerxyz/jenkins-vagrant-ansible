# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.56.12"
  #config.vm.synced_folder "data", "/srv/hostdata"
  # config.vm.provider "virtualbox" do |vb|
  #   vb.memory = "1024"
  # end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
  end
end
