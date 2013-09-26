class udev::speed inherits udev::lamp {
  apache::listen { '8080': }

  apache::vhost { 'example.com':
    port    => '8080',
    docroot => '/var/www/',
  }

  class { 'varnish':
    port => 80,
  }

  class { 'redis': }
}
