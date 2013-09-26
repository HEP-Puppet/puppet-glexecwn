#
# install the emi glexec enabled worker node
#
class glexecwn::install (
  $supported_vos    = $glexecwn::params::supported_vos,
  $install_dummydpm = $glexecwn::params::install_dummydpm,) {
  if $install_dummydpm == true {
    package { dummydpm: ensure => present, }
  }

  # install worker node software
  class { 'emi_wn':
  }

  class { 'emi_glexec_wn':
  }

  exec { 'glexecperms': command => '/bin/chgrp glexec /usr/sbin/glexec ; /bin/chmod 06111 /usr/sbin/glexec' 
    }

}