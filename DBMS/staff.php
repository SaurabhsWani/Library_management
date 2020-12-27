<?php
include('header.php');
title("Staff");
if ($_SESSION['category']==0):
?>
<div class="span12">
  <div class="widget">
    <div class="widget-header"> <i class="icon-bookmark"></i>
      <h3>Manage Staff</h3>
    </div>
    <!-- /widget-header -->
    <div class="widget-content">
      <div class="shortcuts"> 
        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-plus-sign"></i><span class="shortcut-label">Add Staff</span> </a>
        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-upload-alt"></i> <span class="shortcut-label">Import Staff Data</span> </a>
        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-remove-sign"></i> <span class="shortcut-label">Remove Staff</span> </a>
        <a href=" javascript:;" class="shortcut"> <i class="shortcut-icon icon-search"></i><span class="shortcut-label">Search Staffs</span> </a>
        <a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-filter"></i><span class="shortcut-label">Filter Staffs</span> </a>
      </div>
      <!-- /shortcuts --> 
    </div>
    <!-- /widget-content --> 
  </div>
  <!-- /widget -->
</div>
<?php
include('footer.php');
endif; 
if ($_SESSION['category']!=0):
echo "<script>window.location='index.php?page=Dashboard';</script>"; 
endif;?> 