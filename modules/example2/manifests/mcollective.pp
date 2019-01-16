class example2::mcollective {
  notify {'example2::mcollective' :}
  $mcollective_server = 'puppet-master.example.com'

  package { 'mcollective':
    ensure => true,
  }
  service { 'mcollective':
    ensure  => true,
    enabel  => true,
    require => [Package['mcollective'],File['mcollective_server_config']],
  }
  file { 'mcollective_server_config':
    path    => '/etc/mcollective/server.cfg',
    owner   => '0',
    group   => '0',
    mode    => '0640',
    content => template(example2/mcollective/server.cfg.erb'),
    require => Package['mcollective'],
    notify  => Service['mcollective'],
  }
  file { 'facts.yaml':
    path     => '/etc/mcollective/facts.yaml',
    owner    => '0',
    group    => '0',
    mode     => '0640',
    loglevel => 'debug',
    content  => inline_template("---\n<% scope.to_hash.reject { |k,v| k.to_s =~ /(uptime_seconds|timestamp|free)/ }.sort.each do |k, v| %><%= k %>: \"<%= v %>\"\n<% end %>\n"),
    require  => Package['mcollective'],
  }
}
