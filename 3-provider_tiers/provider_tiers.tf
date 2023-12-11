/* in Terraform, there are 3 types of provider tiers
    1- offical: owned & maintained by Hashicorp, declared by the name of the plugin immidiately
    2- partner: Owned and Maintained by Technology Company that maintains direct partnership with HashiCorp.
    3- Community: Owned and Maintained by Individual Contributors.

Provider Namespaces are used to help users identify the organization or publisher responsible for the integration

        Tier            Description
        Official        hashicorp 
        Partner         Third-party organization e.g. mongodb/mongodbatlas
        Community       Maintainer’s individual or organization account, e.g. alialt/example

Offical providers don't require any decleration for the source, Unlike community & partner
Examples below
*/

### EXPLICIT declaration for the maintainer of digital ocean "PARTNER"

##     terraform configuration block     ##
terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
    }
  }
}
provider "digitalocean" {
    token = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

### IMPLICIT declaration for the maintainer of aws "official"
provider "aws" {
    region = "us-east-1"
}


### without the  required providers in terraform configuration block, the output of terraform init will be: 
/*
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/digitalocean...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.30.0...
- Installed hashicorp/aws v5.30.0 (signed by HashiCorp)
╷
│ Error: Failed to query available provider packages
│
│ Could not retrieve the list of available versions for provider hashicorp/digitalocean: provider registry registry.terraform.io
│ does not have a provider named registry.terraform.io/hashicorp/digitalocean
│
│ Did you intend to use digitalocean/digitalocean? If so, you must specify that source address in each module which requires that
│ provider. To see which modules are currently depending on hashicorp/digitalocean, run the following command:
│     terraform providers
╵

terraform init will assume that digitaloean is maintained by hashicorp
 */