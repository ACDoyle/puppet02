class example2 {
  file { '/etc/mcollective/':
    ensure  => 'directory',
    owner   => '0',
    group   => '0',
    mode    => '0640',
    recurse => true,
  }
  file { '/etc/mcollective/ssl/':
    ensure  => 'directory',
    owner   => '0',
    group   => '0',
    mode    => '0640',
    recurse => true,
  }
  file {'mcollective_server_cert':
    path   => '/etc/mcollective/ssl/mcollective_public.pem',
    owner  => '0',
    group  => '0',
    mode   => '0640',
    source => 'puppet:///modules/example2/mcollective/mcollective_public.pem',
  }
  file {'mcollective_server_private':
    path   => '/etc/mcollective/ssl/mcollective_private.pem',
    owner  => '0',
    group  => '0',
    mode   => '0600',
    source => 'puppet:///modules/example2/mcollective/mcollective_private.pem',
  }
  include example2::mcollective
}
