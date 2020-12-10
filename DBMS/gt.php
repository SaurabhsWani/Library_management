<?php
include('header.php');
title("IMPORT-EXPORT");
if(isset($_GET['prn'])){
	$prn=$_GET['prn'];
}else{$prn="";}
?>
<div class="span12">    
	<div class="widget ">
		<div class="widget-header">
			<i class="icon-user"></i>
			<h3>Search student</h3>
		</div> <!-- /widget-header -->
		<div class="widget-content">
			<div class="tabbable">
				<div class="tab-content">
					<div class="tab-pane active" id="formcontrols">
						<form  action="gt.php" method="GET" class="form-horizontal" >
							<div class="control-group">			
								<label class="control-label" for="radiobtns">Student PRN  </label>
								<div class="controls">
									<div class="input-append">
										<input class="span2 m-wrap" value="<?php echo $prn;?>" id="appendedInputButton" type="text" name="prn" autocomplete="off">
										<button class="btn" type="submit" name="submit">Search!</button>
									</div>
								</div>	<!-- /controls -->			
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> <!-- /widget-content -->
	</div> <!-- /widget -->
	<?php
	message();
	if(!empty($_GET['prn']) && $_SERVER['REQUEST_METHOD'] == 'GET'){
		$prn=$_GET['prn'];
		?>
		<div class="widget widget-table action-table">
			<div class="widget-header"> <i class="icon-th-list"></i>
				<h3>Student Information</h3>
			</div>
			<!-- /widget-header -->
			<div class="widget-content">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th><center> PRN</center></th>
							<th><center> Name</center></th>
							<th><center> Year</center></th>
							<th><center> Branch</center></th>
							<th><center> Status</center></th>
							<th><center> Mobile</center></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$result=select("*","student","WHERE prn='$prn' LIMIT 1");
						while($std=mysqli_fetch_assoc($result))
						{
							echo "<tr>
							<td><center> ".$std['prn']."</center></td>
							<td><center> ".$std['Name']."</center></td>	
							<td><center> ".(diff_date($std['admi_year'],date("Y-m-d H:i:s"),"Y")+1)."</center></td>	
							<td><center> ".$std['branch']."</center></td>				
							<td><center>
							<b> ";?>
							<?php 
							if($std['status']!="1"){echo "Not Registered";}else{echo "Registered";}
							echo "</b>";
							if($std['status']!="1"){
								echo "<a href='op.php?prn=".$std['prn']."' title='Register' name='register' class='btn btn-mini btn-success'><i class='btn-icon-only icon-ok'></i>";}

								echo "
								</a>
								</center></td>
								<td><center> ".$std['mobile']."</center></td>
								</tr>";
								$status=$std['status'];
								$prn=$std['prn'];
							}
							?>
						</tbody>
					</table>
				</div>
				<?php 
				$row=mysqli_num_rows($result);
				if($row==0){show('Data OF PRN '.$prn.' ');}
				?><br />
				<!-- /widget-content --> 
				<div class="widget-header"> <i class="icon-th-list"></i>
					<h3>Student Books Detail <a href=""></a>
						<!-- Button to trigger modal -->
						<?php if($row!=0 && $status=="1"){ ?>
							&emsp;<a href="#myModal" role="button" class="btn" data-toggle="modal"> Add Book<i class="btn-icon-only icon-plus"></i></a>
						<?php } ?>
						<!-- Modal -->
						<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h3 id="myModalLabel">Add New Book</h3>
							</div>
							<div class="modal-body">
								<form  action="op.php" method="post" class="form-horizontal" >
									<div class="control-group">			
										<label class="control-label" for="radiobtns">Book Name</label>
										<div class="controls">
											<div class="input-append">
												<?php if($row!=0){ ?>								
													<input type="hidden" name="prn" value="<?php echo($prn) ?>">
												<?php } ?>
												<input class="span2 m-wrap" id="appendedInputButton" type="text" name="book" autocomplete="off">
												<button class="btn" type="submit" name="add">Add</button>
											</div>
										</div>	<!-- /controls -->			
									</div>
								</form>
							</div>
						</div>
					</h3>
				</div>
				<!-- /widget-header -->
				<div class="widget-content">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<!-- <th> Sr.No.</th> -->
								<th><center> Book Name</center></th>
								<th><center> Purchase date</center></th>
								<th><center> Return Date</center></th>
								<th><center> Renew Date</center></th>
								<th><center> Days Left For <br>Return / Renew</center></th>
								<th><center> Fine Rs.</center></th>
								<th><center> Return / Renew</center></th>
							</tr>
						</thead>
						<tbody>
							<?php 
							$result=select("*","student_book","WHERE prn=$prn ORDER BY took DESC");
							$book_count=0;
							while($stb = mysqli_fetch_assoc($result))
							{
								echo "<tr><td><center>".$stb['book_name']."</center> </td>
								<td> <center>".$stb['took']."</center></td>			
								<td> <center>".$stb['returned']."</center></td>
								<td> <center>".$stb['renew']."</center></td>
								<td> <center>";
								if($stb['returned']=='0000-00-00 00:00:00'&&$stb['renew']!='0000-00-00 00:00:00')
								{
									echo 15-diff_date($stb['renew'],date("Y-m-d H:i:s"),"D");
								}
								elseif($stb['returned']!='0000-00-00 00:00:00')
								{}
							elseif($stb['returned']=='0000-00-00 00:00:00'&&$stb['renew']=='0000-00-00 00:00:00'){
								echo 15-diff_date($stb['took'],date("Y-m-d H:i:s"),"D");
							}else{}
							echo"</cen
							ter></td>";

							if ((abs(diff_date($stb['took'],date("Y-m-d H:i:s"),"D"))>15) && $stb['renew']=='0000-00-00 00:00:00'&&$stb['returned']=='0000-00-00 00:00:00')
							{
								echo"<td style='color:white;background-color:#FF5722;'> <center>".abs(((15-diff_date($stb['took'],date("Y-m-d H:i:s"),"D"))*5))."</center></td>";
							}
							elseif ((abs(diff_date($stb['renew'],date("Y-m-d H:i:s"),"D"))>15) && $stb['renew']!='0000-00-00 00:00:00'&&$stb['returned']=='0000-00-00 00:00:00')
							{
								echo"<td style='color:white;background-color:#FF5722;'> <center>".abs(((15-diff_date($stb['took'],date("Y-m-d H:i:s"),"D"))*5))."</center></td>";
							}
							else
							{
								echo"<td> <center></center></td>";
							}
							echo"<td class='td-actions'>
							<form action='op.php' method='post'>
							<input type='hidden' name='prn' value='".$prn."'>
							<input type='hidden' name='book' value='".$stb['book_name']."'>
							";?>
							<?php 
							if(($row!=0 && $status=="1") && ($stb['returned']!='0000-00-00 00:00:00'))
							{}
						elseif(($row!=0 && $status=="1") && ($stb['renew']!='0000-00-00 00:00:00' && $stb['returned']=='0000-00-00 00:00:00'))
						{
							$book_count=$book_count+1;
							echo"<button type='submit' title='Return' name='return' class='btn btn-small btn-success'><i class='btn-icon-only icon-ok'> </i></button>";	
						}elseif (($row!=0 && $status!="1")) {
							# code...
						}
						else
						{
							$book_count=$book_count+1;
							echo"<button type='submit' title='Return' name='return' class='btn btn-small btn-success'><i class='btn-icon-only icon-ok'> </i></button>";		
							echo "
							<button type='submit' title='Renew' name='renew' class='btn btn-primary btn-small'><i class='btn-icon-only icon-large icon-repeat'></i></button>";
						}
						echo "</form>
						</td></tr>"; 
					}
					if($book_count>=5)
					{
						echo "<script>alert('Don Not Allow Student To Take Book Already Have 5 Books');</script>";
					}
					?>						
				</tbody>
			</table>
		</div>
		<?php 
		$row=mysqli_num_rows($result);
		if($row==0){show('Book Data Of PRN '.$prn.' ');}
		?>
	</div>
<?php }  ?>
</div>
<?php
include('footer.php');
?>