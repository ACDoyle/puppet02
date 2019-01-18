class base {
  file {'/etc/motd':
    mode    => '0664',
    owner   => '0',
    group   => '0',
    content => inline_template("Managed Node: <%= @hostname %>\nManaged by Puppet version <%= @puppetversion %>\n"),
    tag     => ['motd','base'],
  }

  $base_module_variable=hiera('base::base_module_variable',undef)

  notify { "base_module_variable is $base_module_variable" :}

  package
  {
    ['lsof',
    'unzip',
    'elinks' ]:
    ensure => installed,
    tag    => 'motd',
  }
 
  file { '/tmp/puppet_temp':
    ensure => directory,
  }
  file_line { 'add_line1':
    ensure  => present,
    line    => '[main]',
    path    => '/etc/motd',
    require => File['/etc/motd'],
  } ->
  file_line { 'add-line2':
    ensure  => present,
    line    => 'maxKBps = 2048',
    match   => '^maxKBps.*$',
    path    => '/etc/motd',
  }
  include base::mesage
}
