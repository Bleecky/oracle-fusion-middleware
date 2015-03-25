# Class: oracle_fusion_middleware
#
# This module manages oracle_fusion_middleware
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class oracle_fusion_middleware (
  $base_dir           = oracle_fusion_middleware::params::base_dir,
  $domain_config      = hiera_hash('weblogic'), # TODO replace by undef prior to release 1
  $ora_base           = oracle_fusion_middleware::params::ora_base,
  $ora_inst           = oracle_fusion_middleware::params::ora_inst,
  $middleware_home    = oracle_fusion_middleware::params::middleware_home,
  $src_dir            = oracle_fusion_middleware::params::src_dir,
)

  inherits oracle_fusion_middleware::params

{

  file {[${base_dir},${ora_base},${src_dir}]:
    ensure => directory,
    owner  => 'nobody',
    group  => 'nobody',
  }

  # orainst.loc required by all installations
  file {'oracle_fusion_middleware: oraInst.loc':
    ensure  => present,
    owner   => 'root',
    path    => $ora_inst,
    group   => 'root',
    content => template('oracle_fusion_middleware/oraInst.loc.erb')
  }

  class {'oracle_fusion_middleware::domain_config':}
  contain 'oracle_fusion_middleware::domain_config'
}
