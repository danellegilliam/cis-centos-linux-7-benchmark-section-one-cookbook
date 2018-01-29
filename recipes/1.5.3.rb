#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.5.3
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

ruby_block "insert line 1.5.3 sysctl.conf" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/sysctl.conf")
    fe.search_file_replace(/kernel.randomize_va_space = [013456789]/, 'kernel.randomize_va_space = 2')
    fe.insert_line_if_no_match(/kernel.randomize_va_space = 2/, 'kernel.randomize_va_space = 2')
    fe.write_file
  end
end

execute 'set parameter 1.5.3' do
  command 'sysctl -w kernel.randomize_va_space=2'
end
