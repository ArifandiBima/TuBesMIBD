<?php
    $serverName = "MEATJERKY\SQLEXPRESS"; //serverName\instanceName
    
    $connectionInfo = array( "Database"=>"master");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    $imgSrc = "default.jpg";
    if (isset($_SESSION)) {
      $imgSrc = $_SESSION["gambarnya"];
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>YouTube UI</title>
  <link rel="stylesheet" href="landingPageStyles.css"/>
</head>
<body>
  <header>
    <div class="logo">
      <a href="">
        <img src="<?php echo $imgSrc ?>" alt="YouTube Logo"/>
      </a>
    </div>
    <div class="search-bar">
      <input type="text" placeholder="Search"/>
      <a href="">
        <img src="search_icon.png" alt="Search Icon"/>
      </a>
    </div>
    <div class="actions">
      <a href="">
        <img src="notif-icon.png" alt="Notifications" />
      </a>
      <div class="profile-circle">
        <a href="../HasilBima/Login/EmailRequest.php">A</a>
      </div>
    </div>
  </header>

  <main>
    <div class="video">
      <div class="thumbnail">
        <a href="page1.html">
          <img src="thumbnail1.webp" alt="Thumbnail 1" />
        </a>
      </div>
      <div class="video-title">Title 1</div>
    </div>
    <?php 
    $myquery = "
      SELECT TOP 3 idVideo, judul, thumbnail
      FROM Video
      WHERE isPublished =1";
    
    $stmt = sqlsrv_query($conn, $myquery, array( $channelId ));
    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
        $idVideo = $row["idVideo"];
        $thumb = $row["thumbnail"];
        $title = $row["title"];
        echo "<div class='video'>
        <div class='thumbnail'>
        <a href= '../Eric/Video.html?$idVideo'>
          <img src='$thumb'/>
        </a>
        </div>
        <div class='video-title'>$title</div>
        </div>";
    }
    ?>
  </main>
</body>
</html>
