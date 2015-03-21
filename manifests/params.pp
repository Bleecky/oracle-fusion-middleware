class oracle_fusion_middleware::params (
  $default_weblogic_version = '12.1.3'
  ) {
  case $::operatingsystem {
    'centos', 'redhat', 'OracleLinux' : {
      $downloadpath     = '/tmp'
      $execlaunchpaths  = ["/usr/bin", "/usr/sbin", "/bin", "/sbin", "/etc"]
      $ora_base         = '/u01/app/oracle'
      $src_dir          = '/u01/app/stage' 
    }

    'windows' : {
      $downloadpath = 'C:\temp'
      $ora_base     = 'C:\app\oracle'
      $src_dir      = 'C:\app\stage'
    }
    
    default   : {
      $downloadpath = '/usr/src/'
      $ora_base     = '/u01/app/oracle'
      $src_dir      = '/u01/app/stage'
    }
  } # $::operatingsystem
  
  
  $middleware_home = "${ora_base}/Middleware"
  
}