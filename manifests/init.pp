class rabbitmq {

	include rabbitmq::packages
	include rabbitmq::config
	include rabbitmq::service
	
	Class['rabbitmq::packages'] -> Class['rabbitmq::config'] ->  Class['rabbitmq::service'] -> Class['rabbitmq::config']
   

}