#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.6.1.1
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

execute 'grub2_mkconfig_1.6.1.1' do
  command 'grub2-mkconfig -o /boot/grub2/grub.cfg'
  action :nothing
end

ruby_block "remove_line_1.6.1.1" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/default/grub")
    fe.search_file_delete(/selinux=0/)
    fe.search_file_delete(/enforcing=0/)
    fe.write_file
  end
  notifies :run, 'execute[grub2_mkconfig_1.6.1.1]', :immediately
end
