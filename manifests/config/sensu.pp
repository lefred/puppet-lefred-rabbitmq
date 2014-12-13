class rabbitmq::config::sensu ($rabbitmq_sensu_password="fred") {
  
  
  exec { 
    'add_vhost_sensu':
        command   => "rabbitmqctl add_vhost /sensu",
        logoutput => true,
        unless    => "rabbitmqctl list_vhosts | grep '/sensu' > /dev/null",
        path      => '/usr/sbin:/bin:/usr/local/sbin:/usr/bin:/usr/local/bin',
        require   => Service['rabbitmq-server'];
    'add_user_sensu':
        command   => "rabbitmqctl add_user sensu $rabbitmq_sensu_password",
        logoutput => true,
        unless    => "rabbitmqctl list_users | grep 'sensu' > /dev/null",
        path      => '/usr/sbin:/bin:/usr/local/sbin:/usr/bin:/usr/local/bin',
        require   => Exec['add_vhost_sensu'];
    'set_permission_sensu':
        command   => 'rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"',
        logoutput => true,
        unless    => "rabbitmqctl list_permissions -p /sensu | grep '^sensu' > /dev/null",
        path      => '/usr/sbin:/bin:/usr/local/sbin:/usr/bin:/usr/local/bin',
        require   => Exec["add_user_sensu"];
 }
 
 
        
  
}
