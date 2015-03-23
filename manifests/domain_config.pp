# Example YAML Syntax for data source configuration
# ---
# weblogic:
#   datasources:
#   -
#     name:         bleecky1
#     jdbc_driver:  oracle.driver.something
#     host:         host1
#     sid:          db1
#     user:         user1
#     pwd:          s3cr3t1
#   -
#     name:         bleecky2
#     jdbc_driver:  oracle.driver.something
#     host:         host2
#     sid:          db2
#     user:         user2
#     pwd:          s3cr3t2

class oracle_fusion_middleware::domain_config { 
    $ds_list = 'datasource1'
    $config = hiera_hash('weblogic')
    
    file {'/tmp/oracle/ds.properties': 
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/deployment.properties.erb')
  }
}