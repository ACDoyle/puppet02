class test_params (
  $varX = $test_params::params::var1i,
) {
  notify { "Variable from test_params class is $varX": }

}
