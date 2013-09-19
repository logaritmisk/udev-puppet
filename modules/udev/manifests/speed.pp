class udev::speed {
  class { 'apache':
    default_vhost => false,
  }

  apache::listen { '8080': }

  class { 'varnish':
    backendport => 8080,
    port        => 80,
  }
}
