class oracle_fusion_middleware::weblogic (
  $install_path     = $oracle_fusion_middleware::params::installpath,
  $media_src_dir    = $oracle_fusion_middleware::params::downloadfile,
  $weblogic_version = $oracle_fusion_middleware::params::default_weblogic_version,
){
  case $weblogic_version {
    '12.1.1' : {$server_jar = 'wls1211_generic.jar'}
    '10.3.6' : {$server_jar = 'wls1036_generic.jar'}
    default : {$server_jar = 'wls1211_generic.jar'}
  }

  file{
    #TODO Is this the right place for the install xml?
    '/tmp/wls-silent.xml':
      ensure  => present,
      owner   => 'oracle',
      group   => 'dba',
      mode    => '0644',
      content => template('oracle_fusion_middleware/wls-silent.xml.erb'),
    ;
  }

  exec {'weblogic:Install Server':
    path    => ['/usr/local/bin',
                '/bin',
                '/usr/bin',
                '/usr/local/sbin',
                '/usr/sbin'],
    command => "java -jar ${weblogic_jar} -mode=silent -silent_xml=/tmp/wls-silent.xml",
    creates => "${middleware_home}/registry.xml",
    user    => 'oracle',
    timeout => $timeout,
    require => File['/tmp/wls-silent.xml'],
  }
}