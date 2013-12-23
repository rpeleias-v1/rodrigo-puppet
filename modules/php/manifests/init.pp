class php {
  package { ['php5-cli', 'php5-fpm', 'php-pear']:
    ensure => installed,
  }
}
