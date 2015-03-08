#
# recipe::service
#

include_recipe 'runit'

service = node[:logstash_forwarder][:service]
service_name = service[:name]

config_dir = "#{service[:config_root]}/#{service_name}"
executable_path="#{service[:deploy_root]}/#{service_name}/current/bin/logstash-forwarder -config #{config_dir}/active/" # all json in folder

log_dir = "#{service[:log_root]}/#{service_name}"
directory log_dir do
	group service[:group]
	owner service[:user]
	mode "0775"
	action :create
	recursive true
end

runit_service service_name do
	default_logger true
	sv_timeout service[:timeout]

	options({
		:exec => executable_path,
		:user => service[:user],
		:log_dir => log_dir
	})
	action [:enable, :start]
end
