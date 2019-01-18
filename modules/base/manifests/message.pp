class base::message (
  $message_default = "welcome in the jungle"
) {
    $mess_chaos = @(END)
    #Managed by puppet - do not edit
    first_line = x
    second line = y
    END

    file { '/etc/motd_default':
      ensure  => 'file',
      content => hiera('message::message_default',$message_default),
    }
    file { '/tmp/chaos':
      ensure  => 'file',
      content => $mess_chaos,
    }
} 
