import 'packages.pp'
import 'config.pp'
import 'services.pp'

class ldapclass {
	include ldap::packages
	include ldap::config
	include ldap::services

	Class['ldap::packages'] -> Class['ldap::config'] -> Class['ldap::services']
}
