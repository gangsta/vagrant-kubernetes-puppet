#
##
###
class profiles::kube_base {

  service { 'firewalld':
    ensure => stopped,
  }->
  host { "kube-master.jexia.cloud" :
    ip           => "192.168.10.60",
    host_aliases => "kube-master",
  }->
  host { "kube-node1.jexia.cloud" :
    ip           => "192.168.10.71",
    host_aliases => "kube-node1",
  }->
  host { "kube-node2.jexia.cloud" :
    ip           => "192.168.10.72",
    host_aliases => "kube-node2",
  }->
  host { "kube-node3.jexia.cloud" :
    ip           => "192.168.10.73",
    host_aliases => "kube-node3",
  }

}
