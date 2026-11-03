#Sets region and tags for EVERY resource launched by AWS (but ASG)
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = "terraform-learning"
      Owner     = "dmytro"
      ManagedBy = "terraform"
    }
  }
}