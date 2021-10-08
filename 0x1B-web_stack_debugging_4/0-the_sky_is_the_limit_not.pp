# Increase open file limit
exec {'increase traffic':
  onlyif  => 'test -e /etc/default/nginx',
  command => '/bin/sed -i "5s/[0-9]\+/$( ulimit -n )/" /etc/default/nginx',
}
# Restart Nginx
exec { 'nginx restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
