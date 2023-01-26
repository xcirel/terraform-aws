# Terraform with AWS
I'm training my writing in English, please, in case of mistakes, be patient and be happy :)

## 01 - Start

### Links of reference to the documentation to HashiCorp - Terraform
To create a S3 Bucket 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#

### Step by step to create resource(s)
1. To init Terraform
```sh
$ terraform init
```

2. To view what will execute on plan
```sh
$ terraform plan
```

3. To apply the file manifest
```sh
$ terraform apply
```

## 02 - Change and Destroy

When I change simple data and execute
```sh
$ terraform plan
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

If you change the resource name for example, and run the command *terraform plan* observe that the output on the end message is any like as


```console
Plan: 1 to add, 0 to change, 1 to destroy.
```

To the resource be destroy and a new be created 

```sh
$ terraform plan -out="tfplan.out"
```

to execute changes, run

```sh
$ terraform apply "tfplan.out"
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

Here, we did work with variables. If you don't have the parameter *default* when executing the command the prompt show to input data.

This, propose flexibility in the hour to provide your infra.

Other option to work without *default* parameter is especifing on command line, for example

```sh
$ TF_VAR_aws_profile=eric-useast1 terraform plan
```
or

Using a flag
```sh
$ terraform plan -var="aws_profile=eric-useast1" -var="instance_type=t3.large"
```
In the example above, the prompt won't be shown.


Now, we work with a file with variables and, tfor work hin, just run using the flag like
```sh
$ terraform plan -var-file="prod.tfvars"
```

## 04 - Working with interpolation, locals and outputs

- Interpolation, see in the practice browsing on folder in file s3.tf

``code
bucket = "${random_pet.bucket.id}-${var.environment}"
``
- When we use one or more values repeatedly, we can create a file called <em>locals.tf</em>

- Using outputs to expose information, we study more deeply in the future
```console
terraform plan -out="tfplan.out"
random_pet.bucket: Refreshing state... [id=evenly-secondly-solely-dear-kiwi]
aws_s3_bucket.this: Refreshing state... [id=evenly-secondly-solely-dear-kiwi-dev]
aws_s3_object.this: Refreshing state... [id=config/ips.json]

Changes to Outputs:
  + bucket_domain_name = "evenly-secondly-solely-dear-kiwi-dev.s3.amazonaws.com"
  + bucket_name        = "evenly-secondly-solely-dear-kiwi-dev"
  + buckt_arn          = "arn:aws:s3:::evenly-secondly-solely-dear-kiwi-dev"
  + name               = "evenly-secondly-solely-dear-kiwi-dev/config/ips.json"

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.
```
***

### Links of reference
**Interpolation**
https://developer.hashicorp.com/terraform/language/expressions/strings#interpolation

**Provider Random** resource *random_pet*
https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet

**Outputs**
https://developer.hashicorp.com/terraform/language/values/outputs



## 05 - Modules



### Link of reference
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
