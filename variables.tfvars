profile             = "default"
region              = "eu-west-1"
environment         = "development"

# Instance variables
instance_type       = "t3.nano"
key_name            = "awsdevops"
instance_count      = 1
instance_ami  = {
     "eu-west-1" = "ami-0905a3c97561e0b69"
     "eu-west-2" = "ami-0905a3c97561e0b69"
           }



# Network variables
cidr_vpc            = "192.168.0.0/16"
public_subnets_cidr = ["192.168.50.0/24", "192.168.51.0/24"]
private_subnets_cidr= ["192.168.52.0/24", "192.168.53.0/24"]
availability_zones  = ["eu-west-1a", "eu-west-1b"]

# Route53 variables
route53_zone        = "controller-test.com"
wildcard            = "brand-test"

