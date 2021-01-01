<!DOCTYPE html>
<html lang="en">  
<head>
	<meta charset="utf-8">
	<title>Login - Library Management System</title>
	<style>.error {color: #FF0000;}

	input:focus:required:invalid:focus, textarea:focus:required:invalid:focus, select:focus:required:invalid:focus {
		border-color:#e9322d;
		-webkit-box-shadow:0 0 6px #f8b9b7;
		-moz-box-shadow:0 0 6px #f8b9b7;
		box-shadow:0 0 6px #f8b9b7;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">     
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet">    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
</head>
<body>	
	
	<?php
	$emaill="";
	function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
  // define variables and set to empty values
	$emailErr = "";
	$email = "";
	$e=$p=0;

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		if (empty($_POST["username"])) {
			$emailErr = "Email is required";
		} else {
			$emaill = test_input($_POST["username"]);
    // check if e-mail address is well-formed
			if (!filter_var($emaill, FILTER_VALIDATE_EMAIL)) {
				$emailErr = "Invalid email format";$e=2;
			}
			else{$e=1;}
		}    
	}
	if ($e ==1 && isset($_POST['password'])) 
	{
		include('security.php'); 
		securityforloginpage(); 
		include('fun.php');  
		if ($_SERVER["REQUEST_METHOD"]=="POST") 
		{
			
			if(isset($_POST['username']))
			{
				$username=$_POST['username'];
				$result=select("password,Category","staff","WHERE Email='$username'");
				$passcode=mysqli_fetch_array($result);
				if(empty($passcode))
				{
					setcookie('usernamet'," ", time()-1);
					$e=$p=2;
				}
				else
				{
					setcookie('usernamet',$username, time()+(60*5));
					if($passcode['password']==$_POST['password'])
					{

						setcookie('usernamet', time()-1);
						if (isset($_POST['rm']))
						{
							setcookie('username',$_POST['username'], time()+60*60*7);
							setcookie('password',$_POST['password'], time()+60*60*7);
							unset($emaill);
						}
						$ip=$_SERVER['REMOTE_ADDR'];
						if(update("staff","Login_ip","'$ip'","WHERE Email='$username'"))
						{
							$result=select("*","staff","WHERE Email='$username' LIMIT 1");
							$idd=mysqli_fetch_array($result);
							$_SESSION['sn']=$idd['Name'];
							$_SESSION['sid']=$idd['sid'];
							$_SESSION['username']=$idd['Email'];
							$_SESSION['category']=$idd['Category'];
							echo '<script>window.location="index.php?page=Dashboard"</script>'; 
						}
						else{$e=$p=3;}
					}
					else
					{
						$p=2;
					}
				}
			}
			else
			{
				$e=$p=2;
			}
		}
	}
	?>
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
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
				<center><h1>Login</h1></center>
				<div class="login-fields">
					<div class="field">
						<label for="username">Username</label>
						<?php if(isset($_COOKIE['username']))
						{$email=$_COOKIE['username']; unset($emaill);}
						else{$email=$emaill;} 
						?>
						<input type="email" id="username" name="username" style="<?php if($e==2){echo"color:#b94a48;border-color:#ee5f5b;";}?>" value="<?php echo $email; ?>" placeholder="Username" class="login username-field"/>
						<span class="error"><?php echo $emailErr;?></span>
					</div> <!-- /field -->				
					<div class="field">
						<label for="password">Password:</label>
						<?php if(isset($_COOKIE['password'])){$password=$_COOKIE['password'];}else{$password="";} ?>
						<input type="password" id="password" required name="password" value="<?php echo $password; ?>" placeholder="Password" class="login password-field" style="<?php if($p==2){echo"color:#b94a48;border-color:#ee5f5b;";}?>"/>
					</div> <!-- /password -->				
				</div> <!-- /login-fields -->			
				<div class="login-actions">				
					<span class="login-checkbox">
						<input id="Field" name="rm" type="checkbox" class="field login-checkbox" value="yes" tabindex="4" />
						<label class="choice" for="Field">Keep me signed in</label>
					</span>									
					<button type="submit" class="button btn btn-success btn-large">Sign In</button>	
				</div> <!-- .actions -->			
			</form>		<a href="reset_pass/frgt_pass.php">Reset Password</a>
		</div> <!-- /content -->	
	</div> <!-- /account-container -->
	<!-- /login-extra -->	
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/signin.js"></script>
</body>
</html>
