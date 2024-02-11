For the purpose of the test create a user with admin privilege 

create a .aws directory under your home directory

 mkdir ~/.aws

Change directory to there
  
 cd ~/.aws

Use a text editor (vim, emacs, notepad) to create a text file (no extension) named credentials. In this file you should have the following text.

[default]
 aws_access_key_id = <Your access key>
 aws_secret_access_key = <Your secret key>

Create a text file (no extension) named config. In this file you should have the following text:
     [default]

Clone the repo 

Use the following commands
terraform init
terraform plan -var-file variables.tfvars
teraform apply -var-file variables.tfvars
