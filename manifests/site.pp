node default {
  #
  #  file {'/root/README':
  #    ensure  => file,
  #    content => 'This is a readme',
  #    owner   => 'root',
  #  }

  package { 'gcc.x86_64':
    ensure => present,
  }

  yum::group { 'development','additional-devel':
    ensure  => present,
    timeout => 300,
  }
}

