echo 'Copying host public SSH Keys to the VM'
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod -R 600 /home/vagrant/.ssh/authorized_keys
echo 'Host 192.168.*.*' >> /home/vagrant/.ssh/config
echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> /home/vagrant/.ssh/config
chmod -R 600 /home/vagrant/.ssh/config
rm /home/vagrant/id_rsa.pub

echo 'Recreating OpenSSH keys'
sudo /bin/rm -v /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
