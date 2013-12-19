class ssh {
  service { 'ssh':
    ensure => running,
    restart => '/usr/sbin/service ssh reload',
  }
}
