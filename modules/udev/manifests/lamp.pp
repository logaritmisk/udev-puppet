class udev::lamp {
  apt::source { 'mariadb':
    location          => 'http://ftp.ddg.lth.se/mariadb/repo/5.5/ubuntu',
    release           => 'precise',
    repos             => 'main',
    key               => '1BB943DB',
    key_server        => 'keyserver.ubuntu.com',
  }

  class { 'mysql':
    client_package_name => 'mariadb-client',
    server_package_name => 'mariadb-server',
    require             => Apt::Source['mariadb'],
  }

  class { 'mysql::server':
    config_hash  => { 'root_password' => 'toor' },
    require      => Apt::Source['mariadb'],
  }

  class { 'mysql::php':
    require => Apt::Source['mariadb'],
  }

  class { 'php': }

  class { 'php::apache2': }
}
