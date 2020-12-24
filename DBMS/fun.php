<?php
function title($page){
	echo '<title>'.$_SESSION['sn'].' | '.$page.'</title>';
}

function message()
{
	if (isset($_SESSION['Success']) && $_SESSION['Success']!='') 
	{
		echo '<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>'.$_SESSION['Success'].'</div>';
		unset($_SESSION['Success']);
	}
	if (isset($_SESSION['Status'])&&$_SESSION['Status']!='') 
	{
		echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Warning!</strong> '.$_SESSION['Status'].'</div>';
		unset($_SESSION['Status']);
	}
}

function select($var,$col,$condtn)
{
	$query="SELECT $var FROM $col $condtn";
	$sql=mysqli_query($GLOBALS['connection'],$query);	
	return $sql;
}

function update($col,$lhs,$rhs,$condtn)
{
	$query="UPDATE $col SET $lhs=$rhs $condtn";
	if (mysqli_query($GLOBALS['connection'],$query)) 
	{
		return true;
	}	
	else
	{
		return false;
	}
}

function poutput($msg,$location)
{
	$_SESSION['Success']=$msg;
	header('Location:'.$location.'');
}
function noutput($msg,$location)
{
	$_SESSION['Status']=$msg;
	header('Location:'.$location.'');
}
function diff_date($date1,$date2,$category)
{
	$diff = abs(strtotime($date2) - strtotime($date1));
	$years = floor($diff / (365*60*60*24));
	$months = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));
	$days = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));
	if ($category=="Y"){return $years;}
	elseif($category=="M"){return $months;}
	elseif($category=="D"){ if($months>=1){return $months*30+$days;}else{return $days;} }
	else{return $years."y-".$months."m-".$days."d";}
}
function show($msg){
	echo "<div class='alert alert-info'>
	<button type='button' class='close' data-dismiss='alert'>&times;</button>
	<center><strong>Warning!</strong> No ".$msg." Found</center>
	</div>";
}
?>