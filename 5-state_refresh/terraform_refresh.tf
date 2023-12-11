/*
It can happen that the infrastructure gets modified manually.
terraform refresh will check the latest state of your infrastructure and update the state file accordingly.
You shouldn't typically need to use this command, because Terraform automatically performs the same refreshing actions as a part of creating a plan
in both the terraform plan and terraform apply commands.

The terraform refresh command is deprecated in newer version of terraform.
The -refresh-only option for terraform plan and terraform apply was introduced in Terraform v0.15.4.

EXAMPLE: 
*/


provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "instance1" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    tags = {
      "Name": "test_instance",
      "ENV": "DEV",
      "BL": "test"      
    }
}

/*
This is a refresh-only plan, so Terraform will not take any actions to undo these. If you were expecting these changes then you can
apply this plan to record the updated values in the Terraform state without changing any remote objects.

Would you like to update the Terraform state to reflect these detected changes? Terraform will write these changes to the state without modifying any real infrastructure.

*/