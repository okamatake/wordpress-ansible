# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"

  config.vm.define :local_wp do |node|
    node.vm.network "forwarded_port", guest: 80, host: 8080
    node.vm.network "private_network", ip: "192.168.132.61"
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "site.yml"
      ansible.limit = "all"
      ansible.groups = {
        "wordpress-server" => ["local_wp"]
      }
    end
  end
end

