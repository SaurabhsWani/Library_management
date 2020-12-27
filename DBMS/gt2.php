<?php  
include('header.php');
title("Statistics");
if ($_SESSION['category']==0):
?>
<div class="span6">
    <div class="widget">
        <div class="widget-header">
            <i class="icon-bar-chart"></i>
            <h3>
            Bar Chart</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <canvas id="bar-chart" class="chart-holder" width="538" height="250">
            </canvas>
            <!-- /bar-chart -->
        </div>
        <!-- /widget-content -->
    </div>
    <!-- /widget -->
    <div class="widget">
        <div class="widget-header">
            <i class="icon-bar-chart"></i>
            <h3>
            Line Chart</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <canvas id="area-chart" class="chart-holder" width="538" height="250">
            </canvas>
            <!-- /line-chart -->
        </div>
        <!-- /widget-content -->
    </div>
    <!-- /widget -->
    <div class="widget">
        <div class="widget-header">
            <i class="icon-bar-chart"></i>
            <h3>
            Pie Chart</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <canvas id="pie-chart" class="chart-holder" width="538" height="250">
            </canvas>
            <!-- /pie-chart -->
        </div>
        <!-- /widget-content -->
    </div>
    <!-- /widget -->
</div>
<!-- /span6 -->
<div class="span6">
    <div class="widget">
        <div class="widget-header">
            <i class="icon-bar-chart"></i>
            <h3>
            Donut Chart</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <canvas id="donut-chart" class="chart-holder" width="538" height="250">
            </canvas>
            <!-- /bar-chart -->
        </div>
        <!-- /widget-content -->
    </div>
    <!-- /widget -->
    <div class="widget">
        <div class="widget-header">
            <i class="icon-bar-chart"></i>
            <h3>
            A Chart</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <canvas id="line-chart" class="chart-holder" width="538" height="250">
            </canvas>
            <!-- /-chart -->
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
