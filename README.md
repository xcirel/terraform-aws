# Terraform AWS
I'm training my writing in English, please, in case of mistakes, be patient and be happy :)

## 01 - Basic

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

## 02 - Change and Destroy

When I change simple data and execute
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

---------------------------------------

If you change the resource name for example, and run the command <em>terraform plan</em> observe that the output on the end message is any like as


```console
Plan: 1 to add, 0 to change, 1 to destroy.
```

To the resource be destroy and a new be created 

```sh
terraform plan -out="tfplan.out"
```

to execute changes, run

```sh
terraform apply "tfplan.out"
```

the output will be any like that

```console
aws_s3_bucket.my-test-bucket: Destroying... [id=my-tf-test-bucket-devops-lab-90439478986743change]
aws_s3_bucket.my-test-bucket: Destruction complete after 1s
aws_s3_bucket.my-test-bucket: Creating...
aws_s3_bucket.my-test-bucket: Creation complete after 4s [id=my-tf-test-bucket-devops-lab-90439478986743change1]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
:zany_face:	Congrats


## 03 - Working with variables

Here, we did work with variables. If you don't have the parameter <em>default</em> when executing the command the prompt show to input data.