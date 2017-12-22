<?php
header("Content-Type:application/json");
    require_once("../init.php");
    global $conn;
	@$kw=$_REQUEST["term"];
	$kw=urldecode($kw);
	$sql="select lid,title,sold_count from pc_laptop ";
	if($kw){
		$kws=explode(" ",$kw);
		for($i=0;$i<count($kws);$i++){
			$kws[$i]=" title like '%".$kws[$i]."%' ";
		}
		$sql.=" where ".implode(" and ",$kws);
	}
	$sql.=" order by sold_count DESC limit 10";
	$result=mysqli_query($conn,$sql);
	echo json_encode(mysqli_fetch_all($result,1));