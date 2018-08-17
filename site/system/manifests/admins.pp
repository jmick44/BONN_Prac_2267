class system::admins {
  #require mysql::server
  
  $retired = [ 'ralph' ]
  $admins  = {
    'brad'   => { max_queries_per_hour => 600 },
    'monica' => { max_queries_per_hour => 600 },
    'luke'   => { max_queries_per_hour => 600 },
    'zack'   => { max_queries_per_hour => 1200 },
  }

  $admins.each | $admin, $attributes | {
    mysql_user { "${admin}@localhost":
      ensure               => present,
      max_queries_per_hour => $attributes['max_queries_per_hour'],
    }
    
    user { $admin:
      ensure     => present,
      managehome => true,
    }
  }
  
  $retired.each | $retiree | {
    mysql_user { "${retiree}@localhost":
      ensure => absent,
    }
    
    user { $retiree:
      ensure => absent,
    }
  }  
}