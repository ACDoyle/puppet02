class role::webserver_dev {
    include profile::base_dev
    include profile::apache
    include profile::apache2
}
