node 'demo' {
  user { 'rodrigo':
    ensure => present,
    comment => "Rodrigo Peleias",
    home => '/home/rodrigo',
    managehome => true,
    password => '*',
  }

  # Define default packages for commands search
  Exec { 
    path => ['/bin', '/usr/bin']
  }

  exec { 'Run any command':
    # command => "/bin/echo I ran this command on `/bin/date` > /tmp/output.txt",
    command => "echo I ran this command on `date` > /tmp/output.txt",
  }

  exec { 'Download public key for John':
    cwd => '/tmp',
    #command => '/usr/bin/wget http://bitfieldconsulting.com/files/john.pub',
    command => 'wget http://bitfieldconsulting.com/files/john.pub',
    creates => '/tmp/john.pub',
  }

  cron { 'Back up rodrigo peleias website':
    command => 'rsync -az /var/www/rodrigopeleias/ /rodrigopeleias-backup/',
    hour => '04',
    minute => '00',
  }

  include nginx

  $site_name = 'rodrigopeleias'
  $site_domain = 'rodrigopeleias.com'
  file { '/etc/nginx/sites-enabled/cat-pictures.conf':
    content => template('nginx/vhost.conf.erb'),
    notify => Service['nginx'],
  }

  include git
  include ssh
  include sudoers

  # file { '/var/www/rodrigopeleias/img':
  #  source => 'puppet:///modules/rodrigopeleias/img',
  #  recurse => true,
  #  require => File['/var/www/rodrigopeleias'],
  #}

  nginx::website { 'adorable-animals':
    site_domain => 'adorable-animals.com',
  }

  class  {'ntp':
    server => 'us.pool.ntp.org',
  }

  include php
}

node 'demo2' {
  include nginx
}

node 'demo3' {
  include nginx
}
