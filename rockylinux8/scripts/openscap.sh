#!/bin/bash -eux
#sudo dnf -y install openscap-scanner scap-security-guide

sudo dnf -y install httpd
sudo ystemct enable --now httpd

whoami
id

ls -l /usr/share/xml/scap/ssg/content/ssg-rl8-*

scap info /usr/share/xml/scap/ssg/content/ssg-rl8-ds.xml

sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cis_server_l1 --results /var/www/html/web-server-scan-before-remediation.xml /usr/share/xml/scap/ssg/content/ssg-rl8-ds.xml

sudo oscap xccdf generate report /var/www/html/web-server-scan-before-remediation.xml > /var/www/html/web-server-scan-before-remediation.html

oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_cis_server_l1 --results /var/www/html/web-server-scan-after-remediation.xml /usr/share/xml/scap/ssg/content/ssg-rl8-ds.xml

sudo oscap xccdf generate report /var/www/html/web-server-scan-after-remediation.xml > /var/www/html/web-server-scan-after-remediation.html

sudo oscap  xccdf eval --report /var/www/html/web-server-scan.html  --profile xccdf_org.ssgproject.content_profile_cis_server_l1 /usr/share/xml/scap/ssg/content/ssg-rl8-ds.xml

echo 'packer:MyStrongPassword@123' | chpasswd

#sudo oscap xccdf eval --results /var/www/html/web-server-scan.xml --profile xccdf_org.ssgproject.content_profile_cis_server_l1 /usr/share/xml/scap/ssg/content/ssg-rl8-ds.xml

#sudo oscap  xccdf generate fix --fix-type ansible --output web-server-remediate.yaml --profile xccdf_org.ssgproject.content_profile_cis_server_l1 /var/www/html/web-server-scan.xml

#sudo oscap xccdf eval --report /var/www/html/web-server-scan-after-remediation.html  --profile xccdf_org.ssgproject.content_profile_cis_server_l1 /usr/share/xml/scap/ssg/content/ssg-rl8-ds.xml
