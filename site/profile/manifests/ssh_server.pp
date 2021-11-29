class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC0GKxOy2takUtLQwwtcyFY9vO6QYpVBv/7B+GtxBGfu0YCzmcr5w6cxde5y5cDt4rT2YQGtE8hwfseOGjfKYsdjqisyqqbLGHI/dkjEfcpT/xCfW3qTHTajREfyj2s0WwXfsWwAQzx4iqc+Tq0O83o/OZA5AD0/FtuW1oN+RC2aXGTmeYtxCBC2YVHvEC2+cHTMJ0MkPbv/Q+Jh6ff+qSZJJh15PxEZXOjnHrj2Ho2c8ra3e02nzRc14pjpQ9D6zPKjutO/6+4uJrbG4WEYBxTwRgry0x+08XlU2VCHg4DV9DBVZOQ39HYAUEkIDifEp0QmZn+oNsqduiO04mRRThX',
	}  
}
