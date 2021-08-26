# Puppet manifest
# Configure a Nginx server with a custom HTTP header and two web pages.

# Install Nginx
exec { 'update':
  command  => 'apt-get update',
  user     => 'root',
  provider => 'shell',
}
->

package { 'nginx':
  ensure   => installed,
}
->

# Set default hostname to static hostname
exec { 'hostname -b $(hostnamectl --static)':
	path => '/bin',
}
->

# Create webpages
# Index
file { '/var/www/html/index.html':
	ensure  => file,
	content => "Holberton School for the win!",
}
->

# 404 page
file { '/var/www/html/404.html':
	ensure  => file,
	content => "Ceci n'est pas une page",
}
->

# Configure Nginx server
exec { 'Set default /redirect_me':
  command  => 'sed -i "48i \\\n\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}" /etc/nginx/sites-available/default',
  user     => 'root',
  provider => 'shell'
}
->

# Index
file { '/var/www/html/index.html':
	ensure  => file,
	content => "Holberton School for the win!",
}
->

# 404 page
file { '/var/www/html/404.html':
	ensure  => file,
	content => "Ceci n'est pas une page",
}
->

# Launch Nginx server
service { 'nginx':
	ensure => running,
}
