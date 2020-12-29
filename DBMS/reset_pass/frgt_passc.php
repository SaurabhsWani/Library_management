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
		$_SESSION['otp']=$x;
		$headers='From:'.'SPAR-LMS '.'X-Mailer:PHP'.phpversion();
		$subject="SPAR Library-Management-System";
		$body="OTP to Reset Password\nThank you for reseting rour password OTP is given below:\nOTP: ".$x."\nDo Not reply to this email";
		if (mail($_SESSION['email'],$subject,$body,$headers)) 
		{
			echo "<script>alert('Please Check your email to see otp');</script>";
			echo '<script>window.location="conf_otp.php"</script>';
		}
		else
		{
			echo "<script>alert('Sorry, Could not Send OTP\n TRY AGAIN');</script>";
			session_destroy();
			session_unset();
			echo '<script>window.location="frgt_pass.php"</script>';
		}	
	}
	else{
		echo "<script>alert('No Use Found with this Email');</script>";
		session_destroy();
		session_unset();
		echo '<script>window.location="frgt_pass.php"</script>';
	}
}
?>	