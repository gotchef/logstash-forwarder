#
# logstash-forwarder::install-source
#


include_recipe 'golang'
include_recipe 'runit'
include_recipe 'go-chef'

service_name = node[:logstash_forwarder][:service][:name]

runit_service service_name do
	action :stop 
end

go_service_deploy do 
	service node[:logstash_forwarder][:service]
	build	node[:logstash_forwarder][:build]
	key		nil
	notifies :restart, "runit_service[#{service_name}]"
end

