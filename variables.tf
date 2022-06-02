#基本相关
variable "tags" {
  description = "添加到所有资源里的标记"
  type        = map(string)
  default     = {}
}

#provider相关
variable Region {
    type = string
    description = "可用区"
}

variable accessKey {
    type = string
    description = "AK"
}

variable secretKey {
    type = string
    description = "SK"
}

#vpc相关
variable vpcName {
    type = string
    description = "vpc名称"
}

variable cidrVpcBlock {
    type = string
    description = "vpc地址块"
}

#交换机相关
variable cidrSwBlock {
    type = string
    description = "交换机地址块"
}
variable zoneId {
    type = string
    description = "交换机可用区"
}

#安全组及安全组规则相关
variable securityName {
    type = string
    description = "安全组名称"
}
variable securityRuleType {
    type = string
    description = "规则类型"
}
variable ipProtocol {
    type = string
    description = "安全组端口协议"
}
variable nicType {
    type = string
    description = "网卡类型"
}
variable securityPolicy {
    type = string
    description = "安全策略"
}
variable portRange {
    type = string
    description = "安全组开放端口"
}
variable Priority {
    description = "优先级"
}
variable cidrIp {
    type = string
    description = "地址块ip"
}

#创建ecs实例相关
variable availabilityZone {
    type = string
    description = "ecs实例可用地区"
}
variable instanceType {
    type = string
    description = "实例类型"
}
variable systemDiskCategory {
    type = string
    description = "系统盘目录"
}
variable imageId {
    type = string
    description = "镜像id"
}
variable instanceName {
    type = string
    description = "实例名称"
}
variable internetMaxBandwidthOut {
    description = "最大带宽输出"
}
variable Password {
    type = string
    description = "密码"
}

