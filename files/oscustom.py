#===============================================================================
#
# Name : oscustom.py
# Author : Peter Bleeck <peter.bleeck@os.uk>
# Date : March '14
# Description : All custom functions required by os.uk added to WLST Library
#
#===============================================================================

#===============================================================================
# Define functions for setting up datasources
# Usage :
#  configureDataSource(dsName, jdbcDriver, 'jdbc/' + dsName, dbUser, dbUserPasswd, dbURL)
#===============================================================================
def configureDataSource(dsName, JDBCDriver, dsJNDI, dbUser, dbPasswd, dbURL):
  # Clean up existing datasources
  try:
    cd('/')
    delete(dsName,'JDBCSystemResource')
    print 'Deleting datasource ' + dsName
  except:
    print dsName + ' datasource does not exist.'

  try:
    print 'Creating new datasource ' + dsName
    # Create datasource
    cd('/')
    create(dsName, 'JDBCSystemResource')

    # Configure datasource connections
    print 'Configure datasource connection settings for ' + dsName
    cd('/JDBCSystemResource/' + dsName + '/JdbcResource/' + dsName)
    print 'Creating Driver Parameters'
    driverParams=create('driverParams', 'JDBCDriverParams')
    driverParams.setUrl(dbURL)
    driverParams.setDriverName(JDBCDriver)
    driverParams.setUseXaDataSourceInterface(false)
    driverParams.setPasswordEncrypted(dbPasswd)
    cd('JDBCDriverParams/NO_NAME_0')
    print 'Creating driver properties'
    create(dsName, 'Properties')
    cd('Properties/NO_NAME_0')
    create('user', 'Property')
    cd('Property/user')
    cmo.setValue(dbUser)

    # Configure datasource parameters
    print 'Configure datasource parameters for ' + dsName
    cd('/JDBCSystemResource/' + dsName + '/JdbcResource/' + dsName)
    dataSourceParams=create('dataSourceParams', 'JdbcDataSourceParams')
    cd('JDBCDataSourceParams/NO_NAME_0')
    set('JNDIName', dsJNDI)

    # Configure connection pool parameters
    print 'Configure connection pool settings for ' + dsName
    cd('/JDBCSystemResource/' + dsName + '/JdbcResource/' + dsName)
    connPoolParams=create('connPoolParams','JdbcConnectionPoolParams')
    connPoolParams.setMaxCapacity(50)
    connPoolParams.setInitialCapacity(1)
    connPoolParams.setCapacityIncrement(1)
    connPoolParams.setTestConnectionsOnReserve(true)
    connPoolParams.setTestTableName('SQL SELECT 1 FROM DUAL')
    print 'Datasource ' + dsName + ' created'
  except:
    print 'Some random exception occurred.'
    dumpStack()
    exit('y', 2)
