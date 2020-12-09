<?php
require('../dbconfig.php');
session_start();
function connection()
{
	if($GLOBALS['connection'])
	{

	}
	else
	{
		destroy();
	}
}
function destroy()
{
	session_destroy();
	session_unset();
	header('Location: frgt_pass.php');
}
function securityforresetpass(){
	connection();
	if((isset($_POST['email']) OR isset($_SESSION['otp']) OR isset($_SESSION['eml']))?False:True)
	{
		unset($_POST['email']);
		destroy();
	}
}
function select($var,$col,$condtn)
{
	$query="SELECT $var FROM $col $condtn";
	$sql=mysqli_query($GLOBALS['connection'],$query);	
	return $sql;
}

function update($col,$lhs,$rhs,$condtn)
{
	$query="UPDATE $col SET $lhs=$rhs $condtn";
	if (mysqli_query($GLOBALS['connection'],$query)) 
	{
		return true;
	}	
	else
	{
		return false;
	}
}
?>