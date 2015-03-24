# Example YAML Syntax for data source configuration
#   Note: sid and database are interchangable, if both are specified,
#         sid takes priority
# ---
# weblogic:
#   datasources:
#   -
#     bleecky1:
#       host:         host1.example.com
#       jdbc_driver:  oracle.driver.something
#       sid:          DB1
#       user:         user1
#       pwd:          s3cr3t1
#   -
#     bleecky2:
#       database:     DB2
#       host:         host2.example.com
#       jdbc_driver:  oracle.driver.something
#       user:         user2
#       pwd:          s3cr3t2

class oracle_fusion_middleware::domain_config {
    $ds_list = 'datasource1'
    $config = hiera_hash('weblogic')

    file {'/tmp/oracle/domain-configuration.py':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('oracle_fusion_middleware/domain-configuration.py.erb')
  }
}
