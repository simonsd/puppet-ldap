import 'packages.pp'
import 'config.pp'
import 'services.pp'

class ldapclass (
	$rootpass,
	$secondlevel_domain,
	$toplevel_domain
) {
	include ldap::packages
	include ldap::config
	include ldap::services

	Class['ldap::packages'] -> Class['ldap::config'] -> Class['ldap::services']
}
