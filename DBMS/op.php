<?php
//for return or renew start
$time=date("Y-m-d H:i:s");
include("header.php");
function loadder()
{
	echo "<div class='modal-backdrop'>
	<image src='images/l5.gif' style='position: fixed;bottom: 0;left: 0;height: 110%;width:100%; z-index: -1;'/>";
}
securityforpage();
$action=null;
if(isset($_POST['prn']))
{
	$prn=$_POST['prn'];
}
if(isset($_POST['book']))
{
	$book=$_POST['book'];
}
if (isset($_POST['op'])) 
{
	$action=$_POST['op'];
}
if(isset($_GET['prn']))
{
	loadder();
	$prn=$_GET['prn'];
	if(update("student","status","'1'","WHERE prn='$prn'"))
		{poutput("Registered Successfully","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");}
	else{noutput("Unsuccessful To Registered","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");}
}
else
{
	if (isset($_SERVER['HTTP_REFERER'])){$url=$_SERVER['HTTP_REFERER'];}
	else{$url="index.php?page=Dashboard";}
	switch ($action) 
	{
//for return or renew start
		case 'Renew':
		loadder();
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
		loadder();
		$cat=$_POST['cat'];
		if ($cat=='m') {$catt='Magazine';$col='magazinecopy';}
		else{$catt='Book';$col='bookcopy';}
		$rem="DELETE FROM student_book WHERE book_name LIKE '$book' AND prn='$prn' AND category='$cat'";
		$ip=1;
		if ($connection->query($rem)) 
		{
			$query="UPDATE $col SET status='$ip', prn='0' WHERE status='0' AND prn='$prn' LIMIT 1";
			if (mysqli_query($connection,$query)) 
			{
				poutput("$catt Return Successfully","$url");
			}
		}
		else
		{
			noutput("Unsuccessful To <b>Returned</b> Book","$url");
		}
		break;
//for return or renew end
//for adding new book start
		case 'add':
		loadder();
		$cat=$_POST['cat'];
		if ($cat=='m') {$catt='Magazine';$col='magazinecopy';}
		else{$catt='Book';$col='bookcopy';}
		$add="INSERT INTO student_book(prn,book_name,took,category) VALUES ('$prn','$book',CURRENT_TIMESTAMP,'$cat')"; 
		$ip=0;   
		$reult=select("*",$catt,"WHERE name='$book' LIMIT 1");
		while($rod=mysqli_fetch_assoc($reult))$bokid=$rod['id'];
		if ($connection->query($add)) 
		{
			$query="UPDATE $col SET status='$ip',prn='$prn' WHERE status='1' AND bookid='$bokid' LIMIT 1";
			if (mysqli_query($GLOBALS['connection'],$query)) 
			{
				poutput("$catt Added Successfully","gt.php?page=IMPORT-EXPORT&prn=$prn&submit=");
			}
		}
		else
		{
			noutput("Unsuccessful To Add Data","gt.php?page=IMPORT-EXPORT#myModal");
		}
		break;
//for adding new book end
		case 'AddST':
		loadder();
		$name = $_POST['name'];
		$prn = $_POST['prn'];
		$email = $_POST['email'];
		$mobile = $_POST['mobile'];
		$branch = $_POST['branch'];
		$date = $_POST['date'];
		$gender = $_POST['gender'];
		$address = $_POST['address'];
		$result=select("*","student","WHERE prn='$prn' LIMIT 1");
		$row=mysqli_num_rows($result);
		if($row==0)
		{
			$add1="INSERT INTO student(prn,name,email,mobile,branch,admi_year,Gender,Address) VALUES ('$prn','$name','$email','$mobile','$branch','$date','$gender','$address')";    
			if ($connection->query($add1)) 
			{
				poutput("Student Data Added Successfully","student.php?&cnt=&page=Dashboard&prn=$prn&submit=");
			}
			else
			{
				noutput("Unsuccessful To Add Student","student.php?&cnt=&page=Dashboard&prn=$prn&submit=");
			}
		}
		else
		{
			noutput("Student Already Added","student.php?&cnt=&page=Dashboard&prn=$prn&submit=");
		}
		break;
//for updating profile start
		case 'updateprof':
		loadder();
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
		loadder();
		$prn = $_POST['prn124'];
		$resultt=select("*","student","WHERE prn=$prn LIMIT 1");
		$std=mysqli_fetch_assoc($resultt);
		$item="Student - P-".$std['prn']." E-".$std['Email']." N-".$std['Name']." M".$std['mobile']." Y-".$std['admi_year']." B-".$std['branch']." A-".$std['Address'];
		$add="DELETE FROM student WHERE prn=$prn";    
		if ($connection->query($add)) 
		{
			$removedby = $_SESSION['sn'];
			$n=1;
			$add="INSERT INTO removeddata(removedby,removeditem,removedcount) VALUES ('$removedby','$item','$n')";
			if ($connection->query($add)) 
			{						
				poutput("Student removed successfully","student.php?&cnt=&page=Dashboard&prn=$prn&submit=");
			}
			else
			{

				poutput("Student removed successfully But Not Added in Removed Data","student.php?&cnt=&page=Dashboard&prn=$prn&submit=");
			}
		}
		else
		{
			noutput("Unsuccessful To Remove Data","student.php?&cnt=&page=Dashboard&prn=$prn&submit=");
		}
		break;
//To remove student end
//To add magazine start		
		case 'AddMZ':
		loadder();
		if ($_POST['cat']=='mg'){$col='magazine';$colc='magazinecopy';}
		elseif($_POST['cat']=='bk'){$col="book";$colc="bookcopy";}
		$name = $_POST['name'];
		$cc = $_POST['ccount'];
		$author = $_POST['author'];
		$isbn = $_POST['isbn'];
		$addedby = $_SESSION['sn'];
		$result=select("*",$col,"WHERE isbn='$isbn' LIMIT 1");
		$row=mysqli_num_rows($result);
		if($row!=0)
		{
			$r=mysqli_fetch_assoc($result);
			$bid=$r['id'];
			$cp=$y=0;
			$resultt=select("*",$colc,"WHERE bookid = '$bid'");
			while($std=mysqli_fetch_assoc($resultt)){$cp=$cp+1;}
			for ($i=1; $i <=$cc; $i++) 
			{
				$copyid=$bid."-".($cp+$i);	
				$addc="INSERT INTO $colc(bookid,copyid,status) VALUES ('$bid','$copyid',1)";
				if ($connection->query($addc))
					{$y=$y+1;}
			}	
			if ($y==$cc) 
			{
				poutput(" $col Data Added Successfully","$col.php?page=Dashboard");
			}
			else
			{
				noutput("Unsuccessful To Add $col","$col.php?page=Dashboard");
			}
		}
		else
		{
			$addm="INSERT INTO $col(name,author,addedby,isbn) VALUES ('$name','$author','$addedby','$isbn')";
			if ($connection->query($addm)) 
			{
				$bid= mysqli_insert_id($connection);
				$y=0;
				for ($i=1; $i <= $cc; $i++) 
				{ 
					$copyid=$bid."-".$i;
					$addc="INSERT INTO $colc(bookid,copyid,status) VALUES ('$bid','$copyid',1)";
					if ($connection->query($addc))
						{$y=$y+1;}
				}
				if ($y==$cc)
				{
					poutput("$col Data Added Successfully","$col.php?page=Dashboard");
				}
				else
				{
					noutput("Unsuccessful To Add $col","$col.php?page=Dashboard");
				}
			}
			else
			{
				noutput("Unsuccessful To Add $col","$col.php?page=Dashboard");
			}
		}
		break;
//To add magazine end
//To Remove magazine Start
		case 'Remove_Magazine':
		if ($_POST['cat']=='mg'){$col='magazine';$colc='magazinecopy'; $cat='mg';}
		elseif($_POST['cat']=='bk'){$col="book";$colc="bookcopy";$cat='bk';}
		$name = $_POST['mn'];
		$isbn = $_POST['isbn'];
		$result=select("*",$col,"WHERE name LIKE '$name' AND isbn='$isbn'");
		$row=mysqli_num_rows($result);
		if($row!=0)
		{
			$mid=mysqli_fetch_assoc($result);
			$bkid=$mid['id'];
			$n=$mid['name'];
			$mgcp=select("*",$colc,"WHERE bookid='$bkid'");
			$copyid=0;
			$cp=mysqli_num_rows($mgcp);
			while($std=mysqli_fetch_assoc($mgcp))
			{
				if ($std['status']==1) {$copyid=$copyid+1;}
			}
			echo '
			<div id="myModal2" class="modal hide  in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: block;">
			<div class="modal-header">
			<a href="magazine.php?page=Dashboard"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></a>
			<h3 id="myModalLabel">Remove Magazine <u>'.$n.'</u> having <u>'.$copyid.'</u> copy in library outoff <u>'.$cp.'</u> Copies </h3>
			</div>
			<div class="modal-body">
			<form  action="op.php" method="post" class="form-horizontal" >
			<div class="control-group">     
			<label class="control-label" for="cp">Magazine Copies No to Delete</label>
			<div class="controls">
			<div class="input-append">   
			<input type="hidden" value="'.$bkid.'" name="bkid">
			<input type="hidden" name="cat" value="'.$cat.'">
			<input type="hidden" value="'.$n.'" name="mn">
			<input type="hidden" value="'.$copyid.'" name="cpno">
			<select class="span2 m-wrap" id="cp" name="n">
			<option value='.$copyid.'>All</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			</select>        
			<br><br>
			<input class="btn" type="submit" name="op" value="Remove_MZ">
			</div>
			</div>  <!-- /controls -->      
			</div>
			</form>
			</div>
			</div>';
		}else
		{
			echo "<script>alert('No $col Found');
			window.location='$col.php?page=Dashboard';</script>";
		}
		break;
		case 'Remove_MZ':
		loadder();				
		if ($_POST['cat']=='mg'){$col='magazine';$colc='magazinecopy';}
		elseif($_POST['cat']=='bk'){$col="book";$colc="bookcopy";}
		$n=$_POST['n'];
		$name=$_POST['mn'];
		$cpno=$_POST['cpno'];
		$bkid = $_POST['bkid'];
		$add="DELETE FROM $colc WHERE bookid LIKE '$bkid' AND status='1' ORDER BY sr DESC LIMIT $n";
		if ($connection->query($add) && $cpno>0) 
		{
			$removedby = $_SESSION['sn'];
			$item="Magazine - ".$name;
			$add="INSERT INTO removeddata(removedby,removeditem,removedcount) VALUES ('$removedby','$item','$n')";
			if ($connection->query($add)) 
			{
				poutput("$col removed successfully","$col.php?page=Dashboard");
			}
			else{
				poutput("$col removed successfully But Not Added to Removed Data","$col.php?page=Dashboard");
			}
		}
		else
		{
			noutput("Unsuccessful To Remove Magazine","$col.php?page=Dashboard");
		}
		break;
//To Remove magazine end
		case 'AddSTF':
		loadder();
		$name = $_POST['name'];
		$email = $_POST['email'];
		$mobile = $_POST['mobile'];
		$pass = $_POST['pass'];
		$branch = $_POST['branch'];
		$date = $_POST['date'];
		$add1="INSERT INTO staff(Name,Email,mobile,password,branch,Date) VALUES ('$name','$email','$mobile','$pass','$branch','$date')";    
		if ($connection->query($add1)) 
		{
			poutput("Staff Data Added Successfully","staff.php?page=Dashboard&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To Add Staff","staff.php?page=Dashboard&prn=$prn&submit=");
		}
		break;
				//To remove staff start
		case 'Remove Staff':
		$stid = $_POST['stid'];
		$stnm = $_POST['stnm'];
		$add="DELETE FROM staff WHERE Email='$stid' AND Name='$stnm'";    
		if ($connection->query($add)) 
		{

			poutput("Staff removed successfully","staff.php?page=Dashboard&prn=$prn&submit=");
		}
		else
		{
			noutput("Unsuccessful To Remove Data","staff.php?page=Dashboard&prn=$prn&submit=");
		}
		break;
		case 'mail':
		loadder();
		$mail=$_POST['email'];
		$fine=$_POST['fine'];
		$bk=$_POST['bk'];
		$dt=$_POST['dt'];
		$headers='From:'.'SPAR-LMS '.'X-Mailer:PHP'.phpversion();
		$subject="SPAR Library-Management-System";
		$body="Informing About the Fine for The book\nInformation About Fine is given below:\nFine : ".$fine."\nBook : ".$bk."\nBook Taken on : ".$dt."\n You have to pay this fine for holding the book more than allowed days. To pay the fine come to library and pay fine. If you lost the book then you have to pay the price of the book. If you didn't come to pay then the legal action will be taken on you which may affect your academic activities.\n\n\nDo Not reply to this email";
		if(mail($mail,$subject,$body,$headers))
		{
			poutput("Email Send Succesfully","fine.php?page=Dashboard");
		}
		else
		{
			noutput("Unsuccesful to send Email","fine.php?page=Dashboard");
		}
		break;
		default:
		$_POST['op']="";
		loadder();
		poutput("Welcome To SPAR-Library Management System","$url");
		break;
	}
}
echo "</div>";
include("footer.php");
?>