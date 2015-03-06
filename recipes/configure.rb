#
# recipe::configure
#

service = node[:logstash_forwarder][:go_service]
service_name = service[:service_name]

runit_service service_name do
	action :nothing # only define so that it can be restarted if the config changed
end

config_root = "#{service[:conf_link_dir]}/#{service_name}"

directory "#{config_root}/active" do
	group group
	owner user
	mode '0775'
	action :create
end

directory "#{config_root}/inactive" do
	group group
	owner user
	mode '0775'
	action :create
end

template "#{config_root}/active/config.json" do
	source 'config.json.erb'
	mode '0660'
	owner service[:user]
	group service[:group]
	variables()
	notifies :restart, "runit_service[#{service_name}]"
end


