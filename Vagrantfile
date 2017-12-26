# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.ssh.insert_key = false
  config.vm.box = "carroarmato0/centos7-puppet4"
  config.vm.box_check_update = true

  config.vm.synced_folder "puppet/hiera_data", "/var/lib/hiera"

  config.vm.provision "puppet" do |puppet|
    env = 'dev'
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.environment = "puppet"
    puppet.environment_path = "."
    puppet.options = "--verbose --debug"
  end

  config.vm.define "kube-master" do |node|
    node.vm.hostname = "kube-master.jexia.cloud"
    node.vm.network "private_network", ip: "192.168.10.60"
    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end

  (1..2).each do |d|
    config.vm.define "kube-node#{d}" do |node|
      node.vm.network "private_network", ip: "192.168.10.7#{d}" # 192.168.10.71, 192.168.10.72, 192.168.10.73
      node.vm.hostname = "kube-node#{d}.jexia.cloud"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end
  end

end
