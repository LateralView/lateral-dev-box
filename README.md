# Lateral Dev Box

## Introduction

This project is inspired in the [rails-dev-box](https://github.com/rails/rails-dev-box). It automates the setup of a development environment for working on Ruby on Rails and MEAN stack.

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

## How to build the Virtual Machine

```
host $ git clone https://github.com/LateralView/lateral-dev-box.git
host $ cd lateral-dev-box
host $ vagrant up
```

After the installation has finished, you can access the virtual machine with

```
host $ vagrant ssh
Welcome to Ubuntu 14.04.2 LTS (GNU/Linux 3.13.0-55-generic x86_64)
...
vagrant@lateral-dev-box:~$
```

Ports 3000 (Ruby on Rails), 8085 (Express), 15672 (RabbitMQ Management Plugin), 3306 (MySQL) and 27017 (MongoDB) in the host computer are forwarded to the same ports in the virtual machine. If your MEAN apps run in a different port than 8085, please change it from Vagrantfile.


## What's in the Box

* Development tools
* Git
* RVM with Ruby 2.1.2
* SQLite3, MySQL, MongoDB
* System dependencies for nokogiri, sqlite3, mysql, mysql2, and Capybara
* Memcached
* Redis
* RabbitMQ
* Node.js
* Npm
* Npm global modules: nodemon, grunt-cli, mocha

### RabbitMQ

By default, RabbitMQ server is not running. If you want to start it, just run `sudo service rabbitmq-server start`. And if you want to start the service automatically on boot, run `sudo update-rc.d rabbitmq-server defaults`.

### NFS

If you're using Mac OS X or Linux you can increase the performance with Vagrant's NFS synced folders.

With an NFS server installed (already installed on Mac OS X), uncomment the following from the Vagrantfile:

```ruby
config.vm.network :private_network, ip: '192.168.50.77'
config.vm.synced_folder "/path/to/your/folder", "/home/vagrant/projects", nfs: true
```

Please check the Vagrant documentation on [NFS synced folders](http://docs.vagrantup.com/v2/synced-folders/nfs.html) for more information.

### Windows

For using on a Windows host you need to install OpenSSH and RSync
One way to get them is installing Cygwin and selecting the rsync and openssh packages during installation.
After that, check if the rsync and ssh commands are available in the command prompt. If not, you should add your cygwin/bin path to the PATH environment variable.

In your Vagrantfile, make sure you are setting up your synced folders using RSync instead of NFS. Even though NFS can work on Windows, it's extremely slow compared to RSync

```ruby
config.vm.synced_folder "/path/to/your/folder", "/home/vagrant/projects",  type: "rsync"
```
Please check the Vagrant documentation on [RSync synced folders](https://www.vagrantup.com/docs/synced-folders/rsync.html) for more information.

###Happy coding!
