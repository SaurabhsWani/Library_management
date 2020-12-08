<?php
$connection=new mysqli('127.0.0.1','root','','lms') or die("could not make connection".mysqli_connect_error());
if ($connection)
{
	//echo "Database Connected";
}
else
{
	header("location:login.php");
}

?>