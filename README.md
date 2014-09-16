module for rabbitMQ

The purpose is to use it for sensu.

This is how I define it in hiera::

    ---
    classes: 
        - rabbitmq
        - rabbitmq::config::sensu

    rabbitmq::config::sensu::rabbitmq_sensu_password: "secret"
                
