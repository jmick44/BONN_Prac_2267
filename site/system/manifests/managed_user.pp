define system::managed_user (
  $password,
) {
   $homedir = $title ? {
     'root'  => '/root',
     default => "/home/${title}",
   }
   
   user { $title:
     ensure     => present,
     password   => $password,
     managehome => true,
   }
   
   file { "${homedir}/.bashrc":
     ensure  => file,
     owner   => $title,
     group   => $title,
     mode    => '0666',
     source  => 'puppet:///modules/system/bashrc',
     require => User[$title], 
   }
}