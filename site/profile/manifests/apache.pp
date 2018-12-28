class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }
  apache::vhost { 'ssl.example.com':
    port     => '443',
    docroot  => '/var/www/ssl',
    ssl      => true,
  }
}
