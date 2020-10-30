<?php

$server='localhost';
$username='root';
$password='';
$database='personaldairy';
$connection=new mysqli($server,$username,$password,$database);
if($connection->connect_error){
	
	die("connection unsuccessfull ".connect_error);
	
}


$sql="insert into AddDairy(date,title,message)values('".$_POST["Date"]."','".$_POST["Title"]."','".$_POST["Message"]."')";
			 
if($connection->query($sql)===true){
	
	echo "1";
}
else{
	
	echo "0";
}

$connection->close();
?>