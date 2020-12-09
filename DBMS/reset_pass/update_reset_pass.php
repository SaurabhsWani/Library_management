<?php
include('security.php');
securityforresetpass();
include('header.php'); ?>
<form action="update_reset_passc.php" method="post">		
	<h1>Reset Password</h1>	
	<div class="login-fields">	
		<div class="field">
			<input type="email" value="" style="font-size: 15px;" placeholder="<?php echo $_SESSION['eml']; ?>" class="login username-field" disabled=""  />
		</div>
		<div class="field">
			<label for="pass1">Enter New Password:</label>
			<input type="text" id="pass1" style="font-size: 15px;" name="pass1" value="" placeholder="Enter New Password" class="login password-field" autocomplete="off" />
		</div> <!-- /field -->
		<div class="field">
			<label for="confirm_password">Confirm Password:</label>
			<input type="password" style="font-size: 15px;" id="confirm_password" name="pass2" value="" placeholder="Confirm Password" autocomplete="off" class="login password-field"/>
		</div> <!-- /field -->
	</div> <!-- /login-fields -->
	<div class="login-actions">
		<button class="button btn btn-primary btn-large">Done</button>
	</div> <!-- .actions -->
</form>	
<?php
include('footer.php'); ?>