<?php
include('security.php');
securityforresetpass();
$eml=$_POST['email'];
if($connection)
{

	$row=mysqli_num_rows(select("*","staff","WHERE Email='$eml'"));
	if ($row>0) {
		$idd=mysqli_fetch_array(select("*","staff","WHERE Email='$eml' LIMIT 1"));
		$_SESSION['sid']=$idd['sid'];
		$_SESSION['email']=$idd['Email'];
		$x=rand(10000,100000);
		echo "<script>alert('".$x."');</script>";
		$_SESSION['otp']=$x;
		$headers='From:'.'Gopa Atta'.'X-Mailer:PHP'.phpversion();
		$subject="Gopa Aata OTP";
		$body="\r\nOTP to reset password is ".$x."\r\n Do NOt reply to this email";
		// if (mail($_SESSION['email'],$subject,$body,$headers)) 
		// {
			//echo "<script>alert(' $x ');</script>";
		echo "<script>alert('Please Check your email to see otp');</script>";
		echo '<script>window.location="conf_otp.php"</script>';
		// }
		// else
		// {
		// 	echo "<script>alert('Sorry, Could not Send OTP\n TRY AGAIN');</script>";
		// 	session_destroy();
		// 	session_unset();
		// 	echo '<script>window.location="asdfg"</script>';
		// }	
	}
	else{
		echo "<script>alert('No Use Found with this Email');</script>";
		session_destroy();
		session_unset();
		echo '<script>window.location="frgt_pass.php"</script>';
	}
}
?>	