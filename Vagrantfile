Vagrant.configure("2") do |config|
	BOX_IMAGE = "ubuntu/jammy64"

  # Web machine network variables
	BASE_INT_NETWORK_WEB  = "10.10.20.10"
  BASE_HOST_ONLY_NETWORK_WEB   = "192.168.56.10"

  # DB machine network variable
  BASE_INT_NETWORK_DB  = "10.10.20.11"

	PROXY_URL = "http://10.20.5.51:8888"
	NO_PROXY = "localhost, 127.0.0.1"


    config.vm.define "web" do |web|
      #configuring OS
      web.vm.box = BOX_IMAGE
      
      #proxy settings
      web.proxy.http = PROXY_URL
      web.proxy.https = PROXY_URL
      web.proxy.no_proxy = NO_PROXY

      #network setup
      web.vm.network "private_network", ip:  BASE_INT_NETWORK_WEB, virtualbox__intnet: "intnet"
      web.vm.network  "private_network",  ip: BASE_HOST_ONLY_NETWORK_WEB

      #synced_folder setup
      web.vm.synced_folder "./site_flask", "/home/vagrant/myapp"

      web.vm.provider "virtualbox" do |vb|
        vb.name= " web.m340"
        vb.gui = true
        vb.memory = "2048"
      end

      #flask setup  
      web.vm.provision "shell", path: "scripts/install_flask.sh"
    end
end