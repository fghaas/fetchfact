define fetchfact::fetch ( $url, $factfile ) {

  include fetchfact
  $path = "/etc/facter/facts.d/${factfile}"

  case $factfile {
    /.*\.json$/: {
      case $osfamily {
        'redhat','debian','suse': {
          package { 'ruby-json':
            ensure => installed
          }
        }
        default: {
          package { 'json':
            ensure   => installed,
            provider => gem
          }
        }
      }
    }
    default: {
      # nothing to do -- YAML and .txt support
      # relies on no external packages
    }
  }

  wget::fetch { $url:
    source      => $url,
    destination => $path,
    require     => File['/etc/facter/facts.d']
  }

}
