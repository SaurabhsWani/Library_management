<?php 
include('security.php');
securityforresetpass();
$otp = filter_input(INPUT_POST,'otp');
if ($_SESSION['otp']==$otp)
{ 
	$_SESSION['eml']=$_SESSION['email'];
	unset($_SESSION['otp']);
	unset($_SESSION['email']);
	echo '<script>window.location="update_reset_pass.php"</script>';
}
else
{
	echo "<script>alert('Incorrect OTP');</script>";
	echo '<script>window.location="conf_otp.php"</script>';
}
?>