class udev::speed inherits udev::lamp {
  Class['apache'] {
    default_vhost => false,
  }

  apache::listen { '8080': }

  class { 'varnish':
    port => 80,
  }

  class { 'redis': }
}
