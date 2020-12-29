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
				$rem="DELETE FROM student_book WHERE book_name LIKE '$book' AND prn='$prn' ";
				if ($connection->query($rem)) 
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
				$cc = $_POST['ccount'];
				$author = $_POST['author'];
				$isbn = $_POST['isbn'];
				$addedby = $_SESSION['sn'];
				$result=select("*","magazine","WHERE isbn='$isbn' LIMIT 1");
				$row=mysqli_num_rows($result);
				if($row!=0)
				{
					$r=mysqli_fetch_assoc($result);
					$bid=$r['id'];
					$cp=$y=0;
					$resultt=select("*","magazinecopy","WHERE bookid = '$bid'");
					while($std=mysqli_fetch_assoc($resultt)){$cp=$cp+1;}
					for ($i=1; $i <=$cc; $i++) 
					{
						$copyid=$bid."-".($cp+$i);	
						$addc="INSERT INTO magazinecopy(bookid,copyid,status) VALUES ('$bid','$copyid',1)";
						if ($connection->query($addc))
						{
							$y=$y+1;
						}
					}	
					if ($y==$cc) 
					{
						poutput("Magazine Data Added Successfully1","Magazine.php?page=Dashboard");
					}
					else
					{
						noutput("Unsuccessful To Add Magazine1","Magazine.php?page=Dashboard");
					}
				}
				else
				{
					$addm="INSERT INTO magazine(name,author,addedby,isbn) VALUES ('$name','$author','$addedby','$isbn')";
					if ($connection->query($addm)) 
					{
						$bid= mysqli_insert_id($connection);
						$y=0;
						for ($i=1; $i <= $cc; $i++) 
						{ 
							$copyid=$bid."-".$i;
							$addc="INSERT INTO magazinecopy(bookid,copyid,status) VALUES ('$bid','$copyid',1)";
							if ($connection->query($addc))
							{
								$y=$y+1;
							}
						}
						if ($y==$cc)
						{
							poutput("Magazine Data Added Successfully","Magazine.php?page=Dashboard");
						}
						else
						{
							noutput("Unsuccessful To Add Magazine3","Magazine.php?page=Dashboard");
						}
					}
					else
					{
						noutput("Unsuccessful To Add Magazine2","Magazine.php?page=Dashboard");
					}
				}
				break;
//To add magazine end
//To Remove magazine Start
				case 'Remove_Magazine':
				$name = $_POST['mn'];
				$isbn = $_POST['isbn'];
				$result=select("*","magazine","WHERE name LIKE '$name' AND isbn='$isbn'");
				$row=mysqli_num_rows($result);
				if($row!=0)
				{
					$mid=mysqli_fetch_assoc($result);
					$bkid=$mid['id'];
					$n=$mid['name'];
					$mgcp=select("*","magazinecopy","WHERE bookid='$bkid'");
					$copyid=0;
					$cp=mysqli_num_rows($mgcp);
					while($std=mysqli_fetch_assoc($mgcp))
					{
						if ($std['status']==1) {$copyid=$copyid+1;}
					}
					include("header.php");
					echo '
					<div class=" modal-backdrop">
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
				$name=$_POST['mn'];
				$cpno=$_POST['cpno'];
				$bkid = $_POST['bkid'];
				$add="DELETE FROM magazinecopy WHERE bookid LIKE '$bkid' AND status='1' ORDER BY sr DESC LIMIT $n";
				if ($connection->query($add) && $cpno>0) 
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
				//for adding new book end
				case 'AddBK':
				$id = $_POST['id'];
				$name = $_POST['name'];
				$auth = $_POST['auth'];
				$ttl = $_POST['ttl'];
				$add = "INSERT INTO books(bk_id,book_name,auther,toatal_cp,cp_left) VALUES ('$id','$name','$auth','$ttl','$ttl')";    
				if ($connection->query($add)) 
				{
					poutput("Data Added Successfully","books.php?page=Books");
				}
				else
				{
					noutput("Unsuccessful To Add Book","books.php?page=Books");
				}
				break;
				//To remove book start
				case 'rmBK':
				$bid = $_POST['id1'];
				//get the name and status of book with given id
				$add="SELECT * FROM cp_book WHERE book_id='$bid'";
				$result = $connection->query($add);
				$std=mysqli_fetch_assoc($result);
				$std1 = $std['book_name'];
				$stat = $std['status'];
				//delete the book
				$add="DELETE FROM cp_books WHERE book_id='$bid'";    
				if ($connection->query($add)) 
				{	
					//Update total books and books left in books table
					$add = "SELECT * FROM books WHERE book_name='$std1'";
					$result = $connection->query($add);
					$std=mysqli_fetch_assoc($result);
					//check if book was available i library
					if (!$stat) {
						$l = $std['cp_left'];
					}
					else{$l = $std['cp_left'] - 1;}
					$t = $std['toatal_cp'] - 1;
					$add="UPDATE books SET cp_left='$l',toatal_cp='$t' WHERE book_name='$std1'";			
					if ($connection->query($add)){			
						poutput("Book removed successfully","books.php?page=Books&prn=$prn&submit=");}
						else{
							poutput("Book removed successfully but unable to update data","books.php?page=Books&prn=$prn&submit=");
						}
						
					}
					else
					{
						noutput("Unsuccessful To Remove Data","books.php?page=Books&prn=$prn&submit=");
					}
					break;
					default:
					$_POST['op']="";
					header('Location:index.php?page=Dashboard&prn=&submit=');
					break;
				}
			}
			?>