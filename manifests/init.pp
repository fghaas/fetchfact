class fetchfact {

  file { '/etc/facter':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755'
  }

  file { '/etc/facter/facts.d':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
    require => File['/etc/facter']
  }
}
