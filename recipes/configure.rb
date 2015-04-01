#
# recipe::configure
#

service = node[:logstash_forwarder][:service]
service_name = service[:name]

runit_service service_name do
	action :nothing # only define so that it can be restarted if the config changed
end

template "#{Chef::GoService.config_dir(service)}/config.json" do
	source 'config.json.erb'
	cookbook 'logstash-forwarder'
	mode '0664'
	owner Chef::GoService.user(service)
	group Chef::GoService.group(service)
	variables()
	notifies :restart, "runit_service[#{service_name}]"
end


