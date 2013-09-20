class udev::standard inherits udev::lamp {
  apache::listen { '80': }

  apache::vhost { 'example.com':
    port    => '80',
    docroot => '/var/www/',
  }
}
