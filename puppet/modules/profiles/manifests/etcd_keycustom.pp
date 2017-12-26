#
##
###
class profiles::etcd_keycustom {

  file { '/opt/jexia-cloud.json':
    content => '{"Network": "172.20.0.0/16", "SubnetLen": 24, "Backend": { "Type": "vxlan", "VNI": 1 }}',
  }->
  etcd_key { '/jexia.cloud/network/config':
    value => '{"Network": "172.20.0.0/16", "SubnetLen": 24, "Backend": { "Type": "vxlan", "VNI": 1 }}'
  }
}
