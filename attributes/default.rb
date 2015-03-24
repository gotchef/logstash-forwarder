#
# recipe::default
#
default['go']['version'] = '1.4.1'

name = 'logstash-forwarder'

default[:logstash_forwarder][:build][:repository] = "https://github.com/elastic/logstash-forwarder.git"
default[:logstash_forwarder][:build][:revision] = "master"
default[:logstash_forwarder][:build][:command] = "" # make || go install (default)
default[:logstash_forwarder][:service][:run_file] = 'logstash-forwarder'
default[:logstash_forwarder][:service][:name] = name

default[:github][:deploy_key] = "passed in"

