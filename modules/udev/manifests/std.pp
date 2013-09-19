class udev::std {
  package { 'git':
    ensure => true,
  }

  package { 'emacs23-nox':
    ensure => true,
  }
}
