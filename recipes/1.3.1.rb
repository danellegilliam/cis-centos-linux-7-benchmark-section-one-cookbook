#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.3.1
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

execute 'initialize_aide' do
  command 'aide --init'
  action :nothing
  notifies :run, 'execute[move_file]', :immediately
end

execute 'move_file' do
  command 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz'
  action :nothing
end

package 'aide' do
  action :install
  notifies :run, 'execute[initialize_aide]', :immediately
end
