#!/bin/bash

sudo yum install -y curl policycoreutils-python openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld

sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash

sudo EXTERNAL_URL="http://git.zhurp.xyz" yum install -y gitlab-ee

gitlab-rails console production

#user = User.where(id: 1).first
#user.password = '123456
#user.save!


# cd /usr/local/src
#
# wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/gitlab-ce-8.8.5-ce.1.el7.x86_64.rpm
#
# rpm -ivh gitlab-ce-8.8.5-ce.1.el7.x86_64.rpm

# echo external_url 'http://git.zhurp.xyz' >> /etc/gitlab/gitlab.rb
# sed -i '42s/daemonize no/daemonize yes/' /usr/local/redis/redis.conf
# gitlab-ctl reconfigure


