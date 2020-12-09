<?php
include('security.php');
securityforresetpass();

if($_SESSION['eml']== NULL)
	{destroy();}
elseif($_POST['pass1']==$_POST['pass2'])
{
	$pass=filter_input(INPUT_POST,'pass1');
	if(update("staff","password","'$pass'","WHERE Email='$_SESSION[eml]'"))
	{
		echo "<script>alert('Updated successfully You Can Login now');</script>";
		echo '<script>window.location="../login.php"</script>';
	}
	else
	{
		echo "<script>alert('Not Updated Try After Sometime');</script>";
		echo '<script>window.location="../login.php"</script>';
	}
}
?>