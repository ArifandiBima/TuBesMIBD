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
    <div class="logo">
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
          <source src="sample.mp4" type="video/mp4">
          Your browser does not support HTML5 video.
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

      <div class="suggested-video">
        <img src="https://via.placeholder.com/160x90" alt="Thumbnail" />
        <div>
          <p class="title">JavaScript Crash Course</p>
          <p class="views">120K views</p>
        </div>
      </div>

      <div class="suggested-video">
        <img src="https://via.placeholder.com/160x90" alt="Thumbnail" />
        <div>
          <p class="title">Build a Portfolio Website</p>
          <p class="views">95K views</p>
        </div>
      </div>

    </aside>
  </main>

</body>
</html>
