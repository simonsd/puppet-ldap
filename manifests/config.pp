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
			owner => ldap,
			group => ldap,
			mode => 0600,
			content => template('ldap/bdb.ldif.erb');

		'monitor.ldif':
			ensure => present,
			path => '/etc/openldap/slapd.d/cn=config/olcDatabase={2}monitor.ldif',
			owner => ldap,
			group => ldap,
			mode => 0600,
			content => template('ldap/monitor.ldif.erb');

		'/var/lib/ldap':
			ensure => directory,
			owner => ldap,
			group => ldap,
			recurse => true;

		'db conf':
			ensure => present,
			path => '/var/lib/ldap/DB_CONFIG',
			owner => ldap,
			group => ldap,
			mode => 0644,
			content => template('ldap/db_config.erb');

		'ldap prefs':
			ensure => present,
			path => '/etc/sysconfig/ldap',
			owner => root,
			group => root,
			mode => 0644,
			content => template('ldap/ldap.sysconf.erb');

		'slapd cert':
			ensure => present,
			path => '/etc/pki/tls/certs/slapdcert.pem',
			owner => root,
			group => ldap,
			mode => 0600,
			content => template('ldap/slapdcert.pem.erb');

		'slapd key':
			ensure => present,
			path => '/etc/pki/tls/certs/slapdkey.pem',
			owner => root,
			group => root,
			mode => 0750,
			content => template('ldap/slapdkey.pem.erb');
	}
}
