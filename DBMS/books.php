<?php
include('header.php');
title("Books");
?>
<div class="span12">
  <div class="widget">
    <div class="widget-header"> <i class="icon-bookmark"></i>
      <h3>Manage Books</h3>
    </div>
    <!-- /widget-header -->
    <div class="widget-content">
      <div class="shortcuts"> 
        <a href="#myModal" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-plus-sign"></i><span class="shortcut-label">Add Book</span> </a>
        <a href="#myModal3" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-upload-alt"></i><span class="shortcut-label">Upload Book Data</span> </a>
        <a href="#myModal2" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-remove-sign"></i> <span class="shortcut-label">Remove Book</span> </a>
        <a href="#myModal0" role="button" data-toggle="modal" class="shortcut"><i class="shortcut-icon icon-search"></i> <span class="shortcut-label">Search Book</span> </a>
      </div>
      <!-- /shortcuts --> 
    </div>
    <!-- /widget-content --> 
  </div>
  <!-- /widget -->
<?php message();?>

  <!-- Add books -->
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
            <input type="text" class="span3" id="name" value="" name="name">
          </div> <!-- /controls -->       
        </div>
        <div class="control-group">                     
          <label class="control-label" for="id">Book ID</label>
          <div class="controls">
            <input type="number" class="span3" id="id" value="" name="id">
          </div> <!-- /controls -->       
        </div>
        <div class="control-group">                     
          <label class="control-label" for="auth">Auther</label>
          <div class="controls">
            <input type="text" class="span3" id="auth" value="" name="auth">
          </div> <!-- /controls -->       
        </div>
        <div class="control-group">                     
          <label class="control-label" for="ttl">Total Copies</label>
          <div class="controls">
            <input type="number" class="span3" id="ttl" value="" maxlength="5" minlength="1" name="ttl">
          </div> <!-- /controls -->  
          <Button class="btn" type="submit" name="op" value="AddBK">ADD</Button>
        </div>
      </form>
    </div>
  </div>
  <!-- Remove Books -->
  <div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Remove Book</h3>
    </div>
    <div class="modal-body">
      <form  action="op.php" method="post" class="form-horizontal" >
        <div class="control-group">     
          <label class="control-label" for="radiobtns">Book ID</label>
          <div class="controls">
            <div class="input-append">           
              <input class="span2 m-wrap" id="appendedInputButton" type="text" name="id1" autocomplete="off">
              <br><br>
              <Button class="btn" type="submit" name="op" value="rmBK">Remove</Button>
            </div>
          </div>  <!-- /controls -->      
        </div>
      </form>
    </div>
  </div>

  <!-- Upload data to db -->
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
            <a href="javascript:void(0);" class="btn btn-success" onclick="formToggle('importFrm');"><i class="plus"></i> Upload  Book Record</a>
          </div>
        </div>
        <!-- CSV file upload form -->
        <div class="col-md-12" id="importFrm" style="display: none;">
          <form action="importdata.php" method="post" enctype="multipart/form-data">
            <input type="file" name="file" />
            <input type="submit" class="btn btn-primary" name="importbk" value="Upload Book Data">
          </form>
        </div>
      </div><br>

      <div class="row" align="center">
        <!-- Import link -->
        <div class="col-md-12 head">
          <div class="float-right">
            <a href="javascript:void(0);" class="btn btn-success" onclick="formToggle('importFrm1');"><i class="plus"></i> Upload record of copies</a>
          </div>
        </div><br>
        <div class="col-md-12" id="importFrm1" style="display: none;">
          <form action="importdata.php" method="post">
            <input type="file" name="file" />
            <input type="submit" class="btn btn-primary" name="importcp" value="Upload Copy Data">
          </form>
        </div>
      </div>
    </div>
  </div>  <!-- /controls -->      


  <!-- search Books -->
  <div id="myModal0" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3 id="myModalLabel">Search Book</h3>
    </div>
    <div class="modal-body">
      <div class="row" align="center">
        <!-- Import link -->
        <div class="col-md-12 head">
          <div class="float-right">
            <a class="btn btn-success" onclick="formToggle('sbi');"><i class="plus"></i> Search by ID</a>
          </div>
        </div><br>
        <div class="col-md-12" id="sbi" style="display: none;">
          <form action="srch.php" method="post">
            <input type="text" name="sbid" />
            <Button class="btn" type="submit" name="searchbooks" value="sbidbt" class="btn btn-primary">Search</Button>
          </form>
        </div>
      </div>

      <div class="row" align="center">
        <!-- Import link -->
        <div class="col-md-12 head">
          <div class="float-right">
            <a class="btn btn-success" onclick="formToggle('sbn');"><i class="plus"></i> Search by Book Name</a>
          </div>
        </div><br>
        <div class="col-md-12" id="sbn" style="display: none;">
          <form action="srch.php" method="post">
            <input type="text" name="sbbn" />
            <Button class="btn" type="submit" name="searchbooks" value="sbbnbt" class="btn btn-primary">Search</Button>
          </form>
        </div>
      </div>

      <div class="row" align="center">
        <!-- Import link -->
        <div class="col-md-12 head">
          <div class="float-right">
            <a class="btn btn-success" onclick="formToggle('sba');"><i class="plus"></i> Search by Auther</a>
          </div>
        </div><br>
        <div class="col-md-12" id="sba" style="display: none;">
          <form action="srch.php" method="post">
            <input type="text" name="sba" />
            <Button class="btn" type="submit" name="searchbooks" value="sbabt" class="btn btn-primary">Search</Button>
          </form>
        </div>
      </div>
    </div>
  </div> 
  <div class="widget">
    <div class="widget-header"> <i class='icon-list'></i> 
      <h3><?php
      $result=select("*","books","WHERE 1");
      $row=mysqli_num_rows($result);
      if($row!=0){ ?>
        Book List 
      <?php } ?>
    </h3>
  </div>
  <!-- /widget-header -->
  <div class="widget-content">
    <div class="container">
      <h2>Book Data</h2> 

      <table class="table table-striped">
        <thead>
          <tr>
            <th><center>Referance ID</center></th>
            <th><center>Book Name</center></th>
            <th><center>Auther</center></th>
            <th><center>Total Copies</center></th>
            <th><center>Available Copies</center></th>
          </tr>
        </thead>
        <tbody>
          <?php
          $result=select("*","books","WHERE 1");
          while($std=mysqli_fetch_assoc($result))
          {
            echo "<tr>
            <td><center> ".$std['bk_id']."</center></td>
            <td><center> ".$std['book_name']."</center></td>  
            <td><center> ".$std['auther']."</center></td>  
            <td><center> ".$std['toatal_cp']."</center></td>
            <td><center> ".$std['cp_left']."</center></td>     
            <td><center>
            <b> ";?>
            <?php 
            echo "</a></center></td>
            </tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </div>
  <!-- /widget-content --> 
</div>
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
<?php
include('footer.php');
?>
</div>