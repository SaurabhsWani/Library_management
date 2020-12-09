<?php
include('header.php'); ?>
<form action="frgt_passc.php" method="post">
	<center><h1>Reset Your Password</h1></center>
	<div class="login-fields">
		<p style="font-size: 14px;text-align: center;"><b>Enter Your Email</b></p>
		<div class="field">
			<label for="username">Email</label>
			<input type="text" id="username" name="email" value="" placeholder="Email" class="login username-field" autocomplete="off" />
		</div> <!-- /field -->	<!-- /password -->				
	</div> <!-- /login-fields -->			
	<div class="login-actions">									
		<button type="submit" class="button btn btn-success btn-large">Send Otp</button>
	</div> <!-- .actions -->			
</form>		
<?php
include('footer.php'); ?>