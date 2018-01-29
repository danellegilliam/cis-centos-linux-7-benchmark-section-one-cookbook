#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.5.4
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

execute 'restore_binaries_1.5.4' do
  command 'prelink -ua'
  action :nothing
end

package 'remove prelink 1.5.4' do
  action :remove
  notifies :run, 'execute[restore_binaries_1.5.4]', :before
end
