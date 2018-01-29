#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.7.1.1
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

ruby_block "1.7.1.1" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/motd")
    fe.search_file_delete(/\\m/)
    fe.search_file_delete(/\\r/)
    fe.search_file_delete(/\\s/)
    fe.search_file_delete(/\\v/)
    fe.write_file
  end
end
