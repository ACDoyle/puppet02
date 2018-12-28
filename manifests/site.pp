node default {
  notify {'This is the development environment': }

  
  
  $message = hiera('message','unknown')
  notify {"Message is $message": }

  $x = [ '1','2' ]
  notify { "TEST ARRAY $x": }  
}
