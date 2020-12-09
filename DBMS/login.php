<!DOCTYPE html>
<html lang="en">  
<head>
    <meta charset="utf-8">
    <title>Login - Library Management System</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">     
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet">    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
</head>
<body>	
	<div class="navbar navbar-fixed-top">	
	<div class="navbar-inner">		
		<div class="container">				
			<a class="brand" href="login.php">
				<center>Library Management System</center>			
			</a>
		</div> <!-- /container -->		
	</div> <!-- /navbar-inner -->	
</div> <!-- /navbar -->
<div class="account-container">	
	<div class="content clearfix">		
		<form action="loginc.php" method="post">
			<center><h1>Login</h1></center>
			<div class="login-fields">
				<div class="field">
					<label for="username">Username</label>
					<?php if(isset($_COOKIE['username'])){$email=$_COOKIE['username'];}else{$email="";} ?>
					<input type="text" id="username" name="username" value="<?php echo $email; ?>" placeholder="Username" class="login username-field" />
				</div> <!-- /field -->				
				<div class="field">
					<label for="password">Password:</label>
					<?php if(isset($_COOKIE['password'])){$password=$_COOKIE['password'];}else{$password="";} ?>
					<input type="password" id="password" name="password" value="<?php echo $password; ?>" placeholder="Password" class="login password-field"/>
				</div> <!-- /password -->				
			</div> <!-- /login-fields -->			
			<div class="login-actions">				
				<span class="login-checkbox">
					<input id="Field" name="rm" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Keep me signed in</label>
				</span>									
				<button type="submit" class="button btn btn-success btn-large">Sign In</button>	
			</div> <!-- .actions -->			
		</form>		
	</div> <!-- /content -->	
</div> <!-- /account-container -->
<div class="login-extra">
	<a href="reset_pass/frgt_pass.php">Reset Password</a>
</div> <!-- /login-extra -->
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/signin.js"></script>
</body>
</html>
