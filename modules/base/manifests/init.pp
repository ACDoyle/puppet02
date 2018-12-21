class base {
  file {'/etc/motd':
    mode    => '0644',
    owner   => '0',
    group   => '0',
    content => inline_template("Managed Node: <%= @hostname %>\nManaged by Puppet version <%= @puppetversion %>\n"),
  }

  package
  {
    ['cron',
    'locate',
    'lsof',
    'unzip',
    'elinks' ]:
    ensure => installed, 
  }
}
