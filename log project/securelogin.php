<?php

	$username = 'admin';
	$password = 'letmein';
	$tokin = hash('ripemd128','$salt1$password$salt2');
	
	if (isset($_SERVER['PHP_AUTH_USER']) && isset($SERVER['PHP_AUTH_PW']))
	{
		if ($SERVER ['PHP_AUTH_USER'] == $username && $_SERVER ['PHP_AUTH_PW'] == $password)
			echo "You are now logged in";
		else die ("Invalid username / password combination");
	}
	else
	{
		header('WWW-Authenticate: Basic realm="Restricted Section"');
		header('HTTP/1.0 401 Unauthorized');
		die ("Please enter your username and password");
	}

 ?>
