#封装一个阿里云module
#使用阿里云provider
provider "alicloud" {
  access_key = var.accessKey
  secret_key = var.secretKey
  region     = var.Region
}

#创建vpc
resource "alicloud_vpc" "main" {
  # VPC名称
  vpc_name = var.vpcName
  # VPC地址块
  cidr_block = var.cidrVpcBlock
  tags = var.tags
}

#创建交换机
resource "alicloud_vswitch" "vsw" {
  vpc_id            = alicloud_vpc.main.id
  cidr_block        = var.cidrSwBlock
  zone_id = var.zoneId
  tags = var.tags
}

#创建的专有网络中创建一个安全组
resource "alicloud_security_group" "default" {
  name = var.securityName
  vpc_id = alicloud_vpc.main.id
  tags = var.tags
}

#创建安全组规则，并添加一个允许任何地址访问的安全组规则
resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = var.securityRuleType
  ip_protocol       = var.ipProtocol
  nic_type          = var.nicType
  policy            = var.securityPolicy
  port_range        = var.portRange
  priority          = var.Priority
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = var.cidrIp
  tags = var.tags
}

#创建ecs实例
resource "alicloud_instance" "instance" {
  # cn-hangzhou
  availability_zone = var.availabilityZone
  security_groups = alicloud_security_group.default.*.id

  # series III
  instance_type        = var.instanceType
  system_disk_category = var.systemDiskCategory
  image_id             = var.imageId
  instance_name        = var.instanceName
  vswitch_id = alicloud_vswitch.vsw.id
  internet_max_bandwidth_out =var.internetMaxBandwidthOut
  #密码
  password = var.Password
  tags = var.tags
}

