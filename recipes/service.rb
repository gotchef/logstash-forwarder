#
# recipe::service
#

include_recipe 'go-service'

service = node[:logstash_forwarder][:service]

go_service_service do
	service_name	service[:name]
	run_file		service[:run_file]
	run_args		"-config #{Chef::GoService.config_root(service)}/#{service[:name]}/"
end
