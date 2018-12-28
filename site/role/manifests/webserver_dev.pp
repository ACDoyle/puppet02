class role::webserver_dev {
    include profile::base
    include profile::apache
    include hello
    class {web:}   
}
