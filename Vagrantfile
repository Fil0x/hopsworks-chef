  

Vagrant.configure("2") do |c|
  if Vagrant.has_plugin?("vagrant-omnibus")
#    require 'vagrant-omnibus'
    c.omnibus.chef_version = "12.4.3"
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    c.omnibus.cache_packages = true        
    c.cache.scope = :machine
    c.cache.auto_detect = false
    c.cache.enable :apt
    c.cache.enable :gem    
  end
#  c.vm.synced_folder "/srv/hops-downloads", "/srv/hops-downloads"
  c.vm.box = "opscode-ubuntu-14.04"
  c.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20150924.0.0/providers/virtualbox.box"
  c.vm.hostname = "default-ubuntu-1404.vagrantup.com"

# Ssh port on vagrant
  c.vm.network(:forwarded_port, {:guest=>22, :host=>22100})
# MySQL Server
  c.vm.network(:forwarded_port, {:guest=>9090, :host=>23100})

  c.vm.network(:forwarded_port, {:guest=>3306, :host=>24100})
# HTTP webserver
  c.vm.network(:forwarded_port, {:guest=>8080, :host=>25100})
# HTTPS webserver
  c.vm.network(:forwarded_port, {:guest=>8181, :host=>26100})
# Glassfish webserver
  c.vm.network(:forwarded_port, {:guest=>4848, :host=>27100})
# HDFS webserver
  c.vm.network(:forwarded_port, {:guest=>50070, :host=>28100})
# Datanode 
  c.vm.network(:forwarded_port, {:guest=>50075, :host=>29100})
# YARN webserver
  c.vm.network(:forwarded_port, {:guest=>8088, :host=>30100})
# Elasticsearch rpc port
  c.vm.network(:forwarded_port, {:guest=>9200, :host=>31100})
# Flink webserver
  c.vm.network(:forwarded_port, {:guest=>9088, :host=>32100})
# Glassfish Debugger port
  c.vm.network(:forwarded_port, {:guest=>9009, :host=>33100})
# Ooozie port
  c.vm.network(:forwarded_port, {:guest=>11000, :host=>34100})
# Spark History Server
  c.vm.network(:forwarded_port, {:guest=>18080, :host=>36100})
# Dela udp ports
  c.vm.network(:forwarded_port, {:guest=>40100, :host=>40100, :protocol=>"udp"})
  c.vm.network(:forwarded_port, {:guest=>40200, :host=>40200, :protocol=>"udp"})
  c.vm.network(:forwarded_port, {:guest=>40300, :host=>40300, :protocol=>"udp"})
# Dela http port
  c.vm.network(:forwarded_port, {:guest=>40400, :host=>40400})
  c.vm.provider :virtualbox do |p|
    p.customize ["modifyvm", :id, "--memory", "13500"]
    p.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    p.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    p.customize ["modifyvm", :id, "--nictype1", "virtio"]
    p.customize ["modifyvm", :id, "--cpus", "2"]   
  end


   c.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.json = {
     "ntp" => {
          "install" => "true"
     },
     "ndb" => {
          "mgmd" => { 
     	  	       "private_ips" => ["10.0.2.15"]
	       },
	  "ndbd" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
	  "mysqld" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
	  "memcached" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
          "public_ips" => ["10.0.2.15"],
          "private_ips" => ["10.0.2.15"],
          "enabled" => "true",
     },
     "hopsworks" => {
        "default" => {
            "private_ips" => ["10.0.2.15"]
        },
        "gmail" =>      { 
            "email" => "dela@gmail.com"
        },
        "war_url" => "http://snurran.sics.se/hops/hopsworks-johan.war",
        "user_envs" => "false",
        "domain" => "bbc1.sics.se",
        "public_port" => 25100,
     },
     "zeppelin" => {
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
     "elastic" => {
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
     "public_ips" => ["10.0.2.15"],
     "private_ips" => ["10.0.2.15"],
     "hops"  =>    {
		 "use_hopsworks" => "true",
		 "rm" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "nn" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "dn" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "nm" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "jhs" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 }
     },
     "apache_hadoop"  =>    {
     	        "hdfs" => {
                      "user" => "glassfish"
                 },
     	        "yarn" => {
		      "user" => "glassfish"
		 },
		 "mr" => {
		      "user" => "glassfish"
		 },
		 "rm" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "nn" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "dn" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "nm" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
		 "jhs" =>    { 
       	  	      "private_ips" => ["10.0.2.15"]
                 },
      },
     "hadoop_spark" => {
	  "user" => "glassfish",
	  "master" =>    { 
       	 	      "private_ips" => ["10.0.2.15"]
          },
	  "worker" =>    { 
       	 	      "private_ips" => ["10.0.2.15"]
          }
     },
     "kzookeeper" => {
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
     "livy" => {
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
     "epipe" => {
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
     "kagent" => {
          "enabled" => "true",
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
     "kkafka" => {
	  "default" =>      { 
   	  	       "private_ips" => ["10.0.2.15"]
	       },
     },
      "dela" => {
        "port" => "40100",
        "stun_port1" => "40200",
        "stun_port2" => "40300",
        "http_port" => "40400",
        "default" => { 
          "private_ips" => ["10.0.2.15"]
        },
     },
     "hops_site" => {
        domain => "bbc1.sics.se",
        public_port => 25100, 
     },
     "vagrant" => "true",
     }

      chef.add_recipe "kagent::install"
      chef.add_recipe "hopsworks::install"
      chef.add_recipe "ndb::install"
      chef.add_recipe "hops::install"
      chef.add_recipe "hadoop_spark::install"
      chef.add_recipe "flink::install"
      chef.add_recipe "zeppelin::install"
      chef.add_recipe "elastic::install"
      chef.add_recipe "kzookeeper::install"
      chef.add_recipe "epipe::install"
      chef.add_recipe "livy::install"
      chef.add_recipe "adam::install"
    #  chef.add_recipe "oozie::install"
      chef.add_recipe "kkafka::install"
      chef.add_recipe "dela::install"
      chef.add_recipe "ndb::mgmd"
      chef.add_recipe "ndb::ndbd"
      chef.add_recipe "ndb::mysqld"
      chef.add_recipe "hops::ndb"
      chef.add_recipe "hops::nn"
      chef.add_recipe "hops::dn"
      chef.add_recipe "hops::rm"
      chef.add_recipe "hops::nm"
      chef.add_recipe "hops::jhs"
      chef.add_recipe "elastic::default"
      chef.add_recipe "zeppelin::default"
      chef.add_recipe "flink::yarn"
      chef.add_recipe "hadoop_spark::yarn"
      chef.add_recipe "hadoop_spark::historyserver"
      chef.add_recipe "livy::default"
      chef.add_recipe "hopsworks::default"
      chef.add_recipe "hopsworks::dev"
      chef.add_recipe "epipe::default"
      chef.add_recipe "kzookeeper::default"
      chef.add_recipe "kkafka::default"
      chef.add_recipe "adam::default"
      chef.add_recipe "kagent::default"
    #  chef.add_recipe "oozie::default"
      chef.add_recipe "dela::default"
  end 

end

