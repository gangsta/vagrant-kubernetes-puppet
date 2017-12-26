#
##
###
class profiles::kube_master_key {

  exec { '/bin/openssl genrsa -out /tmp/serviceaccount.key 2048':
    creates => '/tmp/serviceaccount.key',
  }

}
