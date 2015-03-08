#
# recipe::configure
#

service = node[:logstash_forwarder][:service]
service_name = service[:name]

user = service[:user]
group = service[:group]

runit_service service_name do
	action :nothing # only define so that it can be restarted if the config changed
end

config_root = "#{service[:config_root]}/#{service_name}"

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
	cookbook 'logstash-forwarder'
	mode '0664'
	owner user
	group group
	variables()
	notifies :restart, "runit_service[#{service_name}]"
end


