#!/bin/bash

apt-get update && apt-get -y upgrade
apt-get install screen git openssh-server openvpn libpcap-dev curl python-pip swig libssl-dev python-dev
apt-get install python-elixir
apt-get install ldap-utils rwho rsh-client x11-apps finger
apt-get autoremove

update-rc.d ssh enable
update-rc.d postgresql enable
update-rc.d openvpn enable
update-rc.d nessus enableexirt


sed -i 's/\#AUTOSTART=\"all\"/AUTOSTART=\"all\"/' /etc/default/openvpn
systemctl dameon-reload

service postgresql start
msfdb init
echo spool /root/msf_console.log > /root/.msf4/msfconsole.rc

#git clone https://github.com/pentestgeek/smbexec.git /opt/smbexec
#cd /opt/smbexec && bundle install

git clone https://github.com/robertdavidgraham/masscan.git /opt/masscan
cd /opt/masscan
make
make install

git clone https://github.com/Dionach/CMSmap /opt/CMSmap

git clone https://github.com/wpscanteam/wpscan.git /opt/wpscan
cd /opt/wpscan && ./wpscan.rb --update

git clone https://github.com/ChrisTruncer/EyeWitness.git /opt/EyeWitness
cd /opt/EyeWitness/setup && ./setup.sh

git clone https://github.com/MooseDojo/praedasploit /opt/praedasploit

git clone https://github.com/sqlmapproject/sqlmap /opt/sqlmap

git clone https://bitbucket.org/LaNMaSteR53/recon-ng.git /opt/recon-ng

#cd /opt/
#wget https://raw.github.com/beefproject/beef/a6a7536e/install-beef
#chmod +x install-beef
#./install-beef

git clone https://github.com/SpiderLabs/Responder.git /opt/Responder

git clone https://github.com/secforce/sparta.git /opt/sparta


git clone https://github.com/tcstool/NoSQLMap.git /opt/NoSQLMap
cd /opt/NoSQLMap && python setup.py install 

cd /opt/ && wget www.ampliasecurity.com/research/wce_v1_4beta_universal.zip
mkdir /opt/wce && unzip wce_v1* -d /opt/wce && rm wce_v1*.zip

cd /opt/ && wget http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip
mkdir /opt/mimikatz && unzip mimikatz_trunk.zip -d /opt/mimikatz && rm mimikatz_trunk.zip

git clone https://github.com/trustedsec/social-engineer-toolkit/ /opt/set/
cd /opt/set && python setup.py install

git clone https://github.com/mattifestation/PowerSploit.git /opt/PowerSploit
cd /opt/PowerSploit && wget https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py

git clone https://github.com/samratashok/nishang /opt/nishang

git clone https://github.com/Veil-Framework/Veil /opt/Veil
cd /opt/Veil/setup && ./setup.sh -c


git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists

git clone https://github.com/derv82/wifite /opt/wifite

apt-get autoremove



***need to change sshd config to permite root login yes and on port 22
***make sure that VPN profile is copied to /etc/openvpn and extension is changed from *.ovpn to *.conf
