class system {

  $password = '$1$HrgMU4Vl$bj7Zc.WgWLb8EZ4H3kKVg.'
 
  system::managed_user { ['alpha','bravo','charlie']:
    password => $password,
  }
}