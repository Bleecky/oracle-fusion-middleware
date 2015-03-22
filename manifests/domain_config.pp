class oracle_fusion_middleware::domain_config { 
    $ds_list = 'datasource1'
    $ds_hash = {
	    'datasource1' => {
	      host     => "puppetagent01",
	      sid      => "bleecky",
	      user     => "bleecky",
	      password => "s3cr3t",
	    }
    }
    
    file {'/tmp/oracle/ds.properties': 
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/deployment.properties.erb')
  }
}