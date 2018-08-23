# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/xenial64'
  config.vm.hostname = 'lateral-dev-box'

  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
  end

  # MEAN Apps
  config.vm.network :forwarded_port, guest: 8085, host: 8085
  # ElasticMQ
  config.vm.network :forwarded_port, guest: 9324, host: 9324
  # MongoDB
  config.vm.network :forwarded_port, guest: 27017, host: 27017
  
  config.vm.provision :file, source: "provisioners/welcome", destination: "/tmp/welcome"
  config.vm.provision :shell, path: 'provisioners/welcome.sh', keep_color: true
  config.vm.provision :shell, path: 'provisioners/awscli.sh', keep_color: true
  config.vm.provision :shell, path: 'provisioners/mean.sh', keep_color: true
  config.vm.provision :file, source: "provisioners/elasticmq", destination: "/tmp/elasticmq/elasticmq.conf"
  config.vm.provision :shell, path: "provisioners/elasticmq.sh", keep_color: true
  config.vm.provision :file, source: "provisioners/aws", destination: "~/.aws/credentials"
  config.vm.provision "docker" do |d|
    d.run "s12v/elasticmq",
      args: "-p 9324:9324"
  end

  config.vm.provision :shell, inline: "echo Happy coding!"

  config.ssh.forward_agent = true

  # NFS
  # config.vm.network :private_network, ip: '192.168.50.77'
  # config.vm.synced_folder "/path/to/your/folder", "/home/vagrant/projects", nfs: true
end
