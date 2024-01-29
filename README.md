# vagrant340
Vm multi setup using vagrant:
1) ubuntu jammy WEB VM with apache
2) ubuntu jammy DB VM with mariaDB
3) provisioning file
4) script files

# step by step guide to reach the goal

## Creating vagrant file
 - vagrant init
This should create a vagrant file inside the working folder

## Installing proxy plugin before launching VMs
 - vagrant plugin install vagrant-proxyconf

