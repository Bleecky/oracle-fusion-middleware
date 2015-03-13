class oracle_fusion_middleware::params (
  $default_weblogic_version = '12.1.3'
  ) {
  case $::operatingsystem {
    'centos', 'redhat', 'OracleLinux' : {
      $downloadpath = '/tmp'
      $installpath = '/u01/app/oracle'
      $execlaunchpaths = ["/usr/bin", "/usr/sbin", "/bin", "/sbin", "/etc"]
      
      case $::architecture {
        'x86_64' : { $downloadfile = "eclipse-${eclipsetype}-${eclipseflavour}-SR1-linux-gtk-x86_64.tar.gz" }
        default  : { $downloadfile = "eclipse-${eclipsetype}-${eclipseflavour}-SR1-linux-gtk.tar.gz" }
      } 
    }

    'windows' : {
      $downloadpath = 'C:\temp'
      $installpath = 'C:\Program Files (x86)\Oracle'

      case $::architecture {
        'x86_64' : { $downloadfile = "eclipse-${eclipsetype}-${eclipseflavour}-SR1-win32-x86_64.zip" }
        default  : { $downloadfile = "eclipse-${eclipsetype}-${eclipseflavour}-SR1-win32.zip" }
      }
    }
    
    default   : {
      $downloadpath = '/usr/src/'
      $installpath = '/u01/app/'

      case $::architecture {
        'x86_64' : { $downloadfile = "eclipse-${eclipsetype}-${eclipseflavour}-SR1-linux-gtk-x86_64.tar.gz" }
        default  : { $downloadfile = "eclipse-${eclipsetype}-${eclipseflavour}-SR1-linux-gtk.tar.gz" }
      }
    }
  } # $::operatingsystem
  
  $middleware_home = "${installpath}/Middleware"
  
}