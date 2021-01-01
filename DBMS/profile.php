<?php
include('header.php');
title("Profile");
?>
<div class="span12">    
	<?php message();
	$result=select("*","staff","WHERE Email='$_SESSION[username]' LIMIT 1");
	$idd=mysqli_fetch_array($result); 
	?>
	<div class="widget ">
		<div class="widget-header">
			<i class="icon-user"></i>
			<h3>My Profile</h3>
		</div> <!-- /widget-header -->
		<div class="widget-content">
			<div class="tabbable">
				<div class="tab-content">
					<div class="tab-pane active" id="formcontrols">
						<form action="op.php" method="post" enctype="multipart/form-data" class="form-horizontal">
							<div class="control-group">									
								<?php echo "<img alt='No Photo' src='images/".$idd['image']."' class='control-label span4' for='userimage' style='border-radius: 50%;display: inline-block;
								width: 80px;
								height: 80px;' onerror=this.src='images/stff.png'>";?>								
								<div class="controls">
									<div class="input-append">
										<input type="hidden" name="sid" value="<?php echo $_SESSION['sid'];?>">
										<input type="file" name="userimage" id="userimage" class="span4" required="">
										<button type="submit" class="btn btn-info" value="updateimg" name="op">Update</button>
									</div>
								</div>	<!-- /controls -->			
							</div>
						</form>
						<form  action="op.php" method="post" class="form-horizontal">
							
							<div class="control-group">		
								<label class="control-label" for="Name">Name</label>
								<div class="controls">
									<input type="text" class="span4" id="Name" name="name" value="<?php echo $idd['Name'];?>" required="">
								</div> <!-- /controls -->				
							</div>
							<input type="hidden" name="sid" value="<?php echo $idd['sid'];?>">
							<div class="control-group">		
								<label class="control-label" for="email">Email Address</label>
								<div class="controls">
									<input type="text" class="span4" name="email" id="email" value="<?php echo $idd['Email'];?>" required="">
								</div> <!-- /controls -->				
							</div>
							<div class="control-group">	
								<label class="control-label" for="Branch">Branch</label>
								<div class="controls">
									<input type="text" disabled class="span4" id="Branch" value="<?php echo $idd['branch'];?>">
								</div> <!-- /controls -->				
							</div> <!-- /control-group -->
							<div class="control-group">									
								<label class="control-label" for="LL">Last Login</label>
								<div class="controls">
									<input type="text" disabled class="span4" id="LL" value="<?php echo $idd['last_login'];?>">
								</div> <!-- /controls -->				
							</div>
							<div class="control-group">									
								<label class="control-label" for="LLip">Last Login From this ip</label>
								<div class="controls">
									<input type="text" disabled class="span4" id="LLip" value="<?php echo $idd['Login_ip'];?>">
								</div> <!-- /controls -->				
							</div>
							<button type="submit" name="op" value="updateprof" class="btn btn-primary">Save</button> 
						</form>
					</div>
				</div>
			</div>
		</div> <!-- /widget-content -->
	</div>
</div>
<?php
include('footer.php');
?>