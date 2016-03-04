function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

# Rabbit MQ
install RabbitMQ rabbitmq-server
rabbitmq-plugins enable rabbitmq_management >/dev/null 2>&1
service rabbitmq-server stop >/dev/null 2>&1
update-rc.d -f rabbitmq-server remove >/dev/null 2>&1