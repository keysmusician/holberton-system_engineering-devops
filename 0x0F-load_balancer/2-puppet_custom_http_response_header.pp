# Puppet manifest
# Configure a Nginx server with a custom HTTP header and two web pages.

exec { 'update':
  command  => 'apt-get update',
  user     => 'root',
  provider => 'shell'
}
->

#installs nginx
package { 'nginx':
  ensure   => present,
  name     => 'nginx',
  provider => 'apt'
}
->

# Index
file { '/var/www/html/index.html':
	ensure  => file,
	content => "Holberton School for the win!",
}
->

# 404
file { '/var/www/html/404.html':
	ensure  => file,
	content => "Ceci n'est pas une page",
}
->

#sets config
exec { 'Set default /redirect_me':
  command  => 'sed -i "48i \\\n\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}" /etc/nginx/sites-available/default',
  user     => 'root',
  provider => 'shell'
}
->

exec { 'Set default /404':
  command  => 'sed -i "42i \\\n\terror_page 404 /404.html;" /etc/nginx/sites-available/default',
  user     => 'root',
  provider => 'shell'
}
->

exec { 'Set X-Served-By':
  command  => 'sed -i "48i \\\t\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
  user     => 'root',
  provider => 'shell'
}
->

# Launch Nginx server
service { 'nginx':
	ensure => running,
}
