<?php include('security.php');include('fun.php');
securityforpage();?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
  <link href="css/font-awesome.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/pages/dashboard.css" rel="stylesheet">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
          class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">Library Management System</a>
          <div class="nav-collapse">
            <ul class="nav pull-right">
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo "<b style='font-size: 14px;'><i class='icon-user'></i> ".$_SESSION['sn']."</b>";?> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="profile.php">Profile</a></li>
                  <li><a href="logout.php">Logout</a></li>
                </ul>
              </li>
            </ul>
        <!-- <form class="navbar-search pull-right">
          <input type="text" class="search-query" placeholder="Search">
        </form> -->
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">        
        <li class=" <?php if($_GET['page']=='Dashboard'){ echo 'active';} ?>"><a href="index.php?page=Dashboard"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li class="<?php if($_GET['page']=='IMPORT-EXPORT'){ echo 'active';} ?>"><a href="gt.php?page=IMPORT-EXPORT"><i class="icon-list-alt"></i><span>Students</span> </a> </li>
        <li class="<?php if($_GET['page']=='Books'){ echo 'active';} ?>"><a href="gt1.php?page=Books"><i class="icon-book"></i><span>Books</span> </a> </li>
        <?php if ($_SESSION['category']==0): ?>
        <li class="<?php if($_GET['page']=='Statistics'){ echo 'active';} ?>"><a href="gt2.php?page=Statistics"><i class="icon-bar-chart"></i><span>Statistics</span> </a> </li> 
        <?php endif;?>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->
<!-- <div class="main"> -->
  <div class="main-inner">
    <div class="container">
      <div class="row">