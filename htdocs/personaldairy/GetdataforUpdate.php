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

$sql="select * from AddDairy where date='".$_POST["date"]."'";
$res=$connection->query($sql);
if($res->num_rows>0){
	if($row=$res->fetch_assoc())
	{
/* 	$resultName=$row["title"];
	$resultTitle=$row["message"];
	echo $resultName."@".$resultTitle; */
	//changed code for flutter use....
	
	$json=json_encode($row);
	echo $json;
	}
}
else
{
	 echo "0";
}

$connection->close();


?>
