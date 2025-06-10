<?php
    $serverName = "MEATJERKY\SQLEXPRESS"; //serverName\instanceName
    
    $connectionInfo = array( "Database"=>"master");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>YouTube Channel Analytics Clone</title>
  <link rel="stylesheet" href="NotifStyles.css" />
  <link rel="stylesheet" href="/devi/landingPageStyles.css" />
</head>
<body>

  <header>
    <div class="logo">
      <a href="/devi/LandingPage.php">
        <img src="/devi/logo_youtube.png" alt="YouTube Logo"/>
      </a>
    </div>
    <div class="search-bar">
      <input type="text" placeholder="Search"/>
      <a href="">
        <img src="/devi/search_icon.png" alt="Search Icon"/>
      </a>
    </div>
    <div class="actions">
      <a href="/HasilBima/Notif/NotifReject.php">
        <img src="/devi/notif-icon.png" alt="Notifications" />
      </a>
      <div class="profile-circle">
        
        <a href="<?php if (!isset($_SESSION["email"])) echo "/HasilBima/Login/EmailRequest.php"; else echo "/Eric/Profile/Profile.php"?>">A</a>
      </div>
    </div>
  </header>

  <div class="channel-banner"></div>

  <section class="channel-info">
    <img src="<?php echo $_SESSION["gambarnya"]?>" alt="Channel Avatar" />
    <div class="text">
      <h2>
      <?php

      ?>
      </h2>
      <p>Notifications</p>
    </div>
  </section>

    <section class="Notifs">
      <h2>Notification</h2>

      <div class="video-card">
        <img src="https://via.placeholder.com/160x90" alt="Video Thumbnail" />
        <div class="video-info">
          <h4>How to Clone YouTube in HTML & CSS</h4>
          <p>123K views • 10K watch time hrs</p>
        </div>
      </div>

    </section>
  </main>

</body>
</html>
