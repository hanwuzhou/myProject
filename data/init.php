<?php

//$db_host = '127.0.0.1';
//$db_user = 'root';
//$db_password = '';
//$db_database = 'computer';
//$db_port = 3306;
//$db_charset = 'UTF8';
//header('Access-Control-Allow-Origin:http://localhost:3000');
//header('Access-Control-Allow-Credentials:true');
$conn = mysqli_connect(SAE_MYSQL_HOST_M, SAE_MYSQL_USER, SAE_MYSQL_PASS, SAE_MYSQL_DB, SAE_MYSQL_PORT);
mysqli_query($conn, "SET NAMES $db_charset");