#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.5.1
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

ruby_block "insert line 1.5.1 limits.conf" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/security/limits.conf")
    fe.insert_line_if_no_match(/\* hard core 0/, '* hard core 0')
    fe.write_file
  end
end

ruby_block "insert line 1.5.1 sysctl.conf" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/sysctl.conf")
    fe.insert_line_if_no_match(/fs.suid_dumpable = 0/, 'fs.suid_dumpable = 0')
    fe.write_file
  end
end

execute 'set parameter 1.5.1' do
  command 'sysctl -w fs.suid_dumpable=0'
end
