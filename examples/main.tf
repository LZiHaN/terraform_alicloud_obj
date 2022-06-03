#module模块引用
module "terraform_alicloud_idcos" {
    #本地自用，暂不需要版本
    source = "../terraform_alicloud_test"
    #version = ""
    Region = "cn-hangzhou"
    accessKey = "AK"
    secretKey = "SK"
#vpc相关
    vpcName = "terraform_ali_modules"
    cidrVpcBlock = "172.16.0.0/12"
    cidrSwBlock = "172.16.0.0/21"
    zoneId = "cn-hangzhou-b"
    securityName = "default"
    securityRuleType = "ingress"
    ipProtocol = "tcp"
    nicType = "intranet"
    securityPolicy = "accept"
    portRange = "1/65535"
    Priority = 1
    cidrIp = "0.0.0.0/0"
#实例
    availabilityZone = "cn-hangzhou-b"
    instanceType = "ecs.n2.small"
    systemDiskCategory = "cloud_efficiency"
    imageId = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
    instanceName = "idcos_test_hangzhou"
    internetMaxBandwidthOut = 10
    Password = "User@123"

    tags = {
      module = "terraform_alicloud_idcos"
    }
}
