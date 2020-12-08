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
					</tr>
				</thead>
				<tbody>
					<?php 
					$result=select("*","student INNER JOIN student_book ON student.prn=student_book.prn","WHERE (student_book.returned='0000-00-00 00:00:00' AND (student_book.renew!='0000-00-00 00:00:00' OR student_book.renew='0000-00-00 00:00:00')) ORDER BY student.prn");
					while($stb = mysqli_fetch_assoc($result))
					{
						?>
						<tr>
							<td><?php echo $stb['prn']?></td>
							<td><?php echo $stb['Name']?></td>
							<td><?php echo (diff_date($stb['admi_year'],date("Y-m-d H:i:s"),"Y")+1); ?></td>
							<td><?php echo $stb['book_name']?></td>
							<td><?php echo $stb['took']?></td>
							<?php 
							if ((diff_date($stb['took'],date("Y-m-d H:i:s"),"D")>15) && $stb['renew']=='0000-00-00 00:00:00'&&$stb['returned']=='0000-00-00 00:00:00')
							{
								echo"<td style='color:white;background-color:#FF5722;'> <center>".abs(((15-diff_date($stb['took'],date("Y-m-d H:i:s"),"D"))*5))."</center></td>";
							}
							else
							{
								echo"<td> <center></center></td>";
							}
							?>
							<td><?php echo $stb['mobile']?></td>
							<td><?php echo $stb['Email']?></td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
		<!-- /widget-content --> 
	</div>
</div>
<?php
include('footer.php');
?>