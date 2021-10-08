exec {'sed "5d" /etc/default/nginx':
  path => '/bin';
}
