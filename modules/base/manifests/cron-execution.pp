define base::cron-execution($comment = 'Run any command', $hour, $minute) {
  Exec {
    path => ['/bin', '/user/bin']
  }
  
  cron { $comment:
    command => $name,
    hour => $hour,
    minute => $minute,
  }
}
