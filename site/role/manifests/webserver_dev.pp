class role::webserver_dev {
    include profile::base_dev
    include profile::apache3
    include hello
    include example2
}
