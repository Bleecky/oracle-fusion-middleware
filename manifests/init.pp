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
  $ora_base         = oracle_fusion_middleware::params::ora_base,
  $middleware_home  = oracle_fusion_middleware::params::middleware_home,
  $src_dir          = oracle_fusion_middleware::src_dir
  )
  
  inherits oracle_fusion_middleware::params  

{
  # orainst.loc required by all installations
  file {'/etc/oraInst.loc': 
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/oraInst.loc.erb')
  }
  file {['/u01/app','/u01/app/stage']:
    ensure  => present,
    owner   => 'oracle',
    group   => 'dba',
  }
}
