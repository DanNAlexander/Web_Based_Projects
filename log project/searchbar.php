<?php

  function fix()
  {
    $query = $this->get('id');
    foreach($query->result() as $row)
    {
      $data['column_name'] = $row-> column_name;
    }
  }

  function make_db($data)
  {
    $databasename = '';

    if(isset()$data['column_name'])
    {
      $databasename.= metaphone($data[column_name]);
    }
  }

?>
