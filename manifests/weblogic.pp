# Class: oracle_fusion_middleware::weblogic
#
class oracle_fusion_middleware::weblogic (
  $install_path     = $::oracle_fusion_middleware::params::ora_base,
  $timeout          = undef,
  $weblogic_version = $::oracle_fusion_middleware::params::default_weblogic_version,
){
  $exec_path          = $::oracle_fusion_middleware::params::env_path
  $middleware_home    = $::oracle_fusion_middleware::middleware_home
  $middleware_src_dir = $::oracle_fusion_middleware::src_dir

  case $weblogic_version {
    '12.1.3' : {
      $weblogic_jar       = 'wls1213_generic.jar'
      $response_file      = 'wls-silent.rsp'
      $response_file_path = "${middleware_src_dir}/${response_file}"
      $install_args       = "-silent -invPtrLoc /etc/oraInst.loc -responseFile ${response_file_path}"
    }
    '12.1.1' : {
      $weblogic_jar       = 'wls1211_generic.jar'
      $response_file      = 'wls-silent.xml'
      $response_file_path = "${middleware_src_dir}/${response_file}"
      $install_args       = "-mode=silent -silent_xml=${response_file_path}"
    }
    '10.3.6' : {
      $weblogic_jar       = 'wls1036_generic.jar'
      $response_file      = 'wls-silent.xml'
      $response_file_path = "${middleware_src_dir}/${response_file}"
      $install_args       = "-mode=silent -silent_xml=${response_file_path}"
    }
    default : {
      $weblogic_jar       = 'wls1213_generic.jar'
      $response_file      = 'wls-silent.rsp'
      $response_file_path = "${middleware_src_dir}/${response_file}"
      $install_args       = "-silent -invPtrLoc /etc/oraInst.loc -responseFile ${response_file_path}"
    }
  } # weblogic version

  file{'weblogic: Response file':
      ensure  => present,
      owner   => 'oracle',
      path    => $response_file_path,
      group   => 'dba',
      mode    => '0644',
      content => template("oracle_fusion_middleware/${response_file}.erb"),
  }

  exec {'weblogic:Install Server':
    path    => $exec_path,
    command => "java -jar ${weblogic_jar} ${install_args}",
    creates => "${middleware_home}/registry.xml",
    user    => 'oracle',
    timeout => $timeout,
    require => File['weblogic: Response file'],
  }
}