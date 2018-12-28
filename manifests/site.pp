node default {
  notify {'This is the development environment': }

  

#  $message = hiera('message','unknown')
#  notify {"Message is $message": }
}
