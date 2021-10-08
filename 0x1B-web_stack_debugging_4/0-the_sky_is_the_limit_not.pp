exec {'/bin/sed "5d" /etc/default/nginx':
  notify => Service[nginx],
}

service { nginx:
  ensure => running,
}
