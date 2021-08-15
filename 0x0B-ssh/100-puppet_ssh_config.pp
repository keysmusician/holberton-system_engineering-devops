# Create an SSH configuration file
file { '/etc/ssh/ssh_config':
  ensure  => file,
  content => "# SSH configuration file\nIdentityFile ~/.ssh/holberton\nPasswordAuthentication no",
}
