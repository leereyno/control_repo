node default {
  #
  #  file {'/root/README':
  #    ensure  => file,
  #    content => 'This is a readme',
  #    owner   => 'root',
  #  }

  # Yum stuff
  # https://forge.puppet.com/modules/puppet/yum

  # Only allow two kernel releases on the system at any given time
  yum::config { 'installonly_limit':
    ensure => 2,
  }

  yum::group { 'development':
    ensure  => present,
    timeout => 300,
  }

  yum::group { 'additional-devel':
    ensure  => present,
    timeout => 600,
  }


}

