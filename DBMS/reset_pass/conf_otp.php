<?php
include('security.php');
securityforresetpass();
include('header.php'); 
?>
<form action="conf_otpc.php" method="post">
	<center><h1>Reset Your Password</h1></center>
	<div class="login-fields">
		<p style="font-size: 14px;text-align: center;">Enter OTP Received on this <br /><b style="text-transform: uppercase;"><?php echo $_SESSION['email'];?></b> Mail</p>
		<div class="field">
			<label for="otp">Email</label>
			<input type="text" id="otp" name="otp" value="" placeholder="OTP" class="login password-field" autocomplete="off" maxlength="5" minlength="5" required="" />
		</div> <!-- /field -->	<!-- /password -->				
	</div> <!-- /login-fields -->			
	<div class="login-actions">									
		<button type="submit" class="button btn btn-info btn-large">Confirm Otp</button>
	</div> <!-- .actions -->			
</form>		
<?php
include('footer.php'); ?>