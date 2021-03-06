name             "hopsworks"
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      "Installs/Configures HopsWorks, the UI for Hops Hadoop."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
source_url       "https://github.com/hopshadoop/hopsworks-chef"


%w{ ubuntu debian centos rhel }.each do |os|
  supports os
end

depends 'glassfish'
depends 'ndb'
depends 'kagent'
depends 'hops'
depends 'elastic'
depends 'hadoop_spark'
depends 'flink'
depends 'zeppelin'
depends 'compat_resource'
depends 'ulimit2'
depends 'authbind'
depends 'epipe'
depends 'livy'
depends 'kkafka'
depends 'kzookeeper'
depends 'drelephant'
depends 'dela'
depends 'java'
depends 'tensorflow'
depends 'hopslog'
depends 'hopsmonitor'


#link:Click <a target='_blank' href='https://%host%:4848'>here</a> to launch Glassfish in your browser (http)
recipe  "hopsworks::install", "Installs Glassfish"

#link:Click <a target='_blank' href='http://%host%:8080/hopsworks'>here</a> to launch hopsworks in your browser (http)
recipe  "hopsworks", "Installs HopsWorks war file, starts glassfish+application."

recipe  "hopsworks::dev", "Installs development libraries needed for HopsWorks development."

recipe  "hopsworks::letsencypt", "Given a glassfish installation and a letscrypt installation, update glassfish's key."

recipe  "hopsworks::purge", "Deletes glassfish installation."

#######################################################################################
# Required Attributes
#######################################################################################

attribute "java/jdk_version",
          :display_name =>  "Jdk version",
          :type => 'string'

attribute "java/install_flavor",
          :display_name =>  "Oracle (default) or openjdk",
          :type => 'string'

attribute "kapacitor/notify/email",
          :description => "Email address. Recommended to use a gmail account",
          :required => "required",
          :type => 'string'

attribute "hopsworks/email",
          :description => "Email account to send notifications from. ",
          :required => "required",
          :type => 'string'

attribute "hopsworks/email_password",
          :description => "Password for email account. ",
          :required => "required",
          :type => 'string'

attribute "hopsworks/twofactor_auth",
          :description => "Ip Address/hostname of SMTP server (default is smtp.gmail.com)",
          :type => 'string'

attribute "hopsworks/smtp",
          :description => "Ip Address/hostname of SMTP server (default is smtp.gmail.com)",
          :type => 'string'

attribute "hopsworks/smtp_port",
          :description => "Port of SMTP server (default is 587)",
          :type => 'string'

attribute "hopsworks/smtp_ssl_port",
          :description => "SSL port of SMTP server (default is 465)",
          :type => 'string'

attribute "hopsworks/admin/user",
          :description => "Username for the Administration account on the Web Application Server",
          :type => 'string',
          :required => "required"

attribute "hopsworks/admin/password",
          :description => "Password for the Administration account on the Web Application Server",
          :type => 'string',
          :required => "required"

attribute "hopsworks/dir",
          :description => "Installation directory for the glassfish binaries",
          :type => 'string'

attribute "hopsworks/user",
          :description => "Hopsworks/glassfish username to run service as",
          :type => 'string'

attribute "hopsworks/group",
          :description => "Hopsworks/glassfish group to run service as",
          :type => 'string'

attribute "hopsworks/domains_dir",
          :description => "Installation directory for the glassfish domains",
          :type => 'string'

attribute "hopsworks/master/password",
          :description => "Web Application Server master password",
          :type => 'string'

attribute "download_url",
          :description => "URL for downloading binaries",
          :type => 'string'

# attribute "hopsworks/cert/password",
#           :description => "hopsworks/cert/password",
#           :type => 'string',
#           :default => "changeit"

attribute "karamel/cert/cn",
          :description => "Certificate Name",
          :type => 'string'

attribute "karamel/cert/o",
          :description => "organization",
          :type => 'string'

attribute "karamel/cert/ou",
          :description => "Organization unit",
          :type => 'string'

attribute "karamel/cert/l",
          :description => "Location",
          :type => 'string'

attribute "karamel/cert/s",
          :description => "City",
          :type => 'string'

attribute "karamel/cert/c",
          :description => "Country (2 letters)",
          :type => 'string'

attribute "glassfish/version",
          :description => "glassfish/version",
          :type => 'string'

attribute "glassfish/user",
          :description => "Install and run the glassfish server as this username",
          :type => 'string'

attribute "glassfish/group",
          :description => "glassfish/group",
          :type => 'string'

attribute "hopsworks/port",
          :description => "Port that webserver will listen on",
          :type => 'string'

attribute "hopsworks/max_mem",
          :description => "glassfish/max_mem",
          :type => 'string'

attribute "hopsworks/min_mem",
          :description => "glassfish/min_mem",
          :type => 'string'

attribute "hopsworks/max_stack_size",
          :description => "glassfish/max_stack_size",
          :type => 'string'


attribute "hopsworks/max_perm_size",
          :description => "glassfish/max_perm_size",
          :type => 'string'

attribute "hopsworks/reinstall",
          :description => "Enter 'true' if this is a reinstallation",
          :type => 'string'

attribute "hopsworks/war_url",
          :description => "Url for the hopsworks war file",
          :type => 'string'

attribute "hopsworks/ear_url",
          :description => "Url for the hopsworks ear file",
          :type => 'string'

attribute "hopsworks/yarn_default_quota_mins",
          :description => "Default number of CPU mins availble per project",
          :type => 'string'

attribute "hopsworks/hdfs_default_quota_gbs",
          :description => "Default amount in GB of available storage per project",
          :type => 'string'

attribute "hopsworks/max_num_proj_per_user",
          :description => "Maximum number of projects that can be created by each user",
          :type => 'string'

attribute "hopsworks/kafka_num_replicas",
          :description => "Default number of replicas for Kafka Topics.",
          :type => 'string'

attribute "hopsworks/kafka_num_partitions",
          :description => "Default number of partitions for Kafka Topics.",
          :type => 'string'

attribute "hopsworks/file_preview_image_size",
          :description => "Maximum size in bytes of an image that can be previewed in DataSets",
          :type => 'string'

attribute "hopsworks/file_preview_txt_size",
          :description => "Maximum size in lines of file that can be previewed in DataSets",
          :type => 'string'

attribute "hopsworks/anaconda_enabled",
          :description => "Default is 'true'. Set to 'false' to disable anaconda.",
          :type => 'string'

attribute "vagrant",
          :description => "'true' to rewrite /etc/hosts, 'false' to disable vagrant /etc/hosts",
          :type => 'string'

attribute "services/enabled",
          :description => "Default 'false'. Set to 'true' to enable daemon services, so that they are started on a host restart.",
          :type => "string"

attribute "install/dir",
          :description => "Default ''. Set to a base directory under which all hops services will be installed.",
          :type => "string"

attribute "install/user",
          :description => "User to install the services as",
          :type => "string"


##
##
## Spark
##
##


attribute "hadoop_spark/user",
          :description => "Username to run spark master/worker as",
          :type => 'string'

attribute "hadoop_spark/group",
          :description => "Groupname to run spark master/worker as",
          :type => 'string'

attribute "hadoop_spark/dir",
          :description => "Directory for installation",
          :type => 'string'

attribute "hadoop_spark/executor_memory",
          :description => "Executor memory (e.g., 512m)",
          :type => 'string'

attribute "hadoop_spark/driver_memory",
          :description => "Driver memory (e.g., 1g)",
          :type => 'string'

attribute "hadoop_spark/eventlog_enabled",
          :description => "Eventlog enabled (true|false)",
          :type => 'string'

attribute "hadoop_spark/streaming/stopGracefullyOnShutdown",
          :description => "Shut down the StreamingContext gracefully on JVM shutdown rather than immediately (true|false)",
          :type => 'string'

attribute "hadoop_spark/worker/cleanup/enabled",
          :description => "Spark standalone worker cleanup enabled (true|false)",
          :type => 'string'

attribute "hadoop_spark/version",
          :description => "Spark version (e.g., 1.6.1 or 2.0.1 or 2.1.0)",
          :type => 'string'

attribute "hadoop_spark/hadoop/distribution",
          :description => "'hops' or 'hops'",
          :type => 'string'

attribute "hadoop_spark/history/fs/cleaner/enabled",
          :description => "'true' to enable cleanup of the historyservers logs",
          :type => 'string'

attribute "hadoop_spark/history/fs/cleaner/interval",
          :description => "How often to run the cleanup of the historyservers logs (e.g., '1d' for once per day)",
          :type => 'string'

attribute "hadoop_spark/history/fs/cleaner/maxAge",
          :description => "Age in days of the historyservers logs before they are removed (e.g., '7d' for 7 days)",
          :type => 'string'

attribute "hadoop_spark/yarn/am/attemptFailuresValidityInterval",
          :description => "Defines the validity interval for AM failure tracking. If the AM has been running for at least the defined interval, the AM failure count will be reset.",
          :type => 'string'

attribute "hadoop_spark/driver/maxResultSize",
          :description => "Default '5g'. Change to '1g', '500m', etc",
          :type => 'string'

attribute "hadoop_spark/local/dir",
          :description => "Default /tmp'. Change to: '/srv/disk1/tmp,/srv/disk2/tmp,/srv/disk3/tmp'",
          :type => 'string'

##
##
## Flink
##
##

attribute "flink/user",
          :description => "Username to run flink jobmgr/task as",
          :type => 'string'

attribute "flink/group",
          :description => "Groupname to run flink jobmgr/task as",
          :type => 'string'

attribute "flink/mode",
          :description => "Run Flink JobManager in one of the following modes: BATCH, STREAMING",
          :type => 'string'

attribute "flink/jobmanager/heap_mbs",
          :description => "Flink JobManager Heap Size in MB",
          :type => 'string'

attribute "flink/taskmanager/heap_mbs",
          :description => "Flink TaskManager Heap Size in MB",
          :type => 'string'

attribute "flink/dir",
          :description => "Root directory for flink installation",
          :type => 'string'

attribute "flink/taskmanager/num_taskslots",
          :description => "Override the default number of task slots (default = NoOfCPUs)",
          :type => 'string'

attribute "flink/hadoop/distribution",
          :description => "hops (default) or hops",
          :type => 'string'


##
##
## Livy
##
##

attribute "livy/user",
          :description => "User to install/run as",
          :type => 'string'

attribute "livy/group",
          :description => "Group to install/run as",
          :type => 'string'

attribute "livy/dir",
          :description => "base dir for installation",
          :type => 'string'

attribute "livy/version",
          :dscription => "livy.version",
          :type => "string"

attribute "livy/url",
          :dscription => "livy.url",
          :type => "string"

attribute "livy/port",
          :dscription => "livy.port",
          :type => "string"

attribute "livy/home",
          :dscription => "livy.home",
          :type => "string"

attribute "livy/keystore",
          :dscription => "ivy.keystore",
          :type => "string"

attribute "livy/keystore_password",
          :dscription => "ivy.keystore_password",
          :type => "string"


##
##
## Epipe
##
##

attribute "epipe/user",
          :description => "User to run Epipe server as",
          :type => "string"

attribute "epipe/group",
          :description => "Group to run Epipe server as",
          :type => "string"

attribute "epipe/version",
          :description => "Version of epipe to use",
          :type => "string"

attribute "epipe/url",
          :description => "Url to epipe binaries",
          :type => "string"

attribute "epipe/dir",
          :description => "Parent directory to install epipe in (/srv is default)",
          :type => "string"

attribute "epipe/pid_file",
          :description => "Change the location for the pid_file.",
          :type => "string"


##
##
## drelephant
##
##

attribute "drelephant/dir",
          :description => "Default base installation directory for the Dr Elephant server (default: /srv)",
          :type => 'string'

attribute "drelephant/user",
          :description => "Username that runs the Dr Elephant server",
          :type => 'string'

attribute "drelephant/group",
          :description => "Groupname that runs the Dr Elephant server",
          :type => 'string'


attribute "drelephant/port",
          :description => "Port for running the Dr Elephant server",
          :type => 'string'


##
##
## hopsmonitor
##
##

attribute "hopsmonitor/user",
          :description => "User to run Influxdb/Grafana server as",
          :type => "string"

attribute "hopsmonitor/group",
          :description => "Group to run Influxdb/Grafana server as",
          :type => "string"

attribute "hopsmonitor/dir",
          :description => "Base install directory for Influxdb/Grafana ",
          :type => "string"


#
# InfluxDB
#

attribute "influxdb/db_user",
          :description => "username for influxdb account used by hopsworks ",
          :type => "string"

attribute "influxdb/db_password",
          :description => "Password for influxdb account used by hopsworks",
          :type => "string"

attribute "influxdb/admin_user",
          :description => "username for influxdb admin ",
          :type => "string"

attribute "influxdb/admin_password",
          :description => "Password for influxdb admin user",
          :type => "string"


attribute "influxdb/http/port",
          :description => "Http port for influxdb",
          :type => "string"

attribute "influxdb/port",
          :description => "Main port for influxdb",
          :type => "string"

attribute "influxdb/admin/port",
          :description => "Admin port for influxdb",
          :type => "string"

attribute "influxdb/graphite/port",
          :description => "Port for influxdb graphite connector",
          :type => "string"



#
# Grafana
#


attribute "grafana/admin_user",
          :description => "username for grafana admin ",
          :type => "string"

attribute "grafana/admin_password",
          :description => "Password for grafana admin user",
          :type => "string"


attribute "grafana/mysql_user",
          :description => "username for grafana mysql user ",
          :type => "string"

attribute "grafana/mysql_password",
          :description => "Password for grafana mysql user",
          :type => "string"

attribute "grafana/port",
          :description => "Port for grafana",
          :type => "string"


##
##
## hopslog
##
##

attribute "hopslog/user",
          :description => "User to run Kibana server as",
          :type => "string"

attribute "hopslog/group",
          :description => "Group to run Kibana server as",
          :type => "string"

attribute "logstash/url",
          :description => "Url to hopslog binaries",
          :type => "string"

attribute "logstash/version",
          :description => "Version of logstash to use",
          :type => "string"

attribute "kibana/url",
          :description => "Url to hopslog binaries",
          :type => "string"

attribute "hopslog/dir",
          :description => "Parent directory to install logstash and kibana in (/srv is default)",
          :type => "string"

attribute "logstash/pid_file",
          :description => "Change the location for the pid_file.",
          :type => "string"

attribute "filebeat/url",
          :description => "Url to filebeat binaries",
          :type => "string"

attribute "filebeat/version",
          :description => "Filebeat version",
          :type => "string"

attribute "filebeat/read_logs",
          :description => "Path to log files read by filebeat (e.g., /srv/hops/domain1/logs/*.log)",
          :type => "string"



##
##
## tensorflow
##
##

attribute "tensorflow/user",
:description => "user parameter value",
:type => "string"

attribute "tensorflow/group",
:description => "group parameter value",
:type => "string"

attribute "tensorflow/dir",
:description => "Base installation directory",
:type => "string"

attribute "download_url",
:description => "url for binaries",
:type => "string"

attribute "tensorflow/git_url",
:description => "url for git sourcecode for tensorflow",
:type => "string"

attribute "cuda/accept_nvidia_download_terms",
:description => "Accept cuda licensing terms and conditions. Default: 'false'. Change to 'true' to enable cuda.",
:type => "string"


##
##
## hops
##
##

attribute "hops/dir",
          :description => "Base installation directory for HopsFS",
          :type => 'string'

attribute "hops/use_hopsworks",
          :description => "'true' or 'false' - true to enable HopsWorks support",
          :type => 'string'

attribute "hops/erasure_coding",
          :description => "'true' or 'false' - true to enable erasure-coding replication",
          :type => 'string'

attribute "hops/nn/cache",
          :description => "'true' or 'false' - true to enable the path cache in the NameNode",
          :type => 'string'

attribute "hops/nn/partition_key",
          :description => "'true' or 'false' - true to enable the partition key when starting transactions. Distribution-aware transactions.",
          :type => 'string'

attribute "hops/yarn/resource_tracker",
          :description => "Hadoop Resource Tracker enabled on this nodegroup",
          :type => 'string'

attribute "hops/install_db",
          :description => "Install hops database and tables in MySQL Cluster ('true' (default) or 'false')",
          :type => 'string'

attribute "hops/use_systemd",
          :description => "Use systemd startup scripts, default 'false'",
          :type => "string"

attribute "hops/format",
          :description => "Format HDFS",
          :type => 'string'

attribute "hops/nm/log_dir",
          :description => "The directory in which yarn node manager store containers logs",
          :type => 'string'

attribute "hops/yarn/memory_mbs",
          :description => "Apache_Hadoop NodeManager Memory in MB",
          :type => 'string'

attribute "hops/yarn/nodemanager_ha_enabled",
          :description => "",
          :type => "string"

attribute "hops/yarn/nodemanager_auto_failover_enabled",
          :description => "",
          :type => "string"

attribute "hops/yarn/nodemanager_recovery_enabled",
          :description => "",
          :type => "string"

attribute "hops/yarn/rm_heartbeat",
          :description => "",
          :type => "string"

attribute "hops/yarn/nodemanager_rpc_batch_max_size",
          :description => "",
          :type => "string"

attribute "hops/yarn/nodemanager_rpc_batch_max_duration",
          :description => "",
          :type => "string"

attribute "hops/yarn/rm_distributed",
          :description => "Set to 'true' to enable distributed RMs",
          :type => "string"

attribute "hops/yarn/nodemanager_rm_streaming_enabled",
          :description => "",
          :type => "string"

attribute "hops/yarn/client_failover_sleep_base_ms",
          :description => "",
          :type => "string"

attribute "hops/yarn/client_failover_sleep_max_ms",
          :description => "",
          :type => "string"

attribute "hops/yarn/quota_enabled",
          :description => "",
          :type => "string"

attribute "hops/yarn/quota_monitor_interval",
          :description => "",
          :type => "string"

attribute "hops/yarn/quota_ticks_per_credit",
          :description => "",
          :type => "string"

attribute "hops/yarn/quota_min_ticks_charge",
          :description => "",
          :type => "string"

attribute "hops/yarn/quota_checkpoint_nbticks",
          :description => "",
          :type => "string"

attribute "hops/trash/interval",
          :description => "How long in minutes trash survives in /user/<glassfish>/.Trash/<interval-bucket>/...",
          :type => "string"

attribute "hops/trash/checkpoint/interval",
          :description => "How long in minutes until a new directory bucket is created in /user/<glassfish>/.Trash with a timestamp. ",
          :type => "string"

attribute "hops/nn/private_ips",
          :description => "Set ip addresses",
          :type => "array"

attribute "hops/rm/private_ips",
          :description => "Set ip addresses",
          :type => "array"

# Needed to find the jar file for yan-spark-shuffle
attribute "hadoop_spark/version",
          :description => "Spark version",
          :type => 'string'

attribute "hops/yarn/vcores",
          :description => "Hops NodeManager Number of Virtual Cores",
          :type => 'string'

attribute "hops/yarn/max_vcores",
          :description => "Hadoop NodeManager Maximum Virtual Cores per container",
          :type => 'string'

attribute "hops/version",
          :description => "Version of hops",
          :type => 'string'

attribute "hops/num_replicas",
          :description => "Number of replicates for each file stored in HDFS",
          :type => 'string'

attribute "hops/container_cleanup_delay_sec",
          :description => "The number of seconds container data is retained after termination",
          :type => 'string'

attribute "hops/group",
          :description => "Group to run hdfs/yarn/mr as",
          :type => 'string'

attribute "hops/yarn/user",
          :description => "Username to run yarn as",
          :type => 'string'

attribute "hops/mr/user",
          :description => "Username to run mapReduce as",
          :type => 'string'

attribute "hops/hdfs/user",
          :description => "Username to run hdfs as",
          :type => 'string'

attribute "hops/hdfs/blocksize",
          :description => "HDFS Blocksize (128k, 512m, 1g, etc). Default 128m.",
          :type => 'string'

attribute "hops/format",
          :description => "Format HDFS, Run 'hdfs namenode -format",
          :type => 'string'

attribute "hops/tmp_dir",
          :description => "The directory in which Hadoop stores temporary data, including container data",
          :type => 'string'

attribute "hops/nn/name_dir",
          :description => "Directory for NameNode's state",
          :type => 'string'

attribute "hops/dn/data_dir",
          :description => "The directory in which Hadoop's DataNodes store their data",
          :type => 'string'

attribute "hops/yarn/nodemanager_hb_ms",
          :description => "Heartbeat Interval for NodeManager->ResourceManager in ms",
          :type => 'string'

attribute "hops/rm/scheduler_class",
          :description => "Java Classname for the Yarn scheduler (fifo, capacity, fair)",
          :type => 'string'

attribute "hops/user_envs",
          :description => "Update the PATH environment variable for the hdfs and yarn users to include hadoop/bin in the PATH ",
          :type => 'string'

attribute "hops/logging_level",
          :description => "Log levels are: TRACE, DEBUG, INFO, WARN",
          :type => 'string'

attribute "hops/nn/heap_size",
          :description => "Size of the NameNode heap in MBs",
          :type => 'string'

attribute "hops/nn/direct_memory_size",
          :description => "Size of the direct memory size for the NameNode in MBs",
          :type => 'string'

attribute "hops/yarn/aux_services",
          :description => "mapreduce_shuffle, spark_shuffle",
          :type => "string"

attribute "hops/capacity/max_ap",
          :description => "Maximum number of applications that can be pending and running.",
          :type => "string"
attribute "hops/capacity/max_am_percent",
          :description => "Maximum percent of resources in the cluster which can be used to run application masters i.e. controls number of concurrent running applications.",
          :type => "string"
attribute "hops/capacity/resource_calculator_class",
          :description => "The ResourceCalculator implementation to be used to compare Resources in the scheduler. The default i.e. DefaultResourceCalculator only uses Memory while DominantResourceCalculator uses dominant-resource to compare multi-dimensional resources such as Memory, CPU etc.",
          :type => "string"
attribute "hops/capacity/root_queues",
          :description => "The queues at the root level (root is the root queue).",
          :type => "string"
attribute "hops/capacity/default_capacity",
          :description => "Default queue target capacity.",
          :type => "string"
attribute "hops/capacity/user_limit_factor",
          :description => " Default queue user limit a percentage from 0.0 to 1.0.",
          :type => "string"
attribute "hops/capacity/default_max_capacity",
          :description => "The maximum capacity of the default queue.",
          :type => "string"
attribute "hops/capacity/default_state",
          :description => "The state of the default queue. State can be one of RUNNING or STOPPED.",
          :type => "string"
attribute "hops/capacity/default_acl_submit_applications",
          :description => "The ACL of who can submit jobs to the default queue.",
          :type => "string"
attribute "hops/capacity/default_acl_administer_queue",
          :description => "The ACL of who can administer jobs on the default queue.",
          :type => "string"
attribute "hops/capacity/queue_mapping",
          :description => "A list of mappings that will be used to assign jobs to queues The syntax for this list is [u|g]:[name]:[queue_name][,next mapping]* Typically this list will be used to map users to queues, for example, u:%user:%user maps all users to queues with the same name as the user.",
          :type => "string"
attribute "hops/capacity/queue_mapping_override.enable",
          :description => "If a queue mapping is present, will it override the value specified by the user? This can be used by administrators to place jobs in queues that are different than the one specified by the user. The default is false.",
          :type => "string"



##
##
## Kafka
##
##
attribute "kkafka/user",
          :description => "User to install kafka as",
          :type => 'string'

attribute "kkafka/group",
          :description => "Group to install kafka as",
          :type => 'string'

attribute "kkafka/dir",
          :description => "Base directory to install kafka (default: /opt)",
          :type => 'string'

attribute "kafka/ulimit",
          :description => "ULimit for the max number of open files allowed",
          :type => 'string'

attribute "kkafka/offset_monitor/port",
          :description => "Port for Kafka monitor service",
          :type => 'string'

attribute "kkafka/memory_mb",
          :description => "Kafka server memory in mbs",
          :type => 'string'

attribute "kkafka/broker/zookeeper_connection_timeout_ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/hours",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/size",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/message/max/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/network/threads",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/io/threads",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/recovery/threads/per/data/dir",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/replica/fetchers",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/queued/max/requests",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/socket/send/buffer/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/brattribute oker/socket/receive/buffer/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/sockeattribute t/request/max/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/partitionsattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/segment/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/roll/hoursattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/hoursattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/check/interval/attribute ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/index/size/max/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/index/interval/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/interval/messagesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/scheduler/interval/msattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/interval/msattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/leader/imbalance/check/intervalattribute /seconds",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/leader/imbalance/per/broker/percentageattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/dir",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/offset/checkpoint/interval/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/message/format/version",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/port",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/queued/max/requests",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/quota/consumer/default",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/quota/producer/default",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/fetch/max/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/fetch/min/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/fetch/wait/max/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/high/watermark/checkpoint/interval/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/lag/time/max/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/socket/receive/buffer/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/socket/timeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/request/timeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/session/timeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/set/acl",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replication/factor",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/cleaner/enable",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/cleaner/io/buffer/load/factor",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/security/inter/broker/protocol",
          :description => "",
          :type => 'string'

attribute "kkafka/inter/broker/protocol/version",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/rack",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/client/auth",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/key/password",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/keystore/location",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/keystore/password",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/truststore/location",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/truststore/password",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/authorizer/class/name",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/endpoint/identification/algorithm",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/principal/builder/class",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/synctime/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/connectiontimeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/sessiontimeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/synctime/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/super/users",
          :description => "For example: User:dn0;User:glassfish",
          :type => 'string'


##
##
## Elastic 
##
##

attribute "elastic/user",
          :description =>  "Elastic user",
          :type => 'string'

attribute "elastic/group",
          :description =>  "Elastic user",
          :type => 'string'

attribute "elastic/port",
          :description =>  "Port for elasticsearch service (default: 9200)",
          :type => 'string'

attribute "elastic/ulimit_files",
          :description =>  "Number of files to set ulimit to.",
          :type => 'string'

attribute "elastic/ulimit_memlock",
          :description =>  "Memlock size for ulimit",
          :type => 'string'

attribute "elastic/dir",
          :description =>  "Base directory to install elastic search into.",
          :type => 'string'

attribute "elastic/memory",
          :description =>  "Amount of memory for Elasticsearch.",
          :type => 'string'

attribute "elastic/version",
          :description =>  "Elasticsearch version, .e.g, '2.4.1'",
          :type => 'string'

attribute "elastic/checksum",
          :description =>  "Sha-1 checksum for the elasticsearch .tar.gz file",
          :type => 'string'


##
##
## Zookeeper
##
##

attribute "kzookeeper/version",
          :description => "Version of kzookeeper",
          :type => 'string'

attribute "kzookeeper/url",
          :description => "Url to download binaries for kzookeeper",
          :type => 'string'

attribute "kzookeeper/user",
          :description => "Run kzookeeper as this user",
          :type => 'string'

attribute "kzookeeper/group",
          :description => "Run kzookeeper user as this group",
          :type => 'string'

attribute "kzookeeper/dir",
          :description => "Base directory to install zookeeper (default: /opt)",
          :type => 'string'



##
##
## Hive
##
##

##
##
## Zeppelin
##
##

attribute "zeppelin/user",
          :description => "User to install/run zeppelin as",
          :type => 'string'

attribute "zeppelin/group",
          :description => "Group to install/run zeppelin as",
          :type => 'string'

attribute "zeppelin/dir",
          :description => "zeppelin base dir",
          :type => 'string'




##
##
## Presto
##
##

##
##
## Jupyter
##
##




##
##
## Kagent
##
##


attribute "kagent/user",
          :description => "Username to run kagent as",
          :type => 'string'

attribute "kagent/dir",
          :description => "Dir to install kagent to",
          :type => 'string'

attribute "kagent/dashboard/ip",
          :description => " Ip address for Dashboard REST API",
          :type => 'string'

attribute "kagent/dashboard/port",
          :description => " Port for Dashboard REST API",
          :type => 'string'

attribute "kagent/enabled",
          :description => "Kagent enabled: default 'true'. Set to 'false' to disable it.",
          :type => 'string'

attribute "hop/hostid",
          :description => " One-time password used when registering the host",
          :type => 'string'

attribute "kagent/name",
          :description => "Cookbook name",
          :type => 'string'

attribute "kagent/rest_api/user",
          :description => "kagent REST API username",
          :type => "string"

attribute "kagent/rest_api/password",
          :description => "kagent REST API  password",
          :type => "string"

attribute "kagent/dashboard/user",
          :description => "kagent username to register with server",
          :type => "string"

attribute "kagent/hostname",
          :description => "hostname to register with server",
          :type => "string"

attribute "kagent/dashboard/password",
          :description => "kagent password to register with server",
          :type => "string"

attribute "kagent/env_report_freq_in_secs",
          :description => "How often the kagent sends a full report of its conda environments for synchronization",
          :type => "string"

attribute "ndb/mysql_port",
          :description => "Port for the mysql server",
          :type => "string"

attribute "ndb/mysql_socket",
          :description => "Socket for the mysql server",
          :type => "string"

attribute "systemd",
          :description => "Use systemd startup scripts, default 'true'",
          :type => "string"

attribute "kagent/network/interface",
          :description => "Define the network intefaces (eth0, enp0s3)",
          :type => "string"

attribute "ntp/install",
          :description => "Install Network Time Protocol (default: false)",
          :type => "string"

attribute "services/enabled",
          :description => "Default 'false'. Set to 'true' to enable daemon services, so that they are started on a host restart.",
          :type => "string"


##
##
## NDB
##
##

attribute "ndb/url",
          :description => "Download URL for MySQL Cluster binaries",
          :type => 'string'

attribute "ndb/MaxNoOfExecutionThreads",
          :description => "Number of execution threads for MySQL Cluster",
          :type => 'string'

attribute "ndb/DataMemory",
          :description => "Data memory for each MySQL Cluster Data Node",
          :type => 'string',
          :required => "required"

attribute "ndb/IndexMemory",
          :description => "Index memory for each MySQL Cluster Data Node",
          :type => 'string'

attribute "memcached/mem_size",
          :description => "Memcached data memory size",
          :type => 'string'

attribute "ndb/version",
          :description =>  "MySQL Cluster Version",
          :type => 'string'

attribute "ndb/user",
          :description => "User that runs ndb database",
          :type => 'string'

attribute "ndb/group",
          :description => "Group that runs ndb database",
          :type => 'string'

attribute "ndb/BackupDataDir",
          :description => "Directory to store mysql cluster backups in",
          :type => 'string'
 
attribute "mysql/user",
          :description => "User that runs mysql server",
          :required => "required",
          :type => 'string'

attribute "mysql/password",
          :description => "Password for hop mysql user",
          :required => "required",
          :type => 'string'

attribute "mysql/dir",
          :description => "Directory in which to install MySQL Binaries",
          :type => 'string'

attribute "mysql/replication_enabled",
          :description => "Enable replication for the mysql server",
          :type => 'string'

attribute "ndb/wait_startup",
          :description => "Max amount of time a MySQL server should wait for the ndb nodes to be up",
          :type => 'string'

attribute "ndb/mgm_server/port",
          :description => "Port used by Mgm servers in MySQL Cluster",
          :type => 'string'

attribute "ndb/NoOfReplicas",
          :description => "Num of replicas of the MySQL Cluster Data Nodes",
          :type => 'string'

attribute "ndb/FragmentLogFileSize",
          :description => "FragmentLogFileSize",
          :type => 'string'

attribute "ndb/MaxNoOfAttributes",
          :description => "MaxNoOfAttributes",
          :type => 'string'

attribute "ndb/MaxNoOfConcurrentIndexOperations",
          :description => "Increase for higher throughput at the cost of more memory",
          :type => 'string'

attribute "ndb/MaxNoOfConcurrentScans",
          :description => "Increase for higher throughput at the cost of more memory",
          :type => 'string'

attribute "ndb/MaxNoOfConcurrentOperations",
          :description => "Increase for higher throughput at the cost of more memory",
          :type => 'string'

attribute "ndb/MaxNoOfTables",
          :description => "MaxNoOfTables",
          :type => 'string'

attribute "ndb/MaxNoOfOrderedIndexes",
          :description => "MaxNoOfOrderedIndexes",
          :type => 'string'

attribute "ndb/MaxNoOfUniqueHashIndexes",
          :description => "MaxNoOfUniqueHashIndexes",
          :type => 'string'

attribute "ndb/MaxDMLOperationsPerTransaction",
          :description => "MaxDMLOperationsPerTransaction",
          :type => 'string'

attribute "ndb/TransactionBufferMemory",
          :description => "TransactionBufferMemory",
          :type => 'string'

attribute "ndb/MaxParallelScansPerFragment",
          :description => "MaxParallelScansPerFragment",
          :type => 'string'

attribute "ndb/MaxDiskWriteSpeed",
          :description => "MaxDiskWriteSpeed",
          :type => 'string'

attribute "ndb/MaxDiskWriteSpeedOtherNodeRestart",
          :description => "MaxDiskWriteSpeedOtherNodeRestart",
          :type => 'string'

attribute "ndb/MaxDiskWriteSpeedOwnRestart",
          :description => "MaxDiskWriteSpeedOwnRestart",
          :type => 'string'

attribute "ndb/MinDiskWriteSpeed",
          :description => "MinDiskWriteSpeed",
          :type => 'string'

attribute "ndb/DiskSyncSize",
          :description => "DiskSyncSize",
          :type => 'string'

attribute "ndb/RedoBuffer",
          :description => "RedoBuffer",
          :type => 'string'

attribute "ndb/LongMessageBuffer",
          :description => "LongMessageBuffer",
          :type => 'string'

attribute "ndb/TransactionInactiveTimeout",
          :description => "TransactionInactiveTimeout",
          :type => 'string'

attribute "ndb/TransactionDeadlockDetectionTimeout",
          :description => "TransactionDeadlockDetectionTimeout",
          :type => 'string'

attribute "ndb/LockPagesInMainMemory",
          :description => "LockPagesInMainMemory",
          :type => 'string'

attribute "ndb/RealTimeScheduler",
          :description => "RealTimeScheduler",
          :type => 'string'

attribute "ndb/SchedulerSpinTimer",
          :description => "SchedulerSpinTimer",
          :type => 'string'

attribute "ndb/BuildIndexThreads",
          :description => "BuildIndexThreads",
          :type => 'string'

attribute "ndb/CompressedLCP",
          :description => "CompressedLCP",
          :type => 'string'

attribute "ndb/CompressedBackup",
          :description => "CompressedBackup",
          :type => 'string'

attribute "ndb/BackupMaxWriteSize",
          :description => "BackupMaxWriteSize",
          :type => 'string'

attribute "ndb/BackupLogBufferSize",
          :description => "BackupLogBufferSize",
          :type => 'string'

attribute "ndb/BackupDataBufferSize",
          :description => "BackupDataBufferSize",
          :type => 'string'

attribute "ndb/MaxAllocate",
          :description => "MaxAllocate",
          :type => 'string'

attribute "ndb/DefaultHashMapSize",
          :description => "DefaultHashMapSize",
          :type => 'string'

attribute "ndb/ODirect",
          :description => "ODirect",
          :type => 'string'

attribute "ndb/TotalSendBufferMemory",
          :description => "TotalSendBufferMemory in MBs",
          :type => 'string'

attribute "ndb/OverloadLimit",
          :description => "Overload for Send/Recv TCP Buffers in MBs",
          :type => 'string'

attribute "kagent/enabled",
          :description =>  "Install kagent",
          :type => 'string',
          :required => "optional"

attribute "ndb/NoOfFragmentLogParts",
          :description =>  "One per ldm thread. Valid values: 4, 8, 16. Should match the number of CPUs in ThreadConfig's ldm threads.",
          :type => 'string'

attribute "ndb/bind_cpus",
          :description =>  "Isolate interrupts from cpus, turn off balance_irqs",
          :type => 'string'

attribute "ndb/TcpBind_INADDR_ANY",
          :description =>  "Set to TRUE so that any IP addr can be used on any node. Default is FALSE.",
          :type => 'string'

attribute "ndb/aws_enhanced_networking",
          :description =>  "Set to true if you want the ixgbevf module to be installed that is needed for AWS enhanced networking.",
          :type => 'string'

attribute "ndb/interrupts_isolated_to_single_cpu",
          :description =>  "Set to true if you want to setup your linux kernal to handle interrupts on a single CPU.",
          :type => 'string'

attribute "ndb/ThreadConfig",
          :description => "Decide which threads bind to which cores: Threadconfig=main={cpubind=0},ldm={count=8,cpubind=1,2,3,4,13,14,15,16},io={count=4,cpubind=5,6,17,18},rep={cpubind=7},recv={count=2,cpubind=8,19}k",
          :type => 'string'

attribute "ndb/dir",
          :description =>  "Directory in which to install mysql-cluster",
          :type => 'string'

attribute "ndb/cron_backup",
          :description =>  "Default is 'false'. To turn on, set to 'true'",
          :type => 'string'

attribute "ndb/backup_frequency",
          :description =>  "Options are 'daily', 'weekly'. Default is 'daily'",
          :type => 'string'

attribute "ndb/backup_time",
          :description =>  "Time in 24-hour clock of when to make the regular backup. Default: 03:00 (in the morning)",
          :type => 'string'


attribute "ndb/shared_folder",
          :description =>  "Directory in which to download mysql-cluster",
          :type => 'string'

attribute "ndb/systemd",
          :description =>  "Use systemd scripts (instead of system-v). Default is 'true'.",
          :type => 'string'

attribute "ndb/MaxNoOfConcurrentTransactions",
          :description =>  "Maximum number of concurrent transactions (higher consumes more memory)",
          :type => 'string'

#
#
# Dela
#
#


attribute "dela/user",
          :description => "Username for the dela services",
          :type => 'string'

attribute "dela/group",
          :description => "Groupname for the dela services",
          :type => 'string'

attribute "dela/dir",
          :description => "dela Installation directory.",
          :type => 'string'



#
#
# SMTP
#
#


attribute "smtp/host",
          :description => "Ip Address/hostname of SMTP server (default is smtp.gmail.com)",
          :type => 'string'

attribute "smtp/port",
          :description => "Port of SMTP server (default is 587)",
          :type => 'string'

attribute "smtp/ssl_port",
          :description => "SSL port of SMTP server (default is 465)",
          :type => 'string'

attribute "smtp/email",
          :description => "Email account to send notifications from. ",
          :required => "required",
          :type => 'string'

attribute "smtp/email_password",
          :description => "Password for email account. ",
          :required => "required",
          :type => 'string'
