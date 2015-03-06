#
# recipe::service
#

include_recipe 'runit'

service = node[:logstash_forwarder][:go_service]
service_name = service[:service_name]
config_root = "#{service[:conf_link_dir]}/#{service_name}"

# references the whole config directory, so all configs in the directory will be picked up
executable_path="#{service[:deploy_to]}/#{service_name}/current/bin/logstash-forwarder -config #{config_root}/active/"

log_dir = "/var/log/#{service_name}"

directory log_dir do
	group group
	owner user
	mode "0775"
	action :create
	recursive true
end

runit_service service_name do
	default_logger true
	sv_timeout 60

	options({
		:exec => executable_path,
		:user => service[:user],
		:log_dir => log_dir
	})
	action [:enable, :start]
end
