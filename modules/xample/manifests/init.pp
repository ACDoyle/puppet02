class xample {
  case $facts['os']['family'] {
    'RedHat': {
       notify { 'RedHat case detected': }
     }
     default : {
       fail("Your facts is not supportes")
     }
   }
  include xample::test
  include xample::service
  
}
