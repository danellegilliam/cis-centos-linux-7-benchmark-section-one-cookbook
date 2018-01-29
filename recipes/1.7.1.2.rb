#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.7.1.2
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

file '/etc/issue' do
  content 'Authorized uses only. All activity may be monitored and reported.'
  mode '0644'
  owner 'root'
  group 'root'
end
