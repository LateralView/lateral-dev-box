echo "installing RVM and ruby 2.1.2"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 >/dev/null 2>&1
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2 >/dev/null 2>&1
source /home/vagrant/.rvm/scripts/rvm >/dev/null 2>&1
