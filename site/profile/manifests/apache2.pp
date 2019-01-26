class profile::apache2 {
  $apache = $::osfamily ? {
    'RedHat'  => 'httpd',
    'Debian'  => 'apache2',
  }
  service { $apache:
    enable => true,
    ensure => true,
    require => Package["$apache"],
  }
  package { $apache:
    ensure => 'installed',
  }
}
