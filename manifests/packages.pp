class ldap::packages {
	package {
		'ldap':
			ensure => present,
			name => "openldap.$hardwaremodel";

		'ldap_devel':
			ensure => present,
			name => "openldap-devel.$hardwaremodel";

		'ldap_client':
			ensure => present,
			name => "openldap-clients.$hardwaremodel";

		'ldap_server':
			ensure => present,
			name => "openldap-servers.$hardwaremodel";
	}

	realize(Package['ldap', 'ldap_devel'])
}
