class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }
  notify {"$domain_ssl is ....\n": } ->
  apache::vhost { 'secure-ssl.example.com':
    port     => '443',
    docroot  => "/var/www/secure-ssl.example.com",
    ssl      => true,
  }
}
