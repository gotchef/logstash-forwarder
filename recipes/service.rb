#
# recipe::service
#

include_recipe 'go-service'

go_service_service do
	service node[:logstash_forwarder][:service]
end
