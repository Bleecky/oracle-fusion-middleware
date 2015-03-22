class oracle_fusion_middleware::weblogic (
  $install_path     = $oracle_fusion_middleware::params::ora_base,
  $weblogic_version = $oracle_fusion_middleware::params::default_weblogic_version,
){
  case $weblogic_version {
    '12.1.3' : {
      $weblogic_jar = 'wls1213_generic.jar'
      $response_file = 'wls-silent.rsp'
    }
    '12.1.1' : {
      $weblogic_jar = 'wls1211_generic.jar'
      $response_file = 'wls-silent.xml'
    }
    '10.3.6' : {
      $weblogic_jar = 'wls1036_generic.jar'
      $response_file = 'wls-silent.xml'
    }
    default : {
      $weblogic_jar = 'wls1213_generic.jar'
      $response_file = 'wls-silent.rsp'
    }
  } # weblogic version
  
  $response_file_path = "${oracle_fusion_middleware::src_dir}/${response_file}"
  
  file{ $response_file_path :
      ensure  => present,
      owner   => 'oracle',
      group   => 'dba',
      mode    => '0644',
      content => template("oracle_fusion_middleware/${response_file}.erb"),
  }

  case $weblogic_version {
    '12.1.3' : { $install_command = "java -jar ${weblogic_jar} -silent -invPtrLoc /etc/oraInst.loc -responseFile ${response_file_path}" }
    '12.1.1','10.3.6' : { $install_command = "java -jar ${weblogic_jar} -mode=silent -silent_xml=${response_file_path}" }
    default : { $install_command = "java -jar ${weblogic_jar} -silent -invPtrLoc /etc/oraInst.loc -responseFile ${response_file_path}" }
  }
  
  exec {'weblogic:Install Server':
    path    => ['/usr/local/bin',
                '/bin',
                '/usr/bin',
                '/usr/local/sbin',
                '/usr/sbin'],
    command => $install_command,
    creates => "${oracle_fusion_middleware::middleware_home}/registry.xml",
    user    => 'oracle',
    timeout => $timeout,
    require => File['/tmp/wls-silent.xml'],
  }
}