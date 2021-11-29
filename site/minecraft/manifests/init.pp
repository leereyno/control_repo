class minecraft {

  file {'/opt/minecraft':
    ensure => directory,
  }

  file {'/opt/minecraft/server.jar':
    ensure => file,
    source => 'http://192.168.1.10/minecraft/server.jar',
    before => Service['minecraft'],
  }

  file {'/etc/yum.repos.d/epel.repo':
    ensure => file,
    source => 'puppet:///modules/minecraft/epel.repo'
  }

  package {'java-latest-openjdk-17.0.1.0.12-1.rolling.el7.x86_64':
    ensure => present
  }

  file {'/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
  }

  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service'
  }

  service {'minecraft':
    ensure  => running,
    enable  => true,
    require => [Package['java-latest-openjdk-17.0.1.0.12-1.rolling.el7.x86_64'],File['/opt/minecraft/eula.txt'],File['/etc/systemd/system/minecraft.service']]
  }

}

