<?php

$connect = mysqli_connect("localhost", "root", "", "rumah_sakit_web");

if(!($connect)){
  die ("Koneksi Terputus" . mysqli_connect_error());
}
