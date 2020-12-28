# terrabox
![lint](https://github.com/mrmumu24/terrabox/workflows/lint/badge.svg)

Terraform scripts for deploying following architecture in AWS:
```
 AZ                          AZ                          AZ
 +----------------------+    +----------------------+    +----------------------+
 |                      |    |                      |    |                      |
 |   +--------------+   |    |   +--------------+   |    |   +--------------+   |
 |   |              |   |    |   |              |   |    |   |              |   |
 |   |     ec2      |   |    |   |     ec2      |   |    |   |     ec2      |   |
 |   |  10.0.11.11  |   |    |   |  10.0.12.11  |   |    |   |  10.0.13.11  |   |
 |   |              |   |    |   |              |   |    |   |              |   |
 |   +--------------+   |    |   +--------------+   |    |   +--------------+   |
 |                      |    |                      |    |                      |
 |                      |    |                      |    |                      |
 |   +--------------+   |    |   +--------------+   |    |   +--------------+   |
 |   |              |   |    |   |              |   |    |   |              |   |
 |   |     ec2      |   |    |   |     ec2      |   |    |   |     ec2      |   |
 |   |  10.0.11.12  |   |    |   |  10.0.12.12  |   |    |   |  10.0.13.12  |   |
 |   |              |   |    |   |              |   |    |   |              |   |
 |   +--------------+   |    |   +--------------+   |    |   +--------------+   |
 |                      |    |                      |    |                      |
 +----------------------+    +----------------------+    +----------------------+
```

## Usage
1. clone this repo:
```
git clone https://github.com/mrmumu24/terrabox
cd terrabox
```
2. replace default ip with yours in terraform.tfvars manually or by the script:
```
./scripts/replace-ip.sh terraform.tfvars
```
3. change `key_name` variable
4. create instances:
```
terraform plan
terraform apply
```
5. login to instances (before this step you have to assign EIP to your instance/instances)
```
ssh -i <PATH_TO_YOUR_PEM_KEY> -A centos@<ELASTIC IP>
```
6. destroy instances
```
terraform destroy
```
7. remember to delete detached volumes manually

## Variables and outputs
All variables and outputs are well documented in appropriate files
