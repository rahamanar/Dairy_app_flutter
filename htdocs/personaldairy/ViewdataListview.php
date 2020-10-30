<?php
$server='localhost';
$username='root';
$password='';
$database='personaldairy';
$connection=new mysqli($server,$username,$password,$database);
if($connection->connect_error){
	die("connection unsuccessfull ".connect_error);
}
$sql="select * from AddDairy";
$res=$connection->query($sql);
if($res->num_rows>0){
	while($row=$res->fetch_assoc())
	{
		
	$resultArray[]=$row;
	$json=json_encode($resultArray);
}

	echo $json;
}
else{	
	echo "0";
}
?>

  



