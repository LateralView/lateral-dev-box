function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Git git
install SQLite sqlite3 libsqlite3-dev
install memcached memcached
install Redis redis-server
install ImageMagick imagemagick libmagickwand-dev
install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'Capybara dependencies' qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x libqt4-dev libqtwebkit-dev xvfb

# MySQL
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
install MySQL mysql-server libmysqlclient-dev

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
