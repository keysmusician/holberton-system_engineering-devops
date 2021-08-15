# Create an SSH configuration file
file { '/home/vagrant/.ssh/config':
  ensure  => file,
  content => "# SSH configuration file\nIdentityFile ~/.ssh/holberton\nPasswordAuthentication no",
}
