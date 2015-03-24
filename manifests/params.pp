# Class: oracle_fusion_middleware::params
#
class oracle_fusion_middleware::params (
  $default_weblogic_version = '12.1.3'
  ) {
  case $::operatingsystem {
    'centos', 'redhat', 'OracleLinux' : {
      $base_dir         = '/usr/local/app'
      $execlaunchpaths  = ['/usr/bin', '/usr/sbin', '/bin', '/sbin', '/etc']
      $ora_base         = "${base_dir}/oracle"
      $src_dir          = "${base_dir}/stage"
    }

    'windows' : {
      $base_dir     = 'C:\app'
      $ora_base     = "${base_dir}\\oracle"
      $src_dir      = "${base_dir}\stage"
    }
    
    default : {
      $base_dir     = '/usr/local/app'
      $execlaunchpaths  = ['/usr/bin', '/usr/sbin', '/bin', '/sbin', '/etc']
      $ora_base     = "${base_dir}/oracle"
      $src_dir      = "${base_dir}/stage"
    }
  } # $::operatingsystem
  
  
  $middleware_home = "${ora_base}/Middleware"
  
}