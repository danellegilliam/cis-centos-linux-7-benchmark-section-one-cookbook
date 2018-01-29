#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.7.1.6
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

file '/etc/issue.net' do
  mode '0644'
  owner 'root'
  group 'root'
end
