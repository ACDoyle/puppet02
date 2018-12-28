class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }

  apache::vhost { $domain_ssl:
    port     => '443',
    docroot  => "/var/www/$domain_ssl",
    ssl      => true,
  }
}
