class ldap::services {
	service {
		'slapd':
			ensure => running,
			enable => true;
	}
}
