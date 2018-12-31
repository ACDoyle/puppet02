node default {
  notify {'This is the development environment. Remind me in ${fqdn_rand(100)} minutes': }

  
  
#  $message = hiera('message','unknown')
#  $message.each |String $test| {
#    notify {"Message is $test": }
#  }

 # $x = [ '1','2' ]
 # $x.each |String $value| {
 #   notify {"M is ${value}": }
 # }
}
