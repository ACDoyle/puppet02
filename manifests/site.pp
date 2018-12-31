node default {
 # notify {'This is the development environment. Remind me in ${fqdn_rand(100)} minutes': }
  notify {"This is the development environment. Remind me in ${fqdn_rand(100)} minutes": }

  notify {"Test function ${split('1:2:3',':')}" :}
  
  
#  $message = hiera('message','unknown')
#  $message.each |String $test| {
#    notify {"Message is $test": }
#  }

 # $x = [ '1','2' ]
 # $x.each |String $value| {
 #   notify {"M is ${value}": }
 # }
}

node web-d-002 {
  notify {'Hello node 2': }
  class { 'ntp':
    servers => [ 'puppet-master' ],
  }
}
