node default {
  notify {'This is the development environment': }

  file { '/tmp/hostname':
    content => "Hello, world!\n",
  }
  include hello
  
  include example

  $message = hiera('message','unknown')
  notify {"Message is $message": }

}
