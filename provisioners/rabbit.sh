function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

# Rabbit MQ
install RabbitMQ rabbitmq-server
rabbitmq-plugins enable rabbitmq_management >/dev/null 2>&1
service rabbitmq-server restart >/dev/null 2>&1
