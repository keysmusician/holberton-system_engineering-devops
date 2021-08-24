#!/usr/bin/puppet
# Configure a Nginx server with a custom HTTP header and two web pages.

# Install HAProxy
package { 'haproxy':
  ensure => installed,
}

# Set hostname
exec { 'hostname -b $(hostnamectl --static)':
	path => '/bin',
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
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
# Index
file { '/var/www/html/index.html':
	content => "Holberton School for the win!",
}

# 404
file { '/var/www/html/404.html':
 content => "Ceci n'est pas une page",
}

# Launch Nginx server
service { 'nginx': }
