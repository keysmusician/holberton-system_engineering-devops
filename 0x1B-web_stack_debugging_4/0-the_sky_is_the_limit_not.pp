exec {'/bin/sed -i "5d" /etc/default/nginx':
  notify => Service['nginx'],
}

service { 'nginx':
  ensure => running,
}
