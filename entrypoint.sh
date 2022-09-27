#!/usr/bin/env bash
#

mkdir /var/run/sshd
echo 'root:root' | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


# Check that the ssh_key_url is set
if [ -z "$SSH_KEY_URL" ]; then
    echo "ssh_key_url is not set"
    exit 1
fi

mkdir -p /root/.ssh
wget -O /root/.ssh/authorized_keys $SSH_KEY_URL

chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys


/usr/sbin/sshd -D
