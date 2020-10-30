<?php

$server='localhost';
$username='root';
$password='';
$database='personaldairy';


$connection=new mysqli($server,$username,$password,$database);
if($connection->connect_error)
{
	die ("Connection unsuccessfull").connect_error;
}

$sql="delete from AddDairy where date='".$_POST["date"]."'";
if($connection->query($sql)===true)
{
	 echo "1";
	
}
else
{
	 echo "0".$connection->error;
}

$connection->close();


?>
