# Fixes a filename extension typo
exec { 'rename file':
  command => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
}
