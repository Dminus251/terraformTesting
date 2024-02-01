data "aws_subnets" "default"{
  filter{
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
  bucket = "terraform-state-cloudwave-dminus251"
  key = "stage/data-stores/mysql/terraform.tfstate"
  region = "ap-northeast-2"
 }
}
