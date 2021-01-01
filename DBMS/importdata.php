<?php
// Load the database configuration file
include('security.php');include('fun.php');

if(isset($_POST['importSubmit'])){
    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');    
    // Validate whether selected file is a CSV file
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)){
        // If the file is uploaded
        if(is_uploaded_file($_FILES['file']['tmp_name']))
        {            
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');            
            // Skip the first line
            fgetcsv($csvFile);
            $c=$ui=$f=0;
            // Parse data from CSV file line by line
            while(($line = fgetcsv($csvFile)) !== FALSE){
                $c=$c+1;
                // Get row data
                $prn   = $line[0];
                $Name  = $line[1];
                $Email  = $line[2];
                $mobile = $line[3];
                $branch = $line[4];
                $admi_year = $line[5];
                $Gender = $line[6];
                $Address = $line[7];
                
                // Check whether student already exists in the database
                $prevResult = select("prn","student","WHERE prn = '$prn'");                
                if($prevResult->num_rows > 0){
                    // Update student data in the database
                    if($connection->query("UPDATE student SET prn = '$prn', Name = '$Name', Email = '$Email', mobile = '$mobile', branch = '$branch', admi_year = '$admi_year', Gender = '$Gender', Address = '$Address' WHERE prn = '$prn'")){$ui=$ui+1;}
                    else
                        {$f=$f+1;}
                }else{
                    // Insert member data in the database
                    if($connection->query("INSERT INTO student(prn,Name,Email,mobile,branch,admi_year,Gender,Address) VALUES ('$prn', '$Name','$Email','$mobile','$branch', '$admi_year','$Gender','$Address')"))
                        {$ui=$ui+1;}
                    else
                        {$f=$f+1;}
                }
            }
            // Close opened CSV file
            fclose($csvFile);
            if(($c-$ui)==0)
            {
                //echo "success";
                poutput("Student Data Imported Successfully","student.php?page=Dashboard");
            }
            elseif (($c-$ui)>0 || $f>0) {
                //echo "fail";
                noutput("Some (".$f."-".($c-$ui).") Students Data Might Not Inserted","student.php?page=Dashboard");
            }
            else{
                //echo "fail";
                noutput("Some (".$f."-".($c-$ui).") Students Data Might Not Inserted","student.php?page=Dashboard");
            }            
        }
        else{
            echo "Error";
        }
    }else{
        echo "Invalid file";
    }
}
elseif(isset($_POST['importSubmitMZ'])){
    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');    
    // Validate whether selected file is a CSV file
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)){
        // If the file is uploaded
        if(is_uploaded_file($_FILES['file']['tmp_name']))
        {          
            if ($_POST['cat']=='mg'){$col='magazine';$colc='magazinecopy';}
            elseif($_POST['cat']=='bk'){$col="book";$colc="bookcopy";}
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');            
            // Skip the first line
            fgetcsv($csvFile);
            $c=$i=$f=0;
            // Parse data from CSV file line by line
            while(($line = fgetcsv($csvFile)) !== FALSE)
            {
                $c=$c+1;
                // Get row data
                $name   = trim($line[0]);
                $author  = trim($line[1]);
                $isbn = trim($line[2]);
                $cc = trim($line[3]);
                $addedby = $_SESSION['sn'];
                $result=select("*",$col,"WHERE isbn='$isbn' LIMIT 1");
                $row=mysqli_num_rows($result);
                if($row!=0)
                {
                    $r=mysqli_fetch_assoc($result);
                    $bid=$r['id'];
                    $cp=$y=0;
                    $resultt=select("*",$colc,"WHERE bookid = '$bid'");
                    while($std=mysqli_fetch_assoc($resultt)){$cp=$cp+1;}
                    for ($i=1; $i <=$cc; $i++) 
                    {
                        $copyid=$bid."-".($cp+$i);  
                        $addc="INSERT INTO $colc(bookid,copyid,status) VALUES ('$bid','$copyid',1)";
                        if ($connection->query($addc))
                        {
                            $y=$y+1;
                        }
                    }   
                    if ($y==$cc){$i=$i+1;}
                }
                else
                {
                    $addm="INSERT INTO $col(name,author,addedby,isbn) VALUES ('$name','$author','$addedby','$isbn')";
                    if ($connection->query($addm)) 
                    {
                        $bid= mysqli_insert_id($connection);
                        $y=0;
                        for ($i=1; $i <= $cc; $i++) 
                        { 
                            $copyid=$bid."-".$i;
                            $addc="INSERT INTO $colc(bookid,copyid,status) VALUES ('$bid','$copyid',1)";
                            if ($connection->query($addc))
                            {
                                $y=$y+1;
                            }
                        }
                        if ($y==$cc){$i=$i+1;}
                    }
                }
            }
            // Close opened CSV file
            fclose($csvFile);  
            if(($c-$i)==0)
            {
                //echo "success";
                poutput("$col Data Imported Successfully","$col.php?page=Dashboard");
            }
            else{
                //echo "fail";
                noutput("Some (".$f."-".($c-$i).") $col Data Might Not Inserted","$col.php?page=Dashboard");
            }          
        }
        else{
            echo "Error";
        }
    }else{
        echo "Invalid file";
    }
}
elseif(isset($_POST['importStaff'])){
    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');    
    // Validate whether selected file is a CSV file
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)){
        // If the file is uploaded
        if(is_uploaded_file($_FILES['file']['tmp_name']))
        {            
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');            
            // Skip the first line
            fgetcsv($csvFile);
            $c=$ui=$f=0;
            // Parse data from CSV file line by line
            while(($line = fgetcsv($csvFile)) !== FALSE){
                $c=$c+1;
                // Get row data
                $Name  = $line[0];
                $Email  = $line[2];
                $pass = $line[3];
                $branch = $line[4];
                $mobile = $line[1];
                // Check whether student already exists in the database
                $prevResult = select("Email","staff","WHERE Email = '$Email'");
                if($prevResult->num_rows > 0){
                    // Update student data in the database
                    if($connection->query("UPDATE staff SET Name = '$Name', Email = '$Email', pass = '$pass', branch = '$branch',mobile = '$mobile' WHERE Email = '$Email'")){$ui=$ui+1; echo "s1";}
                    else
                        {$f=$f+1; echo "f1";} echo "s2";
                }else{ echo "f2";
                    // Insert member data in the database
                    if($connection->query("INSERT INTO staff(Name,Email,password,branch,mobile) VALUES ('$Name','$Email','$pass','$branch','$mobile')"))
                        {$ui=$ui+1; echo "s3";}
                    else
                        {$f=$f+1; echo "f3";}
                }
            }
            // Close opened CSV file
            fclose($csvFile);
            if(($c-$ui)==0)
            {
                //echo "success";
                poutput("Staff Data Imported Successfully","staff.php?page=Dashboard");
            }
            elseif (($c-$ui)>0 || $f>0) {
                //echo "fail1";
                noutput("Some (".$f."-".($c-$ui).") staff Data Might Not Inserted","staff.php?page=Dashboard");
            }
            else{
                //echo "fail2";
                noutput("Some (".$f."-".($c-$ui).") staff Data Might Not Inserted","staff.php?page=Dashboard");
            }            
        }
        else{
            echo "Error";
        }
    }else{
        echo "Invalid file";
    }
}