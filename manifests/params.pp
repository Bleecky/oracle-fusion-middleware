class oracle_fusion_middleware::params (
  $default_weblogic_version = '12.1.3'
  ) {
  case $::operatingsystem {
    'centos', 'redhat', 'OracleLinux' : {
      $downloadpath = '/tmp'
      $installpath = '/u01/app/oracle'

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
  }
  $execlaunchpaths = ["/usr/bin", "/usr/sbin", "/bin", "/sbin", "/etc"]
  $executefrom = "/tmp/"
  
  $downloadurl = "http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/${eclipseflavour}/SR1/${downloadfile}"
}