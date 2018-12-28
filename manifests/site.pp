node default {
  notify {'This is the development environment': }

  
  
#  $message = hiera('message','unknown')
#  $message.each |String $test| {
#    notify {"Message is $test": }
#  }

 # $x = [ '1','2' ]
 # $x.each |String $value| {
 #   notify {"M is ${value}": }
 # }
}
