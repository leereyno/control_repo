node default {
  #
  #  file {'/root/README':
  #    ensure  => file,
  #    content => 'This is a readme',
  #    owner   => 'root',
  #  }
  #
  #  # Yum stuff
  #  # https://forge.puppet.com/modules/puppet/yum
  #
  #  # Only allow two kernel releases on the system at any given time
  #  yum::config { 'installonly_limit':
  #    ensure => 2,
  #  }
  #
  #  yum::group { 'development':
  #    ensure  => present,
  #    timeout => 300,
  #  }
  #
  #  yum::group { 'additional-devel':
  #    ensure  => present,
  #    timeout => 600,
  #  }
  #
}

node 'master.puppet.vm' {
  include role::master_server
  file { '/root/README':
    ensure  => file,
    content => "Welcome to ${fqdn}\n",
  }
}

node 'minetest.puppet.vm' {
  include role::minecraft_server
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}


