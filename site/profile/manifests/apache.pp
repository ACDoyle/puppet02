class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }
  $domain = hiera('domain_ssl','unknown')
  $domain.each |String $binary| {
    apache::vhost { "${binary}":
      port     => '443',
      docroot  => "/var/www/${binary}",
      ssl      => true,
    }
  }
}
