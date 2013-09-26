class udev::lamp {
  apt::source { 'mariadb':
    location          => 'http://ftp.ddg.lth.se/mariadb/repo/5.5/ubuntu',
    release           => 'precise',
    repos             => 'main',
    key               => '1BB943DB',
    key_server        => 'keyserver.ubuntu.com',
  }

  class { 'mysql::server':
    package_name  => 'mariadb-server',
    require       => Apt::Source['mariadb'],
  }

  class { 'php': }

  php::module { [ 'mysql', 'gd', ]: }

  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork',
  }

  apache::mod { 'php5': }
  apache::mod { 'rewrite': }
}
