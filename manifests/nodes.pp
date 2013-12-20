node 'demo' {
  user { 'rodrigo':
    ensure => present,
    comment => "Rodrigo Peleias",
    home => '/home/rodrigo',
    managehome => true,
    password => '*',
  }

  include nginx
  include git
  include ssh
  include sudoers
}

node 'demo2' {
  include nginx
}

node 'demo3' {
  include nginx
}
