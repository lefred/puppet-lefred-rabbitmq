class rabbitmq::packages {
  
  case $::osfamily {
          'RedHat': {
                $require = Yumrepo['epel']
                $packs   = "rabbitmq-server"
                $rabbitmq_server_bin = "rabbitmq-server"
          }
          'Debian': {
                $require = undef
                $rabbitmq_server_bin = "rabbitmq-server"
          }
  }
  
  package {
        $packs:
          require => $require,
          ensure => "installed";
  }  
}