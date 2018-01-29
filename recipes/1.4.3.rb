#
# Cookbook:: cis-centos-linux-7-benchmark-section-one
# Recipe:: 1.4.3
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

ruby_block "insert line 1.4.3 rescue.service" do
  block do
    fe = Chef::Util::FileEdit.new("/usr/lib/systemd/system/rescue.service")
    fe.insert_line_if_no_match(/ExecStart\=\-\/bin\/sh -c \"\/usr\/sbin\/sulogin\; \/usr\/bin\/systemctl --fail --no-block default\"/, 'ExecStart\=\-\/bin\/sh -c \"\/sbin\/sulogin\; \/usr\/bin\/systemctl --fail --no-block default\"')
    fe.write_file
  end
end

ruby_block "insert line 1.4.3 emergency.service" do
  block do
    fe = Chef::Util::FileEdit.new("/usr/lib/systemd/system/emergency.service")
    fe.insert_line_if_no_match(/ExecStart\=\-\/bin\/sh -c \"\/usr\/sbin\/sulogin\; \/usr\/bin\/systemctl --fail --no-block default\"/, 'ExecStart=-/bin/sh -c \"/sbin/sulogin; /usr/bin/systemctl --fail --no-block default\"')
    fe.write_file
  end
end
