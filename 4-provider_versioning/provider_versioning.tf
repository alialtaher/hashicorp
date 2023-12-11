/* 
Provider plugins are released separately from Terraform itself.
its important to considere the possible changes in API specifications between versions of each provider
to avoid failure in API actions, its preffered by HCL, to declare the version of the provider that you used when creating the resorce in a place where terraform 
will know that it should use the same version all the times 
During terraform init, if version argument is not specified, the most recent provider will be
downloaded during initialization.
For production use, you should constrain the acceptable provider versions via configuration, to
ensure that new versions with breaking changes will not be automatically installed.
*/
#Example below:

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "= 5.20"  ### matching to the exact version, other options are: 
                            ### greater/less than, greater/less than or equal > >= < <=   
                            ### between   >=2.10 <= 2.30
    }       
  }
}

provider "aws" {
    region = "us-east-1"
}


/*
  by running terraform init, the binaries will be downloaded according to the version constraint, and a new tag "constraints" will be added to the lock file
        provider "registry.terraform.io/hashicorp/aws" {
        version     = "5.30.0"
        constraints = "5.30.0"
If a particular provider already has a selection recorded in the lock file, Terraform will always
re-select that version for installation, even if a newer version has become available.

EXAMPLE: 
change the version in the main file from 5.30 to 5.20 and run terraform init: 

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
╷
│ Error: Failed to query available provider packages
│
│ Could not retrieve the list of available versions for provider hashicorp/aws: locked provider registry.terraform.io/hashicorp/aws
│ 5.30.0 does not match configured version constraint 5.20.0; must use terraform init -upgrade to allow selection of new versions
╵
to override this constraint, run terraform init -upgrade, it will update the constraints in the lock file also 
      provider "registry.terraform.io/hashicorp/aws" {
        version     = "5.20.0"
        constraints = "5.20.0"

*/