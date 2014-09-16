class rabbitmq::packages {

  $packs   = "rabbitmq-server"
   
  case $::osfamily {
          'RedHat': {
                $require = "require => Yumrepo['epel']"
                $rabbitmq_server_bin = "rabbitmq-server"
          }
          'Debian': {
                $require = ""
                $rabbitmq_server_bin = "rabbitmq-server"
          }
  }
  
  package {
        $packs:
          $require,
          ensure => "installed";
  }  
}