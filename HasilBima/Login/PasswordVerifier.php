<?php
    $serverName = "MEATJERKY\SQLEXPRESS"; //serverName\instanceName
    
    $connectionInfo = array( "Database"=>"master");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    $channelId = $_POST["idChannel"];
    $myquery = "
      SELECT pass
      FROM Kanal
      WHERE idKanal = ?";
    
    $stmt = sqlsrv_query($conn, $myquery, array( $channelId ));
    if ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
        $realPass = $row["pass"];
    } 
    if ( $realPass == $_POST["pass"]) {
        session_start();
        $_SESSION["channelId"] = $channelId;
        $_SESSION["gambarnya"] = $_POST["gambarnya"];
        $_SESSION["email"] = $_POST["email"];
        echo "<script> window.Location = '../../devi/LandingPage.php'</script>";
    }
?>
<!DOCTYPE html>
<html lang="en">
    <link rel="Stylesheet" href="loginStyles.css" />
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Subscribe</title>
</head>
<body>
  <div class="form-container">
    <h1>Please enter your password</h1>
    <?php
      $imgPath = $_POST["gambarnya"];
      $channelName = $_POST["namaChannel"];
      $pass = $_POST["pass"];
      echo "<img src='$imgPath'><br>";
      echo "<h1>$channelName</h1>";
      echo "";
    ?>
    <form id="trial" action="PasswordVerifier.php" method="POST">
      <input name="pass" type="password" placeholder="your password" required /><br>
      <input type="hidden" name="email" id="email" value="<?php echo $_POST["email"]?>">
      <input type="hidden" name="idChannel" id="idChannel" value="<?php echo $channelId?>">
      <input type="hidden" name="namaChannel" id="namaChannel" value="<?php echo $channelName;?>">
      <input type="hidden" name="gambarnya" id="gambarnya" value = "<?php echo $imgPath?>">  
      <button type="submit">Submit</button>
    </form>
    <?php
    if(!empty($pass)){
        echo "<h1> Wrong Password</h1>";
    }
    ?>
  </div>  

</body>
</html>