<!DOCTYPE html>
<html lang="en">
    <link rel="Stylesheet" href="loginStyles.css" />
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Subscribe</title>
  <?php
  
  ?>
</head>
<body>
  
    <?php
        if (!isset($_Session)){
            echo "<h1'> please login first</h1>";
        }
        else{
            header("Location: Notif.php");
        }

    ?>

</body>