#
# logstash-forwarder::install-source
#


include_recipe 'golang'
include_recipe 'runit'
include_recipe 'go-chef'

service_name = node[:logstash_forwarder][:go_service][:service_name]

runit_service service_name do
	action :stop 
end

go_service_deploy do 
	settings node[:logstash_forwarder][:go_service]

	notifies :restart, "runit_service[#{service_name}]"
end

