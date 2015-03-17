#
# recipe::default
#
default['go']['version'] = '1.4.1'

name = 'logstash-forwarder'

default[:logstash_forwarder][:build][:repository] = "https://github.com/elastic/logstash-forwarder.git"
default[:logstash_forwarder][:build][:branch] = "master"
default[:logstash_forwarder][:build][:command] = "" # make || go install (default)
default[:logstash_forwarder][:build][:go_main_dir] = nil #root dir "logstash_forwarder"

default[:logstash_forwarder][:service][:install_root] = "/opt"
default[:logstash_forwarder][:service][:config_root] = "/etc"
default[:logstash_forwarder][:service][:log_root] = "/var/log"
default[:logstash_forwarder][:service][:timeout] = 60
default[:logstash_forwarder][:service][:name] =  name
default[:logstash_forwarder][:service][:user] = name
default[:logstash_forwarder][:service][:group] = name

default[:github][:deploy_key] = "passed in"

