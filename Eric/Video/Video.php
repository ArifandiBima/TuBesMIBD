<?php
    session_start();
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
  <title>Video Watch Page</title>
  <link rel="stylesheet" href="videoStyles.css" />
</head>
<body>

<header>
    <div class="logo" href="/devi/LandingPage.php">
      <a href="">
        <img src="/devi/logo_youtube.png" alt="YouTube Logo" />
      </a>
    </div>
    <div class="search-bar">
      <input type="text" placeholder="Search" />
      <a href="">
        <img src="/devi/search_icon.png" alt="Search Icon" />
      </a>
    </div>
    <div class="actions">
      <a href="">
        <img src="/devi/notif-icon.png" alt="Notifications" />
      </a>
      <div class="profile-circle">
        <a href="">A</a>
      </div>
    </div>
  </header>

  <main class="video-page">
    <!-- Main Video and Info -->
    <div class="video-main">
      <div class="video-player">
        <video controls>
          <source src="<?php $_GET("idVideo")?>" type="video/mp4">
        </video>
      </div>

      <!-- Uploader Info -->
      <div class="uploader-info">
        <img src="https://via.placeholder.com/50" alt="Uploader Logo" />
        <div>
          <h4>Channel Name</h4>
          <button class="subscribe">Subscribe</button>
        </div>
      </div>

      <!-- Video Title -->
      <h2 class="video-title">How to Clone YouTube in HTML & CSS</h2>

      <!-- Actions -->
      <div class="video-actions">
        <button>👍 Like</button>
        <button>👎 Dislike</button>
        <button>💬 Comment</button>
      </div>
    </div>

    <!-- Sidebar -->
    <aside class="video-sidebar">
      <h3>Up Next</h3>

      <div class="suggested-video">
        <img src="https://via.placeholder.com/160x90" alt="Thumbnail" />
        <div>
          <p class="title">Learn CSS Grid Fast</p>
          <p class="views">80K views</p>
        </div>
      </div>

      <?php
      ?>

    </aside>
  </main>

</body>
</html>
