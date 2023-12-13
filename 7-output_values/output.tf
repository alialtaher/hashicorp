/*
Output values make information about your infrastructure available on the
command line, and can expose information for other Terraform configurations to
use.

Output values defined in Project A can be referenced from code in Project B as well.
Output values have several uses:
  * A child module can use outputs to expose a subset of its resource attributes to a parent module.
  * A root module can use outputs to print certain values in the CLI output after running terraform apply.
  * When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source.
*/ 


provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "instance1" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
}



output "instance_puplic_ip" {
  value = aws_instance.instance1.public_ip
}

/*
Note: Outputs are only rendered when Terraform applies your plan. Running terraform plan will not render outputs.
*/