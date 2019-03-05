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

node web-d-006 {
 $message=hiera('secret','unknown')
# $mail_detail=hiera('mail_server','unKNOWN')
 $mail_detail=hiera('mail_server',"<%= fqdn %>")

# notify {"Secret is $message": }
 notify {"MAIL_DETAIL is $mail_detail": }
 file { '/tmp/secret_file':
    content => "$message",
  }

}

node web-d-002 {
  notify {'Hello node 2': }
  class { 'ntp': }
  $mess = hiera('puppet_is_enabled',true)
  $xx = hiera('ansible_rsa_priv_key',undef)
  notify {"Value is | $xx ":}
  if $mess { include puppet }
 # class { 'puppet':
 #   status => 'stopped',
 # }
}

