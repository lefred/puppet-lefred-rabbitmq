class rabbitmq::config {
  
  file {
           "/etc/rabbitmq/rabbitmq.config":
                ensure  => present,
                source => [
                            "puppet:///modules/rabbitmq/$hostname/rabbitmq.config",                            
                            "puppet:///modules/rabbitmq/rabbitmq.config"
                          ],
                notify => Service['rabbitmq-server']
  } 
  
  file {
          "/etc/rabbitmq/ssl/":
                ensure  => present,
                recurse => true,
                source  => "puppet:///modules/rabbitmq/ssl/" 
  }
  
}