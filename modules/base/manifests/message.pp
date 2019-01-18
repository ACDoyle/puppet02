class base::message (
  $message_default = "welcome in the jungle"
) {
    file { '/etc/motd_default':
      ensure  => 'file',
      content => $message_default,
    }
} 
