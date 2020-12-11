<?php
include('security.php'); 
securityforloginpage(); 
include('fun.php');  
if ($_SERVER["REQUEST_METHOD"]=="POST") 
{
    if (empty($_POST["username"])) 
    {
        echo '<script>alert(\"Please Enter Username\")</script>';
        echo '<script>window.location="login.php"</script>';    
    }
    elseif (!filter_var($_POST["username"],FILTER_VALIDATE_EMAIL)) 
    {
        echo '<script>alert(\"Please Enter Valid Username\")</script>';
        echo '<script>window.location="login.php"</script>';    
    }
    else
    {
        if(isset($_POST['username']))
        {
            $username=$_POST['username'];
            $result=select("password","staff","WHERE Email='$username'");
            $passcode=mysqli_fetch_array($result);
            if(empty($passcode))
            {
                setcookie('usernamet'," ", time()-1);
                header("Location:login.php");//?error=Incorrect Username or Username does not exit
                return false;
            }
            else
            {
                setcookie('usernamet',$username, time()+(60*5));
            }
            if($passcode['password']==$_POST['password'])
            {

                setcookie('usernamet', time()-1);
                if (isset($_POST['rm']))
                {
                    setcookie('username',$username, time()+60*60*7);
                    setcookie('password',$_POST['password'], time()+60*60*7);
                }
                $ip=$_SERVER['REMOTE_ADDR'];
                if(update("staff","Login_ip","'$ip'","WHERE Email='$username'"))
                {
                    $result=select("*","staff","WHERE Email='$username' LIMIT 1");
                    $idd=mysqli_fetch_array($result);
                    $_SESSION['sn']=$idd['Name'];
                    $_SESSION['sid']=$idd['sid'];
                    $_SESSION['username']=$idd['Email'];
                    echo '<script>window.location="index.php?page=Dashboard"</script>'; 
                }           
            }
            else
            {
                header("Location:login.php?error=Incorrect password");
                return false;
            }
        }
        else
        {
            $_SESSION['username']="Incorrect username or username does not exit";
            echo '<script>window.location="login.php?error=Incorrect password"</script>';
            return false;
        }
    }
}
?>