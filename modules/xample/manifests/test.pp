class xample::test {
  notify {'Test from xample' :}
  file { /tmp/xample.txt':
    content => file('xample/xample.txt'),
    notify  => Class['xample::service'],
  }
}
