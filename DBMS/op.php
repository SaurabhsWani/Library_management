<?php
//for return or renew start
$time=date("Y-m-d H:i:s");
include('security.php');include('fun.php');include('dbconfig.php');
securityforpage();
$prn=$_POST['prn'];
$book=$_POST['book'];
$action=$_POST['op'];
if(isset($_GET['prn']))
{
	$prn=$_GET['prn'];
	if(update("student","status","'1'","WHERE prn='$prn'"))
		{poutput("Registered Successfully","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");}
	else{noutput("Unsuccessful To Registered","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");}
}
else{
	switch ($action) {
//for return or renew start
		case 'Renew':
		if(update("student_book","renew",'CURRENT_TIMESTAMP',"WHERE prn='$prn' AND book_name='$book' "))
		{
			poutput("Book <b>Renewed</b> Successfully","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To <b>Renewed</b> Book","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");
		}
		break;
		case 'return':
		if(update("student_book","returned",'CURRENT_TIMESTAMP',"WHERE prn='$prn' AND book_name='$book' "))
		{
			poutput("Book <b>Returned</b> Successfully","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To <b>Returned</b> Book","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");
		}
		break;
//for return or renew end
//for adding new book start
		case 'add':
		$add="INSERT INTO student_book(prn,book_name,took) VALUES ('$prn','$book',CURRENT_TIMESTAMP)";    
		if ($connection->query($add)) 
		{
			poutput("Book Added Successfully","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To Add Data","gt.php?page=IMPORT-EXPORT#myModal");
		}
		break;
//for adding new book end
		case 'AddST':
		$name = $_POST['name'];
		$prn = $_POST['prn'];
		$email = $_POST['email'];
		$mobile = $_POST['mobile'];
		$branch = $_POST['branch'];
		$date = $_POST['date'];
		$gender = $_POST['gender'];
		$address = $_POST['address'];
		$add1="INSERT INTO student(prn,name,email,mobile,branch,admi_year,Gender,Address) VALUES ('$prn','$name','$email','$mobile','$branch','$date','$gender','$address')";    
		if ($connection->query($add1)) 
		{
			poutput("Student Data Added Successfully","student.php?page=students&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To Add Student","student.php?page=students&prn=$prn&submit=");
		}
		break;
//for updating profile start
		case 'updateprof':
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
		break;
//for updating profile end
//for uploading image start
		case 'updateimg':
		if(is_uploaded_file($_FILES['userimage']['tmp_name']))
		{
			$image=$_FILES['userimage']['tmp_name'];
			$image2=$_FILES['userimage']['name'];
		}
		else
			{noutput("Unsuccessful To Update Profile Image Try again","profile.php");}
		$sid=$_POST['sid'];
		$target="images/".$_FILES['userimage']['name'];
		if(update("staff","image","'$image2'","WHERE sid=$sid"))
		{
			if(move_uploaded_file($image,$target))
			{
				poutput("Profile Image Updated Successfully","profile.php");}
				else
					{noutput("Unsuccessful To Update Profile Image","profile.php");
			}
		}
		else{noutput("Unsuccessful To Update Profile Image","profile.php");}
		break;
//for uploading image end
//To remove student start
		case 'Remove':
		$prn = $_POST['prn124'];
		$add="DELETE FROM student WHERE prn=$prn";    
		if ($connection->query($add)) 
		{
			poutput("Student removed successfully","student.php?page=students&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To Remove Data","student.php?page=students&prn=$prn&submit=");
		}
		break;
//To remove student end
		default:
		$_POST['op']="";
		header('Location:index.php?page=Dashboard&prn=&submit=');
		break;
	}
}
?>