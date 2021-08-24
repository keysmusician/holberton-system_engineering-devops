# Puppet manifest
# Configure a Nginx server with a custom HTTP header and two web pages.

# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Set hostname
exec { 'hostname -b $(hostnamectl --static)':
	path => '/bin',
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
	ensure  => file,
	content => '
		server {
			listen 80;
			listen [::]:80 default_server;
			root   /var/www/html;
			index  index.html;
			location /redirect_me {
				return 301 https://www.youtube.com/c/JustinMasayda;
			}
			error_page 404 /404.html;
			add_header X-Served-By $HOSTNAME;
		}
		',
}

# Create webpages
# website directory
file { ['/var/www', '/var/www/html']:
	ensure => directory,
}

# Index
file { '/var/www/html/index.html':
	ensure  => file,
	content => "Holberton School for the win!",
}

# 404
file { '/var/www/html/404.html':
	ensure  => file,
	content => "Ceci n'est pas une page",
}

# Launch Nginx server
service { 'nginx':
	ensure => running,
}
