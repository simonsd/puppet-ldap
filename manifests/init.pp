import 'packages.pp'
import 'config.pp'

class ldap {
	include ldap::packages
	include ldap::config

	Class['ldap::packages'] -> Class['ldap::config']
}
