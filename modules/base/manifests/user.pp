# Module for user inclusion
define base::user($comment = 'Ubuntu user', $password = '*'){
  user { $name:
    ensure => present,
    comment => $comment,
    home => "/home/${name}",
    managehome => true,
    password => $password,
  }    
}
