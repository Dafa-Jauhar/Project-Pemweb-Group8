<?php
    $hostname = "localhost";
    $username = "root";
    $password = "";
    $database = "rumah_sakit_web";

    $connection = new mysqli($hostname, $username, $password, $database);

    if(!($connection)){
        die ("Koneksi Terputus" . mysqli_connect_error());
    }
?>