class rabbitmq::service{
  
  service {
    "rabbitmq-server":
            enable    => true,
            name      => $rabbitmq::packages::rabbitmq_server_bin,
            ensure    => running,
            require   => Package[$rabbitmq::packages::packs],
            subscribe => File["/etc/rabbitmq/rabbitmq.config"] 
  }
  
}