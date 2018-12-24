class profile::apache {
    $apache = $::family {
        'RedHat' => 'httpd',
        'Debian' => 'apache2',
        }
    service { "$apache":
        enable => true,
        ensure => true,
    }
    package { "apache":
        ensure => 'installed',
    }
}
