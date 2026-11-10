<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>ReMeDiVe</title>
</head>
<body>
    <header class="website-header">
        <div class="nav-container">
            <div class="logo">
                <a href="index.php">
                    <img src="assets/image/RedCross.png" alt="ReMeDiVe" class="logo-icon">
                    <span>ReMeDiVe</span>
                </a>
            </div>

            <nav class="nav-menu">
                <?php
                    if (isset($_SESSION['UserID'])){
                        if ($_SESSION['Role'] === 'patient'){
                            ?>
                            <a href="patient_dashboard.php">Dashboard</a>
                            <a href="patient_records.php">Rekam Medis</a>
                            <a href="patient_profile.php">Profil Saya</a>
                            <?php
                        } else if ($_SESSION['Role'] === 'doctor'){
                            ?>
                            <a href="doctor_dashboard.php">Dashboard</a>
                            <a href="doctor_patients.php">Rekam Medis</a>
                            <a href="doctor_schedule.php">Jadwal Praktik</a>
                            <?php
                        } ?>
                        <span class="user-greeting">Halo, <strong><?php echo htmlspecialchars($_SESSION['UserName']); ?></strong></span>
                        <a href="logout.php" class="btn-logout">Logout</a>
                        <?php
                    }
                ?> 
            </nav>
        </div>
    </header>
</body>
</html>