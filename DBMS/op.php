<?php
//for return or renew start
$time=date("Y-m-d H:i:s");
include('security.php');include('fun.php');
securityforpage();
if(isset($_POST['prn'])){
	$prn=$_POST['prn'];}
	if(isset($_POST['book'])){
		$book=$_POST['book'];}
		$action=$_POST['op'];
		if(isset($_GET['prn']))
		{
			$prn=$_GET['prn'];
			if(update("student","status","'1'","WHERE prn='$prn'"))
				{poutput("Registered Successfully","student.php?page=Dashboard");}
			else{noutput("Unsuccessful To Registered","student.php?page=Dashboard");}
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
					poutput("Student Data Added Successfully","student.php?page=Dashboard&prn=$prn&submit=");
				}
				else
				{
					noutput("Unsuccessful To Add Student","student.php?page=Dashboard&prn=$prn&submit=");
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
					poutput("Student removed successfully","student.php?page=Dashboard&prn=$prn&submit=");
					}
					else{
						
					poutput("Student removed successfully But Not Added in Removed Data","student.php?page=Dashboard&prn=$prn&submit=");
					}
				}
				else
				{
					noutput("Unsuccessful To Remove Data","student.php?page=Dashboard&prn=$prn&submit=");
				}
				break;
//To remove student end
//To add magazine start		
				case 'AddMZ':
				$name = $_POST['name'];
				$result=select("*","magazine","WHERE name LIKE '$name' ");
				$row=mysqli_num_rows($result);
				$resultt=select("id","magazine","WHERE name LIKE '$name' LIMIT 1");
				$std=mysqli_fetch_assoc($resultt);
				if($row!=0){
					$copyid=$std['id']."-".($row+1);
				}
				else
				{
					$result=select("id","magazine","");
					while($std=mysqli_fetch_assoc($result))
					{
						$copyid=($std['id']+1)."-1";
					}
				}
				$author = $_POST['author'];
				$date = $_POST['date'];
				$addedby = $_SESSION['sn'];
				$add1="INSERT INTO magazine(name,author,dateadd,copyid,addedby) VALUES ('$name','$author','$date','$copyid','$addedby')";
				if ($connection->query($add1)) 
				{
					poutput("Magazine Data Added Successfully","Magazine.php?page=Dashboard");
				}
				else
				{
					noutput("Unsuccessful To Add Magazine","Magazine.php?page=Dashboard");
				}
				break;
//To add magazine end
//To Remove magazine Start
				case 'Remove_Magazine':
				$name = $_POST['mn'];
				$result=select("*","magazine","WHERE name LIKE '$name'");
				$row=mysqli_num_rows($result);
				if($row!=0)
				{
					$copyid=0;
					while($std=mysqli_fetch_assoc($result))
					{
						$copyid=$copyid+1;
						$n=$std['name'];
					}
					include("header.php");
					echo '
					<div class=" modal-backdrop">
					<div id="myModal2" class="modal hide  in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: block;">
					<div class="modal-header">
					<a href="magazine.php?page=Dashboard"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></a>
					<h3 id="myModalLabel">Remove Magazine '.$n.' having '.$row.' Copies </h3>
					</div>
					<div class="modal-body">
					<form  action="op.php" method="post" class="form-horizontal" >
					<div class="control-group">     
					<label class="control-label" for="cp">Magazine Copies No to Delete</label>
					<div class="controls">
					<div class="input-append">   
					<input type="hidden" value="'.$n.'" name="mn">
					<select class="span2 m-wrap" id="cp" name="n">
					<option value='.$row.'>All</option>
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
					</div>
					</div>';
					include("footer.php");
				}else
				{
					echo "<script>alert('No Magazine Found');
					window.location='Magazine.php?page=Dashboard';</script>";
				}
				break;
				case 'Remove_MZ':
				$n=$_POST['n'];
				$name = $_POST['mn'];
				$add="DELETE FROM magazine WHERE name LIKE '$name' ORDER BY id DESC LIMIT $n";
				if ($connection->query($add)) 
				{
					$removedby = $_SESSION['sn'];
					$item="Magazine - ".$name;
					$add="INSERT INTO removeddata(removedby,removeditem,removedcount) VALUES ('$removedby','$item','$n')";
					if ($connection->query($add)) 
					{
						poutput("Magazine removed successfully","magazine.php?page=Dashboard");
					}
					else{
						poutput("Magazine removed successfully But Not Added to Removed Data","magazine.php?page=Dashboard");
					}
				}
				else
				{
					noutput("Unsuccessful To Remove Magazine","magazine.php?page=Dashboard");
				}
				break;
//To Remove magazine end
				default:
				$_POST['op']="";
				header('Location:index.php?page=Dashboard&prn=&submit=');
				break;
			}
		}
		?>