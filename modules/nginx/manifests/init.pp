# Manage nginx webserver
class nginx {
  package { 'apache2.2-common':
    ensure => absent,
  }

  package { 'nginx':
    ensure => installed,
    require => Package['apache2.2-common'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
    hasstatus => false,
    require => Package['nginx'],
  }

  file { '/var/www/rodrigopeleias':
    ensure => directory,
    require => Package['nginx'],
  }

  file {'/var/www/rodrigopeleias/index.html':
    source => 'puppet:///modules/nginx/index.html',
    require => File['/var/www/rodrigopeleias'],
  } 

  file { '/etc/nginx/sites-enabled/default':
    source => 'puppet:///modules/nginx/rodrigopeleias.conf',
    notify => Service['nginx'],
  }
}
