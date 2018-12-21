class example {
  file { 'hello-example':
    path    => '/tmp/hello-example',
    content => "Hello World from example class\n",
  }

  notify { 'This is from the site directory': }
  
}

