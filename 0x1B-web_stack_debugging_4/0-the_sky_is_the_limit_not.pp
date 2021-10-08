exec {'/bin/sed -i "5d" /etc/default/nginx':
  onlyif  => 'test -e /etc/default/nginx',
  notify => Service[nginx],
}

service { 'nginx':
  ensure => running,
}
