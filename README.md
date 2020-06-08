# elasticsearch-terraform
Provisions secure elasticsearch server using terraform and ansible

This module is divided in two parts
1. Provisioning
2. Installation and configuration 

Requirements
1. Terraform 
2. Ansible 

Assumptions
1. aws profile configured as default
2. ssh key generated

## Steps 
1. Assign values to variables in terraform/elasticsearch/variables.tf
2. Go to terraform/elasticsearch
3. Run command terraform init 
4. Run command terraform plan and check the output 
5. Run command terraform apply to provision the elasticsearch cluster

Note: The elasticsearch built-in users password will in the output 
e.g 
#################################################################################################################################
module.elasticsearch.aws_instance.instance (local-exec):     "msg": "Initiating the setup of passwords for reserved users elastic,apm_system,kibana,logstash_system,beats_system,remote_monitoring_user.\nThe passwords will be randomly generated and printed to the console.\n\n\nChanged password for user apm_system\nPASSWORD apm_system = BHMSym6NGUhiugPIDFgv\n\nChanged password for user kibana\nPASSWORD kibana = yh1w4A3FOS2jrx1mWsRx\n\nChanged password for user logstash_system\nPASSWORD logstash_system = JPCZ5msTzhPBUFhWpJhd\n\nChanged password for user beats_system\nPASSWORD beats_system = PUo3QRCI5ktZBiLSbaCe\n\nChanged password for user remote_monitoring_user\nPASSWORD remote_monitoring_user = i7N1FS7iUrDEg5og6SBw\n\nChanged password for user elastic\nPASSWORD elastic = dZCmHxgnhCNywdG5VYAY"
#################################################################################################################################

Elasticsearch is bound on private ip hence to access the same login to instance and check node status

Command to check the node status 
curl --cacert /etc/elasticsearch/certs/ca/ca.crt -u elastic 'https://{private ip}:9200/_cat/nodes?v'

You should get node status like 
#################################################################################################################################
ip            heap.percent ram.percent cpu load_1m load_5m load_15m node.role master name
172.31.42.195           42          31   0    0.00    0.00     0.00 dilmrt    *      node-1
#################################################################################################################################
