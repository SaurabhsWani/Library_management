<?php
include('header.php');
title("Fine");
?>
<div class="span12">
	<div class="widget widget-table action-table">
		<div class="widget-header"> <i class="icon-th-list"></i>
			<h3>List of Student Having Fine</h3>
		</div>
		<!-- /widget-header -->
		<div class="widget-content">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Prn</th>
						<th>Name</th>
						<th>Year</th>
						<th>Fine Rs</th>
						<th>Contact</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1841023</td>
						<td>Prasad Joshi</td>
						<td>3rd</td>
						<td style="background-color: red; color: white;">50</td>
						<td>1598742360</td>
						<td>pj@gmail.com</td>
						<!--This is check and cancel button <td class="td-actions"><a href="javascript:;" class="btn btn-small btn-success"><i class="btn-icon-only icon-ok"> </i></a><a href="javascript:;" class="btn btn-danger btn-small"><i class="btn-icon-only icon-remove"> </i></a></td> -->
					</tr>
				</tbody>
			</table>
		</div>
		<!-- /widget-content --> 
	</div>
</div>
<?php
include('footer.php');
?>