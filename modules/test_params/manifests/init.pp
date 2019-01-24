class test_params (
  $varX = $test_params::params::var1,
) inherits test_params::params {
  notify { "Variable from test_params class is $varX": }

}
