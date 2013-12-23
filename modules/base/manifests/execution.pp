define base::execution($comment = 'Run any command') {
  Exec {
    path => ['/bin', '/user/bin']
  }
  
  exec { $comment:
    command => $name,
  }
}
