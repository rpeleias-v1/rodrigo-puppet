node 'demo' {

  include nginx
  include git
  include ssh
  include sudoers
  include php

  base::user { 'rodrigo':
    comment => 'Creation of user Rodrigo',
    password => 'Bacon',
  }

  base::user { 'daniscabello':
    comment => 'Daniela user account',
    password => 'paralelepipedo007',
  }

  base::execution{ 'echo I ran a command on `date` > /tmp/output':
    comment => "Command execution",
  }

  base::cron-execution { 'rsync -az /var/www/rodrigopeleias/ /rodrigopeleias-backup/':
    hour => '04',
    minute => '00',
  }

  $site_name = 'rodrigopeleias'
  $site_domain = 'rodrigopeleias.com'
  file { '/etc/nginx/sites-enabled/cat-pictures.conf':
    content => template('nginx/vhost.conf.erb'),
    notify => Service['nginx'],
  }

  nginx::website { 'adorable-animals':
    site_domain => 'adorable-animals.com',
  }

  class  {'ntp':
    server => 'us.pool.ntp.org',
  }
}
