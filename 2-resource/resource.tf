#Resource block describes one or more infrastructure objects
provider "aws" {
  # provider configuration scope
  region = "us-east-1"
}

#resource block     resource type           local name
# combination of resource type + local name must be unique per project
resource            "aws_instance"          "test_instance" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
}



# terraform apply will generate a terraform.tfstate file, contains metadata about the running infrastructure

###################################################################################################################################################### 
###############   this file should not be included in VCS operations, as it might contain security credintials in plain-text #########################
######################################################################################################################################################
/*


*/


/*
###################################################################################################################################################### 
###############   Compare between terraform.tfstate file and terraform.tfstate.backup file                                   #########################
######################################################################################################################################################

Feature	                terraform.tfstate	                                                            terraform.tfstate.backup
Purpose	                Current state file	                                                          Backup of the state file
When is it created?     Created automatically when you run                                            Created automatically before Terraform makes
                        terraform apply for the first time	                                          any changes to the state file
When is it updated?	    Updated every time you run terraform apply	                                  Overwritten every time Terraform makes changes to the state file
Where is it stored?	    Stored in the same directory as your Terraform configuration files	          Stored in the same directory as the state file

*/


/*
terraform.tfstate
Terraform.tfstate is a file that Terraform uses to track the state of the infrastructure it manages. 
The state file contains information about the resources that Terraform has created or is managing, such as the resource type, attributes, and relationships. 
Terraform uses the state file to determine which changes to make to your infrastructure when you run terraform apply.

The terraform.tfstate file is created automatically by Terraform when you run terraform apply for the first time. 
It is stored in the same directory as your Terraform configuration files. 
Terraform will update the state file every time you run terraform apply.

You should not edit the terraform.tfstate file directly, as this can cause Terraform to become confused about the state of your infrastructure. 
If you need to modify the state file, you can use the terraform state command.

############################################################################
Here are some examples of what you can do with the terraform state command:
############################################################################
List all of the resources that Terraform is managing: terraform state list
Show the details of a specific resource: terraform state show <resource_type>.<resource_name>
Import a resource into Terraform management: terraform state import <resource_type>.<resource_name> <resource_id>
Remove a resource from Terraform management: terraform state rm <resource_type>.<resource_name>
If you are using Terraform to manage infrastructure in a team environment, it is important to store the terraform.tfstate file in a shared & secyre location. 
This will allow all team members to access the state file and make changes to the infrastructure as needed.

Here are some best practices for managing Terraform state:

Store the terraform.tfstate file in a shared location.
Use a Terraform state backend to manage the state file in a remote location, such as a cloud storage bucket or Terraform Cloud.
Back up the terraform.tfstate file regularly.
Use the terraform state command to manage the state file directly only when necessary.
terraform.tfstate.backup
The terraform.tfstate.backup file is a backup of the terraform.tfstate file. Terraform automatically creates a backup of the state file before making any changes to the state file. 
This ensures that you can recover from a corrupted or lost state file.

The terraform.tfstate.backup file is stored in the same directory as the terraform.tfstate file. 
It is overwritten every time Terraform makes changes to the state file.

You can use the terraform.tfstate.backup file to restore your Terraform state to a previous version. 
To do this, simply rename the terraform.tfstate.backup file to terraform.tfstate and run terraform init.

Here are some reasons why you might need to restore your Terraform state from a backup:

If the terraform.tfstate file is corrupted or lost.
If you accidentally delete a resource from Terraform management.
If you need to revert to a previous version of your infrastructure.
To restore your Terraform state from a backup, follow these steps:

Rename the terraform.tfstate.backup file to terraform.tfstate.
Run terraform init.
Run terraform apply.
Terraform will compare the current state of your infrastructure to the state file and make the necessary changes to bring your infrastructure back into line with the state file.

It is important to note that restoring your Terraform state from a backup will overwrite any changes that you have made to your infrastructure since the backup was created. 
Therefore, you should only restore your Terraform state from a backup if you are sure that you want to revert to the state of your infrastructure at the time the backup was created.

Here are some best practices for managing Terraform state backups:

Store the terraform.tfstate.backup file in a separate location from the terraform.tfstate file. This will help to protect the backup file from being corrupted or lost along with the state file.
Back up the terraform.tfstate.backup file regularly. This will ensure that you have a recent backup of your state file in case something goes wrong.
Test your Terraform state backups regularly. This will ensure that you can successfully restore your state from a backup if needed.

*/






/*
In order to destroy resources, you can run terraform destroy command, if confirmed it will destroy all the resouces deployed, 
and it will record the current state in statefile

you can destroy a specific target by running: 
terraform destroy -target <resource_type>.<local_name>
*/