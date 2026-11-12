<?php
    date_default_timezone_set('Asia/Jakarta');

    $DayList = array(
        'Sunday' => 'Minggu',
        'Monday' => 'Senin',
        'Tuesday' => 'Selasa',
        'Wednesday' => 'Rabu',
        'Thursday' => 'Kamis',
        'Friday' => 'Jumat',
        'Saturday' => 'Sabtu'
    );

    $MonthList = array(
    'January'   => 'Januari',
    'February'  => 'Februari',
    'March'     => 'Maret',
    'April'     => 'April',
    'May'       => 'Mei',
    'June'      => 'Juni',
    'July'      => 'Juli',
    'August'    => 'Agustus',
    'September' => 'September',
    'October'   => 'Oktober',
    'November'  => 'November',
    'December'  => 'Desember'
    );

    $hari_inggris  = date('l');
    $bulan_inggris = date('F');
    $hari_indo  = $DayList[$hari_inggris];
    $bulan_indo = $MonthList[$bulan_inggris];
    $tanggal_sekarang = $hari_indo . ', ' . date('d') . ' ' . $bulan_indo . ' ' . date('Y');
?>