# # encoding: utf-8

# Inspec test for recipe cis-centos-linux-7-benchmark-section-one::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control "1.1.1.1" do
  impact 1.0
  title "Ensure mounting of cramfs filesystems is disabled (Scored)"
  desc "The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems. A cramfs image can be used without having to first decompress the image.'."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install cramfs /bin/true' }
  end
end

control "1.1.1.2" do
  impact 1.0
  title "Ensure mounting of freevxfs filesystems is disabled (Scored)"
  desc "The freevxfs filesystem type is a free version of the Veritas type filesystem. This is the primary filesystem type for HP-UX operating systems."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install freevxfs /bin/true' }
  end
end

control "1.1.1.3" do
  impact 1.0
  title "Ensure mounting of jffs2 filesystems is disabled (Scored)"
  desc "The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install jffs2 /bin/true' }
  end
end

control "1.1.1.4" do
  impact 1.0
  title "Ensure mounting of hfs filesystems is disabled (Scored)"
  desc "The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install hfs /bin/true' }
  end
end

control "1.1.1.5" do
  impact 1.0
  title "Ensure mounting of hfsplus filesystems is disabled (Scored)"
  desc "The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows you to mount Mac OS filesystems."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install hfsplus /bin/true' }
  end
end

control "1.1.1.6" do
  impact 1.0
  title "Ensure mounting of squashfs filesystems is disabled (Scored)"
  desc "The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs ). A squashfs image can be used without having to first decompress the image."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install squashfs /bin/true' }
  end
end

control "1.1.1.7" do
  impact 1.0
  title "Ensure mounting of udf filesystems is disabled (Scored)"
  desc "The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications. This is an open vendor filesystem type for data storage on a broad range of media. This filesystem type is necessary to support writing DVDs and newer optical disc formats."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install udf /bin/true' }
  end
end

control "1.1.1.8" do
  impact 1.0
  title "Ensure mounting of FAT filesystems is disabled (Scored)"
  desc "The FAT filesystem format is primarily used on older windows systems and portable USB drives or flash modules. It comes in three types FAT12 , FAT16 , and FAT32 all of which are supported by the vfat kernel module."
  describe file('/etc/modprobe.d/CIS.conf') do
    its('content') { should match 'install vfat /bin/true' }
  end
end

control "1.1.2" do
  impact 2.0
  title "Ensure separate partition exists for /tmp (Scored)"
  desc "The /tmp directory is a world-writable directory used for temporary storage by all users and some applications."
  describe command('mount | grep /tmp') do
    its('stdout') { should match /tmpfs on \/tmp type tmpfs/ }
  end
end

control "1.1.3" do
  impact 1.0
  title "Ensure nodev option set on /tmp partition (Scored)"
  desc "The nodev mount option specifies that the filesystem cannot contain special devices."
  describe command('mount | grep /tmp') do
    its('stdout') { should match /tmpfs on \/tmp type tmpfs .*,nodev/ }
  end
end

control "1.1.4" do
  impact 1.0
  title "Ensure nosuid option set on /tmp partition (Scored)"
  desc "The nosuid mount option specifies that the filesystem cannot contain setuid files."
  describe command('mount | grep /tmp') do
    its('stdout') { should match /tmpfs on \/tmp type tmpfs .*,nosuid/ }
  end
end

control "1.1.5" do
  impact 1.0
  title "Ensure noexec option set on /tmp partition (Scored)"
  desc "The noexec mount option specifies that the filesystem cannot contain executable binaries."
  describe command('mount | grep /tmp') do
    its('stdout') { should match /tmpfs on \/tmp type tmpfs .*,noexec/ }
  end
end

control "1.1.6" do
  impact 2.0
  title "Ensure separate partition exists for /var (Scored)"
  desc "The /var directory is used by daemons and other system services to temporarily store dynamic data. Some directories created by these processes may be world-writable."
  describe command('mount | grep /var') do
    its('stdout') { should match /.* on \/var type .*rw/ }
  end
end

control "1.1.7" do
  impact 2.0
  title "1.1.7 Ensure separate partition exists for /var/tmp"
  desc "The /var/tmp directory is a world-writable directory used for temporary storage by all users and some applications."
  describe command('mount | grep /var/tmp') do
    its('stdout') { should match /.* on \/var\/tmp type .*rw/ }
  end
end

control "1.1.8" do
  impact 1.0
  title "Ensure nodev option set on /var/tmp partition (Scored)"
  desc "The nodev mount option specifies that the filesystem cannot contain special devices."
  describe command('mount | grep /var/tmp') do
    its('stdout') { should match /tmpfs on \/var\/tmp type tmpfs .*,nodev/ }
  end
end

control "1.1.9" do
  impact 1.0
  title "Ensure nosuid option set on /var/tmp partition (Scored)"
  desc "The nosuid mount option specifies that the filesystem cannot contain setuid files."
  describe command('mount | grep /var/tmp') do
    its('stdout') { should match /tmpfs on \/var\/tmp type tmpfs .*,nosuid/ }
  end
end

control "1.1.10" do
  impact 1.0
  title "Ensure noexec option set on /var/tmp partition (Scored)"
  desc "The noexec mount option specifies that the filesystem cannot contain executable binaries."
  describe command('mount | grep /var/tmp') do
    its('stdout') { should match /tmpfs on \/var\/tmp type tmpfs .*,noexec/ }
  end
end

control "1.1.11" do
  impact 2.0
  title "Ensure separate partition exists for /var/log (Scored)"
  desc "The /var/log directory is used by system services to store log data ."
  describe command('mount | grep /var/log') do
    its('stdout') { should match /.* on \/var\/log type .*rw/ }
  end
end

control "1.1.12" do
  impact 2.0
  title "Ensure separate partition exists for /var/log/audit (Scored)"
  desc "The auditing daemon, auditd , stores log data in the /var/log/audit directory."
  describe command('mount | grep /var/log/audit') do
    its('stdout') { should match /.* on \/var\/log\/audit type .*rw/ }
  end
end

control "1.1.13" do
  impact 2.0
  title "Ensure separate partition exists for /home (Scored)"
  desc "The /home directory is used to support disk storage needs of local users."
  describe command('mount | grep /home') do
    its('stdout') { should match /.* on \/home type .*rw/ }
  end
end

control "1.1.14" do
  impact 1.0
  title "Ensure nodev option set on /home partition (Scored)"
  desc "The nodev mount option specifies that the filesystem cannot contain special devices."
  describe command('mount | grep /home') do
    its('stdout') { should match /.* on \/home type .*,nodev/ }
  end
end

control "1.1.15" do
  impact 1.0
  title "Ensure nodev option set on /dev/shm partition (Scored)"
  desc "The nodev mount option specifies that the filesystem cannot contain special devices."
  describe command('mount | grep /dev/shm') do
    its('stdout') { should match /tmpfs on \/dev\/shm type tmpfs .*,nodev/ }
  end
end

control "1.1.16" do
  impact 1.0
  title "Ensure nosuid option set on /dev/shm partition (Scored)"
  desc "The nosuid mount option specifies that the filesystem cannot contain setuid files."
  describe command('mount | grep /dev/shm') do
    its('stdout') { should match /tmpfs on \/dev\/shm type tmpfs .*,nosuid/ }
  end
end

control "1.1.17" do
  impact 1.0
  title "Ensure noexec option set on /dev/shm partition (Scored)"
  desc "The noexec mount option specifies that the filesystem cannot contain executable binaries."
  describe command('mount | grep /dev/shm') do
    its('stdout') { should match /tmpfs on \/dev\/shm type tmpfs .*,noexec/ }
  end
end

control "1.1.18" do
  impact 1.0
  title "Ensure nodev option set on removable media partitions (Not Scored)"
  desc "The nodev mount option specifies that the filesystem cannot contain special devices."
end

control "1.1.19" do
  impact 1.0
  title "Ensure nosuid option set on removable media partitions (Not Scored)"
  desc "The nosuid mount option specifies that the filesystem cannot contain setuid files."
end

control "1.1.20" do
  impact 1.0
  title "Ensure noexec option set on removable media partitions (Not Scored)"
  desc "The noexec mount option specifies that the filesystem cannot contain executable binaries."
end

control "1.1.21" do
  impact 1.0
  title "Ensure sticky bit is set on all world-writable directories (Scored)"
  desc "Setting the sticky bit on world writable directories prevents users from deleting or renaming files in that directory that are not owned by them."
  describe command("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d ( -perm -0002 -a ! -perm -1000 ) 2>/dev/null") do
    its('stdout') { should eq '' }
  end
end

control "1.1.22" do
  impact 1.0
  title "Disable Automounting (Scored)"
  desc "autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives."
  describe systemd_service('autofs') do
    it { should_not be_enabled }
  end
end

control "1.2.1" do
  impact 1.0
  title "Ensure package manager repositories are configured (Not Scored)"
  desc "Systems need to have package manager repositories configured to ensure they receive the latest patches and updates."
end

control "1.2.2" do
  impact 1.0
  title "Ensure GPG keys are configured (Not Scored)"
  desc "Most packages managers implement GPG key signing to verify package integrity during installation."
end

control "1.2.3" do
  impact 1.0
  title "Ensure gpgcheck is globally activated (Scored)"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/* files determines if an RPM package's signature is checked prior to its installation."
end

control "1.3.1" do
  impact 1.0
  title "Ensure AIDE is installed (Scored)"
  desc "AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be used to compare against the current state of the filesystem to detect modifications to the system."
  describe package('aide') do
    it { should be_installed }
  end
end

control "1.3.2" do
  impact 1.0
  title "Ensure filesystem integrity is regularly checked (Scored)"
  desc "Periodic checking of the filesystem integrity is needed to detect changes to the filesystem."
  describe crontab('root') do
    its('commands') { should include '/usr/sbin/aide --check' }
  end
end

control "1.4.1" do
  impact 1.0
  title "Ensure permissions on bootloader config are configured (Scored)"
  desc "The grub configuration file contains information on boot settings and passwords for unlocking boot options. The grub configuration is usually located at /boot/grub2/grub.cfg and linked as /etc/grub2.cfg . Additional settings can be found in the /boot/grub2/user.cfg file."
  describe file('/boot/grub2/grub.cfg') do
    its('mode') { should cmp '00600' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end

control "1.4.2" do
  impact 1.0
  title "Ensure bootloader password is set (Scored)"
  desc "Setting the boot loader password will require that anyone rebooting the system must enter a password before being able to set command line boot parameters"
end

control "1.4.3" do
  impact 1.0
  title "Ensure authentication required for single user mode (Scored)"
  desc "Single user mode (rescue mode) is used for recovery when the system detects an issue during boot or by manual selection from the bootloader."
  describe command("grep /sbin/sulogin /usr/lib/systemd/system/rescue.service") do
    its('stdout') { should match /.*sulogin; .*/ }
  end
  describe command("grep /sbin/sulogin /usr/lib/systemd/system/emergency.service") do
    its('stdout') { should match /.*sulogin; .*/ }
  end
end

control "1.5.1" do
  impact 1.0
  title "Ensure core dumps are restricted (Scored)"
  desc "A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps, but this can be overridden by the user."
  describe file("/etc/security/limits.conf") do
    its('content') { should match /\* hard core 0/ }
  end
  describe command('sysctl fs.suid_dumpable') do
    its('stdout') { should match /fs.suid_dumpable = 0/ }
  end
  describe file("/etc/sysctl.conf") do
    its('content') { should match /fs.suid_dumpable = 0/ }
  end
end

control "1.5.2" do
  impact 1.0
  title "Ensure XD/NX support is enabled (Not Scored)"
  desc "Recent processors in the x86 family support the ability to prevent code execution on a per memory page basis. Generically and on AMD processors, this ability is called No Execute (NX), while on Intel processors it is called Execute Disable (XD). This ability can help prevent exploitation of buffer overflow vulnerabilities and should be activated whenever possible. Extra steps must be taken to ensure that this protection is enabled, particularly on 32-bit x86 systems. Other processors, such as Itanium and POWER, have included such support since inception and the standard kernel for those platforms supports the feature."
  describe command('dmesg | grep "NX (Execute Disable) protection"') do
    its('stdout') { should match /NX \(Execute Disable\) protection: active/ }
  end
end

control "1.5.3" do
  impact 1.0
  title "Ensure address space layout randomization (ASLR) is enabled (Scored)"
  desc "Address space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space of key data areas of a process."
  describe command('sysctl kernel.randomize_va_space') do
    its('stdout') { should match /kernel.randomize_va_space = 2/ }
  end
  describe file("/etc/sysctl.conf") do
    its('content') { should match /kernel.randomize_va_space = 2/ }
  end
end

control "1.5.4" do
  impact 1.0
  title "Ensure prelink is disabled (Scored)"
  desc "prelink is a program that modifies ELF shared libraries and ELF dynamically linked binaries in such a way that the time needed for the dynamic linker to perform relocations at startup significantly decreases."
  describe package('prelink') do
    it { should_not be_installed }
  end
end

control "1.6.1.1" do
  impact 1.0
  title "Ensure SELinux is not disabled in bootloader configuration (Scored)"
  desc "Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters."
  describe file('/etc/default/grub') do
    its('content') { should_not match /.*selinux=0.*/ }
    its('content') { should_not match /.*enforcing=0.*/ }
  end
end

control "1.6.1.2" do
  impact 2.0
  title "Ensure the SELinux state is enforcing (Scored)"
  desc "Set SELinux to enable when the system is booted."
  describe file('/etc/selinux/config') do
    its('content') { should match /SELINUX=enforcing/ }
  end
end

control "1.6.1.3" do
  impact 2.0
  title "Ensure SELinux policy is configured (Scored)"
  desc "Configure SELinux to meet or exceed the default targeted policy, which constrains daemons and system software only."
  describe file('/etc/selinux/config') do
    its('content') { should match /SELINUXTYPE=targeted/ }
  end
end

control "1.6.1.4" do
  impact 2.0
  title "Ensure SETroubleshoot is not installed (Scored)"
  desc "The SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. The service provides important information around configuration errors, unauthorized intrusions, and other potential errors."
  describe package('setroubleshoot') do
    it { should_not be_installed }
  end
end

control "1.6.1.5" do
  impact 2.0
  title "Ensure the MCS Translation Service (mcstrans) is not installed (Scored)"
  desc "The mcstransd daemon provides category label information to client processes requesting information. The label translations are defined in /etc/selinux/targeted/setrans.conf"
  describe package('mcstrans') do
    it { should_not be_installed }
  end
end

control "1.6.1.6" do
  impact 2.0
  title "Ensure no unconfined daemons exist (Scored)"
  desc "Daemons that are not defined in SELinux policy will inherit the security context of their parent process."
  describe command('ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr \':\' \' \' | awk \'\{ print \$NF \}\'') do
    its('stdout') { should eq '' }
  end
end

control "1.6.2" do
  impact 2.0
  title "Ensure SELinux is installed (Scored)"
  desc "SELinux provides Mandatory Access Controls."
  describe package('libselinux') do
    it { should be_installed }
  end
end

control "1.7.1.1" do
  impact 1.0
  title "Ensure message of the day is configured properly (Scored)"
  desc "The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users. Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty\(8\) supports the following options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system name \v - operating system version"
  describe file('/etc/motd') do
    its('content') { should_not match /\\m/ }
    its('content') { should_not match /\\r/ }
    its('content') { should_not match /\\s/ }
    its('content') { should_not match /\\v/ }
  end
end

control "1.7.1.2" do
  impact 1.0
  title "Ensure local login warning banner is configured properly (Not Scored)"
  desc "The contents of the /etc/issue file are displayed to users prior to login for local terminals. Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system name \v - operating system version"
  describe file('/etc/issue') do
    its('content') { should_not match /\\m/ }
    its('content') { should_not match /\\r/ }
    its('content') { should_not match /\\s/ }
    its('content') { should_not match /\\v/ }
  end
end

control "1.7.1.3" do
  impact 1.0
  title "Ensure remote login warning banner is configured properly (Not Scored)"
  desc "The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services. Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system name \v - operating system version"
  describe file('/etc/issue.net') do
    its('content') { should_not match /\\m/ }
    its('content') { should_not match /\\r/ }
    its('content') { should_not match /\\s/ }
    its('content') { should_not match /\\v/ }
  end
end

control "1.7.1.4" do
  impact 1.0
  title "Ensure permissions on /etc/motd are configured (Not Scored)"
  desc "The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users."
  describe file('/etc/motd') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '00644' }
  end
end

control "1.7.1.5" do
  impact 1.0
  title "Ensure permissions on /etc/issue are configured (Scored)"
  desc "The contents of the /etc/issue file are displayed to users prior to login for local terminals."
  describe file('/etc/issue') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '00644' }
  end
end

control "1.7.1.6" do
  impact 1.0
  title "Ensure permissions on /etc/issue.net are configured (Not Scored)"
  desc "The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services."
  describe file('/etc/issue.net') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '00644' }
  end
end

control "1.7.2" do
  impact 1.0
  title "Ensure GDM login banner is configured (Scored)"
  desc "GDM is the GNOME Display Manager which handles graphical login for GNOME based systems."
  only_if do
    file('/etc/dconf/profile/gdm').exist?
  end
  describe file('/etc/dconf/profile/gdm') do
    its('content') { should match /user-db:user/ }
    its('content') { should match /system-db:gdm/ }
    its('content') { should match /file-db:\/usr\/share\/gdm\/greeter-dconf-defaults/ }
  end
  describe file('/etc/dconf/db/gdm.d/01-banner-message') do
    its('content') { should match /\[org\/gnome\/login-screen\]/ }
    its('content') { should match /banner-message-enable=true/ }
    its('content') { should match /banner-message-text=.*/ }
  end
end

control "1.8" do
  impact 1.0
  title "Ensure updates, patches, and additional security software are installed (Scored)"
  desc "Periodically patches are released for included software either due to security flaws or to include additional functionality."
  describe command('yum check-update') do
    its('stdout') { should eq '' }
  end
end
