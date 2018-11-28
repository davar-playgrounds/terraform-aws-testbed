#
variable "AMIS_PRIMARY_OWNERS" {
  description = "AMI Owner - could be self or a specific id"
  default     = ""
}

variable "AMIS_OS_MAP_REGEX" {
  description = "Map of regex to search amis"
  type        = "map"

  default = {
    amazon               = "^amzn-ami-hvm-*-gp2"
    amazon-2_lts         = "^amzn2-ami-hvm-*-gp2"
    centos               = "^CentOS Linux 7*"                                           # alias for centos 7
    centos-6             = "^CentOS Linux 6*"
    centos-7             = "^CentOS Linux 7*"
    debian               = "^debian-stretch-*"                                          # alias for debian 9
    debian-8             = "^debian-jessie-*"
    debian-9             = "^debian-stretch-*"
    fedora-27            = "^Fedora-Cloud-Base-27-*-gp2.*"
    fedora-28            = "^Fedora-Cloud-Base-28-*-gp2.*"
    fedora-29            = "^Fedora-Cloud-Base-29-*-gp2.*"
    rhel                 = "^RHEL-7.*"                                                  # alias for Red Hat 7
    rhel-6               = "^RHEL-6.*"
    rhel-7               = "^RHEL-7.*"
    suse-les             = "^suse-sles-12-sp\\d-v\\d{8}-hvm-ssd-x86_64"                 # alias for Suse 12
    suse-les-12          = "^suse-sles-12-sp\\d-v\\d{8}-hvm-ssd-x86_64"
    ubuntu               = "^ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-.*" #alias for Ubuntu 16.04
    ubuntu-14.04         = "^ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-.*"
    ubuntu-16.04         = "^ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-.*"
    windows              = "^Windows_Server-2016-English-Full-Base-.*"                  # alias for Windows 2016
    windows-2008-r2-base = "^Windows_Server-2008-R2_SP1-English-64Bit-Base-.*"
    windows-2012-r2-base = "^Windows_Server-2012-R2_RTM-English-64Bit-Base-.*"
    windows-2016-base    = "^Windows_Server-2016-English-Full-Base-.*"
  }
}

variable "AMIS_OS_MAP_OWNERS" {
  description = "Map of AMI owners filtering only the official AMIs"
  type        = "map"

  default = {
    amazon               = "137112412989"
    amazon-2_lts         = "137112412989"
    centos               = "679593333241"
    centos-6             = "679593333241"
    centos-7             = "679593333241"
    debian               = "679593333241"
    debian-8             = "679593333241"
    debian-9             = "679593333241"
    fedora-27            = "125523088429"
    fedora-28            = "125523088429"
    fedora-29            = "125523088429"
    rhel                 = "309956199498"
    rhel-6               = "309956199498"
    rhel-7               = "309956199498"
    suse-les             = "013907871322"
    suse-les-12          = "013907871322"
    ubuntu               = "099720109477"
    ubuntu-14.04         = "099720109477"
    ubuntu-16.04         = "099720109477"
    windows              = "801119661308"
    windows-2008-r2-base = "801119661308"
    windows-2012-r2-base = "801119661308"
    windows-2016-base    = "801119661308"
  }
}

variable "APPLICATION" {
  description = "Application name"
  default     = "testbed"
}

variable "APPLICATION_ID" {
  description = "Application ID"
  default     = "TB"
}

variable "AWS_REGION" {
  description = "AWS Region to provision into"
  default     = "us-east-2"
}

variable "AVAILABILITY_ZONE_A" {
  default = "us-east-2a"
}

variable "AVAILABILITY_ZONE_B" {
  default = "us-east-2b"
}

variable "AVAILABILITY_ZONE_C" {
  default = "us-east-2c"
}

variable "CIDR_BLOCK_VPC" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "CIDR_BLOCK_01" {
  description = "CIDR Block #1"
  default     = "10.0.1.0/24"
}

variable "CIDR_BLOCK_02" {
  description = "CIDR Block #2"
  default     = "10.0.2.0/24"
}

variable "CIDR_BLOCK_03" {
  description = "CIDR Block #3"
  default     = "10.0.3.0/24"
}

variable "CIDR_BLOCK_04" {
  description = "CIDR Block #4"
  default     = "10.0.4.0/24"
}

variable "CIDR_BLOCK_05" {
  description = "CIDR Block #5"
  default     = "10.0.5.0/24"
}

variable "CIDR_BLOCK_06" {
  description = "CIDR Block #6"
  default     = "10.0.6.0/24"
}

variable "COST_CENTER" {
  description = "Cost Center to charge back to"
  default     = "01-00001"
}

variable "DELETE_TAG" {
  description = "Tag to use for deletion by other methods like Ansible"
  default     = "aws-testbed-delete"
}

variable "ENVIRONMENT" {
  description = "Evironment (DEV,QA,PROD,DEBUG)"
  default     = "DEV"
}

variable "INSTANCE_TYPE" {
  description = "Instance size to be provisioned."
  default     = "t2.micro"
}

variable "OS" {
  description = "The operating system reference to search for"
  default     = "centos-7"
}

variable "PATH_TO_PRIVATE_KEY" {
  description = "Path to the private RSA keys"
  default     = "/Users/gregorymirsky/.ssh/id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  description = "Path to the private RSA keys"
  default     = "/Users/gregorymirsky/.ssh/id_rsa.pub"
}

variable "S3_BUCKET_EXPIRATION_DATE" {
  description = "Expiration date for the S3 Bucket"
  default     = "2020-01-01"
}

variable "VIRTUALIZATION_TYPE" {
  description = "Virtualization Type: HVM (Hardware Virtual Machine) PV (Paravirtualization)"
  default     = "hvm"
}
