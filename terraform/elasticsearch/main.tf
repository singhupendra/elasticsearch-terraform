module "ssh-sg"{
    source  = "../modules/sg"
    region  = var.dc_region
    vpc     = var.vpc_id
    port    = "22"
    cidr_block = [var.cidr_block]
}

module "es-sg"{
    source  = "../modules/sg"
    region  = var.dc_region
    vpc     = var.vpc_id
    port    = "9200"
    cidr_block = [var.cidr_block]
}

module "instance-access-key" {
    source ="../modules/key-pair"
    access-key-name   = "elasticsearch-01"
    public_key = var.key
    region = var.dc_region
}

module "elasticsearch"{
    name    = "elasticsearch-01"
    source  = "../modules/ec2"
    region  = var.dc_region
    ami     = var.ami
    key_name = module.instance-access-key.key-pair
    environment = "demo"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    vpc_security_group_ids = [module.ssh-sg.sg-id,module.es-sg.sg-id,var.default-sg]
    
}