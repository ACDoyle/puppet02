class base::message (
  $message_default = "welcome in the jungle"
) {
    file { '/etc/motd_default':
      ensure  => 'file',
      content => hiera('message::message_default',$message_default),
    }
} 
