# == Class: aw_editor
#
# This module manages the default editor.
#
# === Parameters
#
# [*package*]
#   The editor to install and set as default.
#
# === Examples
#
#   include aw_editor
#
#   class { 'aw_editor':
#     'package' => 'nano'
#   }
#
# === Authors
#
# Andreas Weber <code@andreas-weber.me>
#
# === Copyright
#
# Copyright 2015 Andreas Weber
#
class aw_editor(
  $package = 'nano'
)
{
  package { $package:
    ensure => 'latest',
  }

  exec { "update-alternatives --set editor /bin/${package}":
    path    => '/usr/bin:/usr/sbin',
    unless  => "test /etc/alternatives/editor -ef /bin/${package}",
    require => Package[$package],
  }
}
