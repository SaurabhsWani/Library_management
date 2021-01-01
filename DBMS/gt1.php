<?php
include('header.php');
title("Books");
?>
<div class="span12">    
	<div class="widget ">
		<div class="widget-header">
			<i class="icon-user"></i>
			<h3>Search book</h3>
		</div> <!-- /widget-header -->
		<div class="widget-content">
			<div class="tabbable">
				<div class="tab-content">
					<div class="tab-pane active" id="formcontrols">
						<form  action="gt1.php" method="GET" class="form-horizontal" >
							<div class="control-group">			
								<label class="control-label" for="radiobtns">Find Book/Magzine by isbn</label>
								<div class="controls">
									<div class="input-append">
										<input type="hidden" name="page" value="Books">
										<select name="cat">
											<option value="bookcopy">Book</option>
											<option value="magazinecopy">Magzine</option>
										</select>
										<input class="span2 m-wrap" id="appendedInputButton" type="text" name="bk" placeholder="ISBN" autocomplete="off">
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
	if(!empty($_GET['bk']) && $_SERVER['REQUEST_METHOD'] == 'GET')
	{
		$isbn=trim($_GET['bk']);
		$cat=trim($_GET['cat']);
		if ($cat=='bookcopy') {$c='Book';}else{$c='Magazine';}
		?>
		<div class="widget widget-table action-table">
			<div class="widget-header"> <i class="icon-th-list"></i>
				<h3><?php echo $c; ?> Detail <a href=""></a>
				</h3>
			</div>
			<div class="widget widget-table action-table">
				<!-- /widget-header -->
				<div class="widget-content table-bordered">
					<table class="table table-striped ">
						<thead>
							<tr>
								<!-- <th> Sr.No.</th> -->
								<th><center> Book ISBN </center></th>
								<th><center> Book Name</center></th>
								<th><center> author </center></th>
								<th><center> available copies / total copies</center></th>
							</tr>
						</thead>
						<tbody>
							<?php 
							$result=select("*",$c,"WHERE isbn='$isbn' LIMIT 1");
							while($std = mysqli_fetch_assoc($result)) 
							{
								$copyid=$av=0;
								$idd=$std['id'];	
								$nn=$std['name'];						
								echo "<tr>
								<td><center> ".$std['isbn']."</center></td>  
								<td><center> ".$nn."</center></td> 
								<td><center> ".$std['author']."</center></td>";
								$resultt=select("*",$cat,"WHERE bookid = '$idd'");
								while($stdd=mysqli_fetch_assoc($resultt))
								{ 
									if ($stdd['status']==1) 
									{
										$av=$av+1;
									}
									$copyid=$copyid+1;
								}    
								echo "<td><center> ".$av."/".$copyid."</center></td></tr>";
							}
							?>						
						</tbody>
					</table>
					</div><?php 
					$row=mysqli_num_rows($result);
					if($row==0){show('Book Data Of ISBN '.$isbn.' ');} ?>
				</div>
			</div>

			<?php if($row!=0)
			{
				if($copyid!=$av )
				{
					?><div class="widget widget-table action-table">
						<div class="widget-header"> <i class="icon-th-list"></i>
							<h3><?php echo $c; ?> Taken By Students</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content table-bordered">
							<table class="table table-striped ">
								<thead>
									<tr>
										<th> Copy Id </th>
										<th> PRN</th>
										<th> Name</th>
										<th> Branch </th>
									</tr>
								</thead>
								<tbody>
									<?php

									$query="SELECT * FROM $cat INNER JOIN student ON $cat.prn=student.prn WHERE $cat.bookid='$idd' AND $cat.prn!=0";
									$sql=mysqli_query($connection,$query);
									while($std=mysqli_fetch_assoc($sql))
									{
										echo "<tr>
										<td> ".$std['copyid']." </td>
										<td> ".$std['prn']." </td>
										<td> ".$std['Name']." </td>
										<td> ".$std['branch']." </td>
										</tr>";
									}
									?>
								</tbody>
							</table>
						</div>
					</div>
				<?php }  
				if($copyid==$av){show('Book data Assigned to Students Of ISBN '.$isbn.' ');} ?>
			</div>
		<?php }  
	}?>
</div>
<?php
include('footer.php');
?>