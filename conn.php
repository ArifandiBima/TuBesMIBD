<!DOCTYPE HTML>
<html>
<body>

<?php
     $serverName = "MEATJERKY\SQLEXPRESS"; //serverName\instanceName

     $connectionInfo = array( "Database"=>"master");
     $conn = sqlsrv_connect( $serverName, $connectionInfo);

     if( $conn ) {
          echo "Connection established.<br />";
     }else{
          echo "Connection could not be established.<br />";
          die( print_r( sqlsrv_errors(), true));
     }
?>

</body>
</html>