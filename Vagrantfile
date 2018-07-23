Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true

  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4000
  end

  # system provision
  config.vm.provision "shell", path: "vagrant/provision.sh"
end
