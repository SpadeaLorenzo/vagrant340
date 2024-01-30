# vagrant340
Vm multi setup using vagrant:
1) ubuntu jammy WEB VM with apache
2) ubuntu jammy DB VM with mariaDB
3) provisioning file
4) script files

# step by step guide to reach the goal

## Creating vagrant file
Navigate to the folder where your vagrant file should be places <br>
`vagrant init` should create a vagrant file inside the working folder.

## Installing proxy plugin before launching VMs
`vagrant plugin install vagrant-proxyconf`
## 5. Configuring Web VM

Before launching the Web VM, modify the `Vagrantfile` to define the configuration for the Web machine. Set the network variables for internal and host-only networks. Decide on the box image to use, such as "ubuntu/jammy64". Adjust memory settings and other preferences as needed.

## 6. Configuring DB VM

Configure the DB VM in the `Vagrantfile`. Define network variables and choose the box image, such as "ubuntu/jammy64". Set memory preferences and other options to suit your requirements.

## 7. Network Setup

Define the private network settings for both the Web and DB VMs. Be szre that each VM has a unique IP address and set up port forwarding or other networking configurations. 

## 8. Synced Folder Setup

Configure the synced folders to share files between the host machine and the VMs. Specify the paths to sync and the corresponding locations on the VMs. be sure that the necessary files, such as scripts and the Flask application, are accessible from both the host and VMs.

## 9. Provisioning

Create provisioning scripts for both the Web and DB VMs. These scripts should contain the necessary commands to install and configure the required software.

## 10. Launching VMs

Execute the command `vagrant up` to launch both the Web and DB VMs. Vagrant will use the specified configurations and run the provisioning scripts to set up the environment. Monitor the output for any errors or warnings during the process.

# To access the page visit:
`192.168.56.10:5000`


