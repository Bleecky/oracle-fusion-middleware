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
  $base_dir        = oracle_fusion_middleware::params::base_dir,
  $ora_base        = oracle_fusion_middleware::params::ora_base,
  $middleware_home = oracle_fusion_middleware::params::middleware_home,
  $src_dir         = oracle_fusion_middleware::src_dir
)

  inherits oracle_fusion_middleware::params

{

  file {['/tmp/oracle','/tmp/stage']:
    ensure => directory,
    owner  => 'nobody',
    group  => 'nobody',
  }

  # orainst.loc required by all installations
  file {'/tmp/oracle/oraInst.loc':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/oraInst.loc.erb')
  }

  class {'oracle_fusion_middleware::domain_config':}
  contain 'oracle_fusion_middleware::domain_config'
}
