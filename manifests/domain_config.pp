class oracle_fusion_middleware::domain_config { 
    $ds_list = 'datasource1'
    $config = hiera_hash('weblogic')
    $ds_config = $config['datasources']['name']
    
    file {'/tmp/oracle/ds.properties': 
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/deployment.properties.erb')
  }
}