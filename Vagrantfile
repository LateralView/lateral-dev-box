# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'lateral-dev-box'

  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
  end

  # Rails Apps
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  # MEAN Apps
  config.vm.network :forwarded_port, guest: 8085, host: 8085
  # RabbitMQ management plugin
  config.vm.network :forwarded_port, guest: 15672, host: 15672
  # MongoDB
  config.vm.network :forwarded_port, guest: 27017, host: 27017
  # MySQL
  config.vm.network :forwarded_port, guest: 3306, host: 3306

  config.vm.provision :shell, path: 'provisioners/rails.sh', keep_color: true
  config.vm.provision :shell, path: 'provisioners/rabbit.sh', keep_color: true
  config.vm.provision :shell, path: 'provisioners/mean.sh', keep_color: true
  config.vm.provision :shell, path: 'provisioners/rvm.sh', keep_color: true, privileged: false
  config.vm.provision :shell, inline: "echo Happy coding!"

  config.ssh.forward_agent = true

  # NFS
  # config.vm.network :private_network, ip: '192.168.50.77'
  # config.vm.synced_folder "/path/to/your/folder", "/home/vagrant/projects", nfs: true
end
