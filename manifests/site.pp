node default {
  notify {'This is the development environment': }

  file { '/tmp/hostname':
    content => "Hello, world!\n",
  }
}
