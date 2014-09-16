class rabbitmq::config::sensu ($rabbitmq_sensu_password="fred") {
  
  
  exec { 
    'add_vhost_sensu':
        command   => "rabbitmqctl add_vhost /sensu",
        logoutput => true,
        unless    => "rabbitmqctl list_vhosts | grep '/sensu' > /dev/null",
        path      => '/usr/local/sbin:/usr/bin:/usr/local/bin',
        require   => Class['rabbitmq::config'];
    'add_user_sensu':
        command   => "rabbitmqctl add_user sensu $rabbitmq_sensu_password",
        logoutput => true,
        unless    => "rabbitmqctl list_users | grep 'sensu' > /dev/null",
        path      => '/usr/local/sbin:/usr/bin:/usr/local/bin';
    'set_permission_sensu':
        command   => 'rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"',
        logoutput => true,
        unless    => "rabbitmqctl list_permissions -p /sensu | grep 'sensu' > /dev/null",
        path      => '/usr/local/sbin:/usr/bin:/usr/local/bin';
 }
 
 
        
  
}