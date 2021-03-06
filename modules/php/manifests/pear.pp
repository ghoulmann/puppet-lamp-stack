class php::pear {
  include php

  # upgrade PEAR
  exec { "pear upgrade":
    require => Package["php-pear"]
  }

  # install PHPUnit
  exec { "pear config-set auto_discover 1":
    require => Exec["pear upgrade"]
  }

  # create pear temp directory for channel-add
  file { "/tmp/pear/temp":
    require => Exec["pear config-set auto_discover 1"],
    ensure => "directory",
    owner => "root",
    group => "root",
    mode => 777
  }

  # discover channels
  exec { "pear channel-discover pear.phpunit.de; true":
    require => [File["/tmp/pear/temp"], Exec["pear config-set auto_discover 1"]]
  }

  exec { "pear channel-discover pear.symfony-project.com; true":
    require => [File["/tmp/pear/temp"], Exec["pear config-set auto_discover 1"]]
  }

  exec { "pear channel-discover components.ez.no; true":
    require => [File["/tmp/pear/temp"], Exec["pear config-set auto_discover 1"]]
  }

  # clear cache before install phpunit
  exec { "pear clear-cache":
    require => [Exec["pear channel-discover pear.phpunit.de; true"], Exec["pear channel-discover pear.symfony-project.com; true"], Exec["pear channel-discover components.ez.no; true"]]
  }

  # install Pear Mail_Mime
  exec { "pear install Mail_Mime":
    require => Exec["pear clear-cache"]
  }
  
  
  # install Net_SMTP
  exec { "pear install Net_SMTP":
    require => Exec["pear clear-cache"]
  }

  # install Pear Mail
  exec { "pear install Mail":
    require => Exec["pear clear-cache"]
  }
}
