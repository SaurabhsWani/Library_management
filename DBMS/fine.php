<?php
include('header.php');
title("Fine");
?>
<div class="span12">
	<?php message(); ?>
	<div class="widget widget-table action-table">
		<div class="widget-header"> <i class="icon-th-list"></i>
			<h3>List of Student Having Fine</h3>
		</div>
		<!-- /widget-header -->
		<div class="widget-content">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th><center>Prn</center></th>
						<th><center>Student Name</center></th>
						<th><center>Year</center></th>
						<th><center>Category</center></th>
						<th><center>Name</center></th>
						<th><center>Date of Purchase</center></th>
						<th><center>Fine Rs</center></th>
						<th><center>Contact</center></th>
						<th><center>Email</center></th>
						<th><center>SEND MAIL</center></th>
						<th><center>Return</center></th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$result=select("*","student INNER JOIN student_book ON student.prn=student_book.prn","ORDER BY student.prn");
					while($stb = mysqli_fetch_assoc($result))
					{
						if ($stb['category']=='m'){$cmb='Magzine';}
								else{$cmb='Book';}
						if($stb['renew']!='0000-00-00 00:00:00' && (diff_date($stb['renew'],date("Y-m-d H:i:s"),"D")>15)) 
						{
							$fine=abs(((15-diff_date($stb['renew'],date("Y-m-d H:i:s"),"D"))*5));
							echo "<tr>
							<td>".$stb['prn']."</td>
							<td>".$stb['Name']."</td>
							<td>".(diff_date($stb['admi_year'],date("Y-m-d H:i:s"),"Y")+1) ."</td>
							<td>".$cmb."</td>
							<td>".$stb['book_name']."</td>
							<td>".$stb['renew']."</td>
							<td style='color:white;background-color:#FF5722;'> <center>".$fine."</center></td>
							<td>".$stb['mobile']."</td>
							<td>".$stb['Email']."</td>
							<td><center>
							<form action='op.php' method='POST'>
							<input type='hidden' value='".$stb['Email']."' name='email'>
							<input type='hidden' value='".$fine."' name='fine'>
							<input type='hidden' value='".$stb['book_name']."' name='bk'>
							<input type='hidden' value='".$stb['renew']."' name='dt'>
							<button type='submit' title='MAIL' name='op' value='mail' class='btn btn-primary'><i class='btn-icon-only icon-large icon-envelope'></i></button></form></center>
							</td>
							<td><center>
							<form action='op.php' method='post'>
							<input type='hidden' name='prn' value='".$stb['prn']."'>
							<input type='hidden' name='cat' value='".$stb['category']."'>
							<input type='hidden' name='book' value='".$stb['book_name']."'>
							<button type='submit' title='Return' value='return' name='op' class='btn btn-success'><i class='btn-icon-only icon-ok'> </i></button>
							</form>
							</center></td>
							</tr>";
						}
						elseif($stb['renew']=='0000-00-00 00:00:00' && (diff_date($stb['took'],date("Y-m-d H:i:s"),"D")>15)) 
						{
							$fine=abs(((15-diff_date($stb['took'],date("Y-m-d H:i:s"),"D"))*5));
							echo "<tr>
							<td>".$stb['prn']."</td>
							<td>".$stb['Name']."</td>
							<td>".(diff_date($stb['admi_year'],date("Y-m-d H:i:s"),"Y")+1) ."</td>
							<td>".$cmb."</td>
							<td>".$stb['book_name']."</td>
							<td>".$stb['took']."</td>
							<td style='color:white;background-color:#FF5722;'> <center>".$fine."</center></td>
							<td>".$stb['mobile']."</td>
							<td>".$stb['Email']."</td>
							<td><center>
							<form action='op.php' method='POST'>
							<input type='hidden' value='".$stb['Email']."' name='email'>
							<input type='hidden' value='".$fine."' name='fine'>
							<input type='hidden' value='".$stb['book_name']."' name='bk'>
							<input type='hidden' value='".$stb['took']."' name='dt'>
							<button type='submit' title='MAIL' name='op' value='mail' class='btn btn-primary'><i class='btn-icon-only icon-large icon-envelope'></i></button></form></center>
							</td>
							<td><center>
							<form action='op.php' method='post'>
							<input type='hidden' name='prn' value='".$stb['prn']."'>
							<input type='hidden' name='cat' value='".$stb['category']."'>
							<input type='hidden' name='book' value='".$stb['book_name']."'>
							<button type='submit' title='Return' value='return' name='op' class='btn btn-success'><i class='btn-icon-only icon-ok'> </i></button>
							</form>
							</center></td>
							</tr>";
						}
						else{}

					} 
				?>
			</tbody>
		</table>
	</div>
	<!-- /widget-content --> 
</div>
</div>
<?php
include('footer.php');
?>