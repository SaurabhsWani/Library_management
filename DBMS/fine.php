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
						<th>Book</th>
						<th>Date of Purchase</th>
						<th>Fine Rs</th>
						<th>Contact</th>
						<th>Email</th>
						<th>SEND MAIL</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$result=select("*","student INNER JOIN student_book ON student.prn=student_book.prn","ORDER BY student.prn");
					while($stb = mysqli_fetch_assoc($result))
					{
						if($stb['renew']!='0000-00-00 00:00:00' && (diff_date($stb['renew'],date("Y-m-d H:i:s"),"D")>15)) 
						{
							echo "<tr>
							<td>".$stb['prn']."</td>
							<td>".$stb['Name']."</td>
							<td>".(diff_date($stb['admi_year'],date("Y-m-d H:i:s"),"Y")+1) ."</td>
							<td>".$stb['book_name']."</td>
							<td>".$stb['took']."</td>
							<td style='color:white;background-color:#FF5722;'> <center>".abs(((15-diff_date($stb['renew'],date("Y-m-d H:i:s"),"D"))*5))."</center></td>
							<td>".$stb['mobile']."</td>
							<td>".$stb['Email']."</td>
							<td><button type='submit' title='MAIL' name='MAIL' class='btn btn-primary'><i class='btn-icon-only icon-large icon-envelope'></i></button></td></td>
							</tr>";
						}
						elseif($stb['renew']=='0000-00-00 00:00:00' && (diff_date($stb['took'],date("Y-m-d H:i:s"),"D")>15)) 
						{
							echo "<tr>
							<td>".$stb['prn']."</td>
							<td>".$stb['Name']."</td>
							<td>".(diff_date($stb['admi_year'],date("Y-m-d H:i:s"),"Y")+1) ."</td>
							<td>".$stb['book_name']."</td>
							<td>".$stb['took']."</td>
							<td style='color:white;background-color:#FF5722;'> <center>".abs(((15-diff_date($stb['took'],date("Y-m-d H:i:s"),"D"))*5))."</center></td>
							<td>".$stb['mobile']."</td>
							<td>".$stb['Email']."</td>
							<td><button type='submit' title='MAIL' name='MAIL' class='btn btn-primary'><i class='btn-icon-only icon-large icon-envelope'></i></button></td>
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