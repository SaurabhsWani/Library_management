<?php
//for return or renew start
$time=date("Y-m-d H:i:s");
include('security.php');include('fun.php');
securityforpage();
$prn=$_POST['prn'];
$book=$_POST['book'];
if(isset($_POST['renew']))
{
	if(update("student_book","renew",'CURRENT_TIMESTAMP',"WHERE prn='$prn' AND book_name='$book' "))
	{
		poutput("Book <b>Renewed</b> Successfully","gt.php?prn=$prn&submit=");
	}
	else
	{
		noutput("Unsuccessful To <b>Renewed</b> Book","gt.php?prn=$prn&submit=");
	}
}
elseif(isset($_POST['return']))
{
	if(update("student_book","returned",'CURRENT_TIMESTAMP',"WHERE prn='$prn' AND book_name='$book' "))
	{
		poutput("Book <b>Returned</b> Successfully","gt.php?prn=$prn&submit=");
	}
	else
	{
		noutput("Unsuccessful To <b>Returned</b> Book","gt.php?prn=$prn&submit=");
	}
}
//for return or renew end
//for adding new book start
elseif(isset($_POST['add']))
{
	echo "add"; 
	$add="INSERT INTO student_book(prn,book_name,took) VALUES ('$prn','$book',CURRENT_TIMESTAMP)";    
	if ($connection->query($add)) 
	{
		poutput("Book Added Successfully","gt.php?prn=$prn&submit=");
	}
	else
	{
		noutput("Unsuccessful To Add Book","gt.php?prn=$prn&submit=");
	}
}
//for adding new book end
//for updating profile start
elseif (isset($_POST['update'])) 
{
	$name=$_POST['name'];
	$email=$_POST['email'];
	$sid=$_POST['sid'];
	$update="UPDATE staff SET Name='$name', Email='$email' WHERE sid='$sid'";
	if (mysqli_query($connection,$update)) 
	{
		poutput("Profile Updated Successfully","profile.php");
	}
	else
	{
		noutput("Unsuccessful To Update Profile","profile.php");
	}
}
//for updating profile end
elseif(isset($_GET['prn']))
{
	$prn=$_GET['prn'];
	if(update("student","status","'1'","WHERE prn='$prn'"))
		{poutput("Registered Successfully","gt.php?prn=$prn&submit=");}else{noutput("Unsuccessful To Registered","gt.php?prn=$prn&submit=");}
}
else{
	$_POST['return']=$_POST['renew']="";
	header('Location:gt.php?prn=&submit=');
}
?>