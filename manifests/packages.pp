class rabbitmq::packages {

  $packs   = "rabbitmq-server"
   
  case $::osfamily {
          'RedHat': {
                $require = Yumrepo['epel']
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