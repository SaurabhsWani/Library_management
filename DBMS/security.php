<?php
session_start();
require('dbconfig.php');
function connection($eml)
{
	if($GLOBALS['connection'])
	{

	}
	else
	{
		destroy($eml);
	}
}
function destroy($eml)
{
	if (isset($_COOKIE['username']) and isset($_COOKIE['password'])) 
	{
		$username=$_COOKIE['username'];
		$password=$_COOKIE['password'];
		setcookie('username',$eml, time()-1);
		setcookie('password',$_POST['password'], time()-1);
	}
	session_destroy();
	session_unset();
	header('Location: login.php');
}

function securityforpage(){	
	$usr=isset($_SESSION['username'])?$_SESSION['username']:"";
	connection($usr);
	if(!$usr?destroy($usr):!$_SESSION['sn']?destroy($usr):!$_SESSION['sid']?destroy($usr):False)
	{
		destroy($usr);
	}
}

function securityforloginpage(){
	connection($_POST['username']);
	if(!$_POST['username']?destroy($_POST['username']):!$_POST['password']?destroy($_POST['username']):False)
	{
		$First_Name=$Last_Name=$State=$Cat=$Email=$Password=$Password2=$_POST['password']=$_POST['username']="";
		destroy($_POST['username']);
	}
}
?>