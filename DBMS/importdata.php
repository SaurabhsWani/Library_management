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
                $result=select("*","magazine","WHERE name LIKE '%$name%' ");
                $row=mysqli_num_rows($result);
                $resultt=select("id","magazine","WHERE name LIKE '%$name%' LIMIT 1");
                $std=mysqli_fetch_assoc($resultt);
                if($row!=0){
                    $copyid=$std['id']."-".($row+1);
                }
                else
                {
                    $result=select("id","magazine","");
                    while($std=mysqli_fetch_assoc($result))
                    {
                        $copyid=($std['id']+1)."-1";
                    }
                }
                $add1="INSERT INTO magazine(name,author,copyid) VALUES ('$name','$author','$copyid')";
                if ($connection->query($add1)) 
                {$i=$i+1;}
                else
                {$f=$f+1;}
            }
            // Close opened CSV file
            fclose($csvFile);
            if(($c-$i)==0)
            {
                //echo "success";
                poutput("Magzine Data Imported Successfully","magazine.php?page=Dashboard");
            }
            elseif (($c-$i)>0 || $f>0) {
                //echo "fail";
                noutput("Some (".$f."-".($c-$i).") Magzine Data Might Not Inserted","magazine.php?page=Dashboard");
            }
            else{
                //echo "fail";
                noutput("Some (".$f."-".($c-$i).") Magzine Data Might Not Inserted","magazine.php?page=Dashboard");
            }            
        }
        else{
            echo "Error";
        }
    }else{
        echo "Invalid file";
    }
}