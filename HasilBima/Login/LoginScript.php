<?php
    require '../conn.php';
    function getAccounts($email){
        $myquery = "
            SELECT gambar, nama
            FROM Kanal
            Where idKanal = (
                SELECT idKanalPribadi
                FROM pengguna
                WHERE email = 
        " + $email+ "
                )
        ";
        $result = $conn->query($myquery);
        if ($result->num_rows > 0){
            echo $result["gambar"], $result["nama"]
        }
    }

    
?>
