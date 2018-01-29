#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.3.2
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

cron 'aide' do
  hour '5'
  minute '0'
  command '/usr/sbin/aide --check'
end
