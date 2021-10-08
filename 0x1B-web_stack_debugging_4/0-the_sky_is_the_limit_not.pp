exec {'/bin/sed -i "5s/[0-9]\+/$( ulimit -n )/" /etc/default/nginx':
  notify => Service[nginx],
}

service { 'nginx':
  ensure => running,
}
