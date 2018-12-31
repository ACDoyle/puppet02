# Class: puppet
# ===========================
#
# Full description of class puppet here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'puppet':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class puppet(
  # input parameters and default values for the class
  $is_enabled      = true,
  $version         = 'latest',
  $status          = 'running',
  $enabled         = true,   # required parameter
  $server          = 'puppet-master.example.com',
  $common_loglevel = 'warning',
  $agent_loglevel  = undef,
  $apply_loglevel  = under, 
  $certname         = $::fqdn,
  ) {

  notify {"From class puppet $is_enabled value" }
  # Install the Puppet agent
  package { 'puppet-agent':
    ensure => $version,
    notify => Service['puppet'],
  }
  # Manage the Puppet service
  service { 'puppet':
    ensure    => $status,
    enable    => $enabled,
    subscribe => Package['puppet-agent'],
  }
  file { '/tmp/puppet_test.txt':
    ensure => 'file',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0644',
    source => 'puppet:///modules/puppet/puppet.conf',
  }
  file { '/etc/puppetlabs/puppet/puppet.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template('puppet/puppet.conf.erb'),
  }
}
