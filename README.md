# terraform-aws
I'm training my writing in English, please, in case of mistakes, be patient and be happy :)




## 01 - Terraform Basic


### Links of reference to the documentation to HashiCorp - Terraform
To create a S3 Bucket 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#

### Step by step to create resource(s)
1. To init Terraform
```sh
terraform init
```

2. To view what will execute on plan
```sh
terraform plan
```

3. To apply the file manifest
```sh
terraform apply
```

## 02 - Terraform - Change and Destroy

When I change data and execute
```sh
terraform plan
```
the output is

```console
aws_s3_bucket.my-test-bucket: Refreshing state... [id=my-tf-test-bucket-devops-lab-9043943867348987878986743]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_s3_bucket.my-test-bucket will be updated in-place
  ~ resource "aws_s3_bucket" "my-test-bucket" {
        id                          = "my-tf-test-bucket-devops-lab-9043943867348987878986743"
      ~ tags                        = {
          ~ "UpdateAt"    = "2023-01-20" -> "2023-01-21"
            # (4 unchanged elements hidden)
        }
      ~ tags_all                    = {
          ~ "UpdateAt"    = "2023-01-20" -> "2023-01-21"
            # (4 unchanged elements hidden)
        }
        # (9 unchanged attributes hidden)

        # (2 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.
```
