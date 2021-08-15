file { '~/.ssh/config':
  ensure  => file,
  content => '# SSH configuration file\nIdentityFile ~/.ssh/holberton\nPasswordAuthentication no'
  path    => '~/.ssh/config'
}
