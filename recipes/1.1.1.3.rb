#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.1.1.3
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

file '/etc/modprobe.d/CIS.conf' do
  mode '0644'
  owner 'root'
  group 'root'
  action :create_if_missing
end

ruby_block "insert line 1.1.1.3" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/modprobe.d/CIS.conf")
    fe.insert_line_if_no_match(/install jffs2 \/bin\/true/, "install jffs2 /bin/true")
    fe.write_file
  end
end
