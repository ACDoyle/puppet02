class profile::apache {
  class { 'apache':
    default_mods        => false,
    default_confd_files =>false,
   }
}
