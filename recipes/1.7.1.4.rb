#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.7.1.4
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

file '/etc/motd' do
  mode '0644'
  owner 'root'
  group 'root'
end
