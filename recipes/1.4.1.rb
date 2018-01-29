#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.4.1
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

execute 'chmod_and_chown' do
  command 'chmod 600 /boot/grub2/grub.cfg; chown root:root /boot/grub2/grub.cfg'
end
