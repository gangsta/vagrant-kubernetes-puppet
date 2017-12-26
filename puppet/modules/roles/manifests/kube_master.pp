#
##
###
class roles::kube_master {

  include profiles::kube_base
  include profiles::kube_master_key
}
