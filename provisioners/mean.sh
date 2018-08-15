function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

# MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 >/dev/null 2>&1
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list >/dev/null 2>&1
apt-get update >/dev/null 2>&1
install MongoDB mongodb-org
replace "bindIp: 127.0.0.1" "#bindIp: 127.0.0.1" -- /etc/mongod.conf >/dev/null 2>&1
service mongod restart >/dev/null 2>&1

# Node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - >/dev/null 2>&1
install Nodejs nodejs
install npm npm

# Npm global modules
echo "installing npm global modules"
echo "install nodemon"
npm install nodemon -g >/dev/null 2>&1
echo "install grunt-cli"
npm install grunt-cli -g >/dev/null 2>&1
echo "install mocha"
npm install mocha -g >/dev/null 2>&1