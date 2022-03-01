#!/bin/bash

#Description:-------Installation and configuration of SonarQube server on Centos 7--------

#Author: Fanny G. Feb, 23 2022

echo " "
sleep 2
if [ ${UID} != 0 ]
then
echo "you are about to install and configure SonarQube server on centos7"

else
echo "you need to run this as a regular user"
exit 1
fi 

echo " "
#Vim and java 11 installation.

echo " "
echo "vim and java 11 installation in progress please be patient!!!"

sleep 2
echo " "

sudo yum install vim -y 

#The only prerequisite for running SonarQube is to have java (oracle JRE 11 or openJDK 11) installed on your machine. To install OpenJDK 11, run the following commands.

echo " "
sleep 2
sudo yum update -y

sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y

echo " "

echo -e "\n please let's navigate to the /opt directory\n"
sleep 2
cd /opt
echo " "
sleep 2
echo "Download SonarQube latest versions on your server"
echo " "
sleep 3
sudo yum install wget -y

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

sudo yum install unzip -y

echo " "
sleep 3
echo "let's unzip the previously installed package"

sleep 2
echo " "
sudo unzip /opt/sonarqube-9.3.0.51899.zip

echo " "
echo "let's change ownership to the user and switch to Linux binairies directory to start service"
echo " "
sleep 2
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
sleep 2

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
sleep 2

./sonar.sh start
sleep 2


echo " "

#Connect to SonaQube
echo "let's configure the port 9000 on the firewall for SonarQube server"

echo " "

sudo systemctl restart firewalld

echo " "

sudo firewall-cmd --permanent --add-port=9000/tcp
echo " "
sudo firewall-cmd --reload
#Installation of net-tools

echo -e "\n please run this command below\n"
echo " "

sudo yum install net-tools -y 

sleep 3
echo " "
echo "please use this link to connect to the SonarQube server through the browser. http://$(ifconfig eth1|head -2|tail -1|awk '{print $2}'):9000"

echo " "
sleep 3
echo "Please use this to login into the server. Login: admin  Password: admin"

echo " "
sleep 3

echo "Please update your password and access the dashboard. Old Password: admin  New Password: school1"
echo " "
sleep 3 
echo "press enter to be redirected to the SonarQube home screen"

echo " "
sleep 3

         echo "End"
