class ldap::config {
	file {
		'slapd.conf':
			ensure => present,
			path => '/etc/openldap/slapd.conf',
			owner => root,
			group => root,
			mode => 0600,
			content => template('ldap/slapd.conf.erb');

		'bdb.ldif':
			ensure => present,
			path => '/etc/openldap/slapd.d/cn=config/olcDatabase={1}bdb.ldif',
			owner => root,
			group => root,
			mode => 0600,
			content => template('ldap/bdb.ldif.erb');
	}

	exec {
		'slappasswd':
			command => "slappasswd -s $ldap_rootpass",
			path => '/bin:/sbin:/usr/bin:/usr/sbin',
	}
}
