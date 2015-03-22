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
  $base_dir         = oracle_fusion_middleware::params::base_dir,
  $ora_base         = oracle_fusion_middleware::params::ora_base,
  $middleware_home  = oracle_fusion_middleware::params::middleware_home,
  $src_dir          = oracle_fusion_middleware::src_dir
  )
  
  inherits oracle_fusion_middleware::params  

{

  file {[$base_dir,$ora_base,$src_dir]:
    ensure  => present,
    owner   => 'vagrant',
    group   => 'vagrant',
  }
  
  # orainst.loc required by all installations
  file {"${ora_base}/oraInst.loc": 
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/oraInst.loc.erb')
  }
  
  class {'oracle_fusion_middleware::domain_config':}
}
