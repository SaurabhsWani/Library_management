<?php
include('header.php');
title("Book");
?>
<div class="span12">
  <?php message(); ?>
  <div class="widget">
    <div class="widget-header"> <i class="icon-bookmark"></i>
      <h3>Manage Book</h3>
    </div>
    <!-- /widget-header -->
    <div class="widget-content">
      <div class="shortcuts"> 
        <a href="#myModal" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-plus-sign"></i><span class="shortcut-label">Add Book</span> </a>
        <a href="#myModal3" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-upload-alt"></i><span class="shortcut-label">Upload Book Data</span> </a>
        <a href="#myModal2" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-remove-sign"></i> <span class="shortcut-label">Remove Book</span> </a>
      </div>
      <!-- /shortcuts --> 
    </div>
    <!-- /widget-content --> 
  </div>
  <!-- /widget -->
  <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Add New Book</h3>
    </div>
    <div class="modal-body">
      <form  action="op.php" method="POST" class="form-horizontal" >
        <div class="control-group">                     
          <label class="control-label" for="name">Book Name</label>
          <div class="controls">
            <input type="text" class="span3" id="name" required value="" name="name">
          </div> <!-- /controls -->       
        </div>
        <div class="control-group">                     
          <label class="control-label" for="author">Author</label>
          <div class="controls">
            <input type="text" class="span3" id="author" value="" required name="author">
          </div> <!-- /controls -->       
        </div>
        <div class="control-group">                     
          <label class="control-label" for="isbn">ISBN</label>
          <div class="controls">
            <input type="text" class="span3" id="isbn" value="" required name="isbn">
          </div> <!-- /controls -->       
        </div>
        <div class="control-group">                     
          <label class="control-label" for="ccount">Copies</label>
          <div class="controls">
            <input type="number" class="span3" id="ccount" value="" required name="ccount">
          </div> <!-- /controls -->       
          <input type="hidden" name="cat" value="bk">
          <Button class="btn" type="submit" name="op" value="AddMZ">ADD</Button>    
        </div>
      </form>
    </div>
  </div>
  <div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Remove Book</h3>
    </div>
    <div class="modal-body">
      <form  action="op.php" method="post" class="form-horizontal" >
        <div class="control-group">     
          <label class="control-label" for="radiobtns">Book Name</label>
          <div class="controls">
            <div class="input-append">           
              <input class="span2 m-wrap" id="appendedInputButton" type="text" name="mn" autocomplete="off" required="">
            </div>
          </div>  <!-- /controls -->      
        </div><div class="control-group">     
          <label class="control-label" for="radiobtns">Book ISBN</label>
          <div class="controls">
            <div class="input-append">           
              <input class="span2 m-wrap" id="appendedInputButton" type="text" name="isbn" autocomplete="off" required="">
              <br><br><input type="hidden" name="cat" value="bk">
              <input class="btn" type="submit" name="op" value="Remove_Magazine">
            </div>
          </div>  <!-- /controls -->      
        </div>
      </form>
    </div>
  </div>
  <div id="myModal3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Upload Book Data</h3>
    </div>
    <div class="modal-body">
      <div class="row" align="center">
        <!-- Import link -->
        <div class="col-md-12 head">
          <div class="float-right">
            <a href="javascript:void(0);" class="btn btn-success" onclick="formToggle('importFrm');"><i class="plus"></i> Import</a>
          </div>
        </div>
        <!-- CSV file upload form -->
        <div class="col-md-12" id="importFrm" style="display: none;">
          <form action="importdata.php" method="post" enctype="multipart/form-data">
            <input type="file" name="file" />
            <input type="hidden" name="cat" value="bk">
            <input type="submit" class="btn btn-primary" name="importSubmitMZ" value="IMPORT">
          </form>
        </div>
      </div>
      <!-- Show/hide CSV upload form -->
      <script>
        function formToggle(ID){
          var element = document.getElementById(ID);
          if(element.style.display === "none"){
            element.style.display = "block";
          }else{
            element.style.display = "none";
          }
        }
      </script>
    </div>
  </div><!-- /controls -->      
  <div class="widget widget-table action-table">
    <div class="widget-header"><i class='icon-list'></i> 
      <h3>
        <?php
        $result=select("*","book","WHERE 1");
        $row=mysqli_num_rows($result);
        if($row!=0){ ?>
          <form  action="Book.php" method="GET" >
            Book Name 
            &emsp;<input class="span4 m-wrap" type="text" name="mgn" placeholder="Enter Book Name to show">
            Book ISBN 
            &emsp;<input class="span2 m-wrap" type="text" name="in" placeholder="Enter Book isbn to show">
            No of row 
            &emsp;<input class="span2 m-wrap" type="number" required name="cnt" autocomplete="off" placeholder="Enter records number to show" value="10">
            <input type="hidden" name="page" value="Dashboard">
            &emsp;<input type="submit" class="btn-primary" value="show">
          </form>
        <?php } ?>
      </h3>
    </div>
    <!-- /widget-header -->
    <div class="widget-content table-bordered">
      <table class="table table-striped">
        <thead>
          <tr>
            <th><center>ID</center></th>
            <th><center>Book Name</center></th>
            <th><center>Author Name</center></th>
            <th><center>ISBN</center></th>
            <th><center>Date Of Add</center></th>
            <th><center>Available copies /<br> total copies</center></th>
          </tr>
        </thead>
        <tbody>
          <?php     
          function res(){ $cnt=25;
            $result=select("*","Book","ORDER BY id  LIMIT $cnt ");}
            if(isset($_GET['cnt']) && isset($_GET['mgn']))
            {
              $mgn = trim($_GET['mgn']);
              $cnt = $_GET['cnt'];
              $in = trim($_GET['in']);
              if($mgn == null)
              {
                if(isset($_GET['in']))
                {
                  if($in == null)
                  {
                    res();
                  }else
                  {
                    $result=select("*","Book","WHERE isbn='$in' ORDER BY id ASC LIMIT $cnt ");
                  }
                }
              }
              elseif($in != null && $mgn != null)
              {
                $result=select("*","Book","WHERE name LIKE '%$mgn%' AND isbn='$in' ORDER BY id ASC LIMIT $cnt ");
              }
              else{$result=select("*","Book","WHERE name LIKE '%$mgn%' ORDER BY id ASC LIMIT $cnt ");}
            }
            else{res();}
            $row=mysqli_num_rows($result);
            while($std=mysqli_fetch_assoc($result))
            {
              $copyid=$av=0;
              $i=$std['id'];
              echo "<tr>
              <td><center> ".$i."</center></td>
              <td><center> ".$std['name']."</center></td> 
              <td><center> ".$std['author']."</center></td>  
              <td><center> ".$std['isbn']."</center></td>  
              <td><center> ".$std['dateadd']."</center></td> ";
              $resultt=select("*","Bookcopy","WHERE bookid = '$i'");
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
      </div>
      <?php
      if ($row==null)
      {
        echo '<div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert">&times;</button>No Record Found For This Search</div>';
      }
      ?>
      <!-- /widget-content --> 
    </div>
  </div>
  <?php
  include('footer.php');
  ?>