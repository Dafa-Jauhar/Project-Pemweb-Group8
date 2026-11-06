<?php
    $menu_items = [
        'index.php' => 'Beranda',
        'about.php' => 'Tentang Kami',
    ];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Header</title>
</head>
<body>
    <header class="main-header">
        <div class="header-container">

            <!-- Logo plus nama di sini yakkkkk -->
            <div class="logo-container">
                <a href="index.php" class="logo">
                    <img src="assets/image/RedCross.png" alt="Red Cross" class="logo-img">
                </a>
                <div class="web-name">
                    <span>REMEDIVE (Rekam Medis Digital Veteran)</span>
                    <span>Klinik UPN "Veteran" Yogyakarta</span>
                </div>
            </div>

            <!-- Menu navigasi di sini yhh -->
            <nav class="nav-menu">
                <ul>
                    <?php foreach($menu_items as $url => $label): ?>
                    <li>
                        <a href="<?= $url; ?>" class="<?= (isset($page) && $page == $url) ? 'active' : ''; ?>">
                            <?= $label; ?>
                        </a>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </nav>

        </div>
    </header>
</body>
</html>