#
# Cookbook Name:: logstash-forwarder
# Recipe:: default
#
# Copyright (C) 2015 Franklin Wise
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'logstash-forwarder::install-source'
include_recipe 'logstash-forwarder::configure'
include_recipe 'logstash-forwarder::service'
