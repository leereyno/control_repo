class minecraft 
(
  $url = 'http://192.168.1.10/minecraft/server.jar',
  $install_dir = '/opt/minecraft'
)

{

  file { $install_dir:
    ensure => directory,
  }

  file {"${install_dir}/server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }

  file {'/etc/yum.repos.d/epel.repo':
    ensure => file,
    source => 'puppet:///modules/minecraft/epel.repo'
  }

  package {'java-latest-openjdk-17.0.1.0.12-1.rolling.el7.x86_64':
    ensure => present
  }

  file {"${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }

  file {'/etc/systemd/system/minecraft.service':
    ensure  => file,
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir,
      }
    )
  }

  service {'minecraft':
    ensure  => running,
    enable  => true,
    require => [Package['java-latest-openjdk-17.0.1.0.12-1.rolling.el7.x86_64'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']]
  }

}

