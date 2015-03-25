# oracle-fusion-middleware
Puppet Module for installing and configuring the Oracle Fusion Middleware Product set.

Currently limited to Weblogic Server; Functionality will follow for SOA Suite, Service Bus and BAM

## Compatability

Redhat Linux 6.x and Oracle Enterprise Linux 6.x

## Pre-requisites

Installation media is not downloaded by this module and should be available to the module in the src_dir.  The module default is '/usr/local/app/stage'

	class {'oracle_fusion_middleware':
		src_dir => '/u01/app/stage'
		}

## Basic usage

Default mode for this module is to do a basic install of Oracle Weblogic Server 12.1.3 into /usr/local/app/oracle/Middleware

	include oracle_fusion_middleware
	
or

	class {'oracle_fusion_middleware':}
	
## Domain configuration

To configure a domain pass the configurstion data through as a puppet hash to the $config variable

### Domain configuration via Hiera

	weblogic:
	 domain:
	 	admin_pwd:	   s3cr3t
	 	name:		   bleecky
	 datasources:
	 -
	   bleecky1:
	     host:         host1.example.com
	     jdbc_driver:  oracle.driver.something
	     sid:          DB1
	     user:         user1
	     pwd:          s3cr3t1
	 -
	   bleecky2:
	     database:     DB2
	     host:         host2.example.com
	     jdbc_driver:  oracle.driver.something
	     user:         user2
	     pwd:          s3cr3t2
