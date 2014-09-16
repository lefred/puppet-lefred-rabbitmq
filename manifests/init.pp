class rabbitmq {

	#include rabbitmq::config
	#include rabbitmq::packages
	#include rabbitmq::service
	
	Class['rabbitmq::packages'] -> Class['rabbitmq::config'] ->  Class['rabbitmq::service'] -> Class['rabbitmq::config']
   

}