provider "aws" {
	region = "us-west-2"
}

resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
}

module "webserver" {
	source        = "./modules"
	name          = "tuts-webserver"
	vpc_id        = aws_vpc.main.id
	cidr_block    = "10.0.1.0/24"
	ami           = "ami-003634241a8fcdec0"
	instance_type = "t2.micro"
}


output "webserver" {
	value = module.webserver.instance.public_ip
}

output "foo" {
	value = data.aws_vpc.foo
}
