class base {
  file {'/etc/motd':
    mode    => '0664',
    owner   => '0',
    group   => '0',
    content => inline_template("Managed Node: <%= @hostname %>\nManaged by Puppet version <%= @puppetversion %>\n"),
    tag     => ['motd','base'],
  }

  package
  {
    ['lsof',
    'unzip',
    'elinks' ]:
    ensure => installed,
    tag    => 'motd',
  }
}
