class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }
  $domain = hiera('domain_ssl','unknown')
  notify {"$domain is ....": } ->
  apache::vhost { 'secure-ssl.example.com':
    port     => '443',
    docroot  => "/var/www/secure-ssl.example.com",
    ssl      => true,
  }
}
