class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }
  $domain = hiera('domain_ssl','unknown')
  apache::vhost { $domain:
    port     => '443',
    docroot  => "/var/www/$domain",
    ssl      => true,
  }
}
