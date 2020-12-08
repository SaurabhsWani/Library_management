<?php
include('security.php');include('fun.php');
securityforpage();
if (isset($_GET['prn'])) {
	$prn=$_GET['prn'];
	if(update("student","status","'1'","WHERE prn='$prn'"))
		{poutput("Registered Successfully","gt.php?prn=$prn&submit=");}else{noutput("Unsuccessful To Registered","gt.php?prn=$prn&submit=");}
}
else{noutput("Unsuccessful To Registered","gt.php?prn=$prn&submit=");}
?>