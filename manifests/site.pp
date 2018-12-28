node default {
  notify {'This is the development environment': }

  include hello
  

  $message = hiera('message','unknown')
  notify {"Message is $message": }

  include role::webserver

}
