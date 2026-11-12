<?php
    include ('connection.php');

    if (!isset($_SESSION['UserID'])){
        header("Location: login.php");
        exit();
    }

    $user_id = $_SESSION['UserID'];
    $role = $_SESSION['Role'];
    $username = $_SESSION['UserName'];

    if ($role === 'patient'){
        $query = "SELECT * FROM patients WHERE UserID = '$user_id'";
        $result = mysqli_query($connection, $query);
        $data = mysqli_fetch_assoc($result);
        $display_name = $data ? $data['PatientName'] : $username;
        $identifier = $data ? "RM-2026-" . str_pad($data['PatientID'], 6, '0', STR_PAD_LEFT) : "RM-2026-000000";
        $portal_title = "Portal pasien";
        $tagline = "Kesehatan Anda, dalam satu tempat";
    } elseif ($role === 'doctor'){
        $query = "SELECT * FROM doctors WHERE UserID = '$user_id'";
        $result = mysqli_query($connection, $query);
        $data = mysqli_fetch_assoc($result);
        $display_name = $data ? $data['DoctorName'] : $username;
        $identifier = $data ? $data['Speciality'] : "Dokter Spesialis";
        $portal_title = "Ruang kerja dokter";
        $tagline = "Ruang kerja dokter";
    }

    $words = explode(' ', trim($display_name));
    $initials = strtoupper(substr($words[0],0,1) . (isset($words[1]) ? substr($words[1], 0, 1) : ''));
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>ReMeDiVe - <?php echo ucfirst($role) ?></title>
</head>
<body class="dashboard-body">
    <header class="top-navbar">
        <div class="nav-left">
            <div class="brand">
                <img src="assets/image/RedCross.png" alt="ReMeDiVe" class="logo-icon">
                <span class="brand-name">ReMeDiVe</span>
            </div>
            <span class="nav-divider">|</span>
            <span class="nav-tagline"><?php echo $tagline ?></span>
        </div>
        <div class="nav-right">
            <span class="access-badge"><?php echo ($role === 'patient') ? 'Akses pasien' : 'Akses dokter'; ?></span>
            <button class="icon-btn" title="Notfikasi">🔔</button>
            <div class="user-profile-mini">
                <div class="avatar-circle"><?php echo $initials; ?></div>
                <div class="user-meta">
                    <span class="user-fullname"><?php echo htmlspecialchars($display_name); ?></span>
                    <span class="user-rm"><?php echo $identifier; ?></span>
                </div>
                <span class="dropdown-arrow">V</span>
            </div>
        </div>
    </header>
    <div class="app-layout">
        <aside class="sidebar">
            <div class="sidebar-hospital-info">
                <span class="hospital-title">RS Sehat Sentosa</span>
                <span class="portal-subtitle"><?php echo $portal_title; ?></span>
            </div>
            <nav class="sidebar-menu">
                <?php
                    if($role === 'patient'){ ?>
                        <a href="patient_dashboard.php" class="menu-item <?php echo basename($_SERVER['PHP_SELF']) == 'patient_dashboard.php' ? 'active' : '' ?>">
                            <span class="menu-icon">🪟</span> Dashboard
                        </a>
                        <a href="patient_records.php" class="menu-item <?php echo basename($_SERVER['PHP_SELF'] == 'patient_records.php' ? 'active' : ''); ?>">
                            <span class="menu-icon">📁</span> Rekam medis
                        </a>
                        <a href="patient_profile.php" class="menu-item <?php echo basename($_SERVER['PHP_SELF'] == 'patient_profile.php' ? 'active' : ''); ?>">
                            <span class="menu-icon">👤</span> Profil saya
                        </a>
                    <?php
                    } elseif ($role === 'doctor'){
                        ?>
                        <a href="doctor_dashboard.php" class="menu-item <?php echo basename($_SERVER['PHP_SELF']) == 'doctor_dashboard.php' ? 'active' : '' ?>">
                            <span class="menu-icon">🪟</span> Dashboard
                        </a>
                        <a href="doctor_patients.php" class="menu-item <?php echo basename($_SERVER['PHP_SELF'] == 'doctor_patients.php' ? 'active' : ''); ?>">
                            <span class="menu-icon">👥</span> Daftar pasien
                        </a>
                        <a href="doctor_schedule.php" class="menu-item <?php echo basename($_SERVER['PHP_SELF'] == 'doctor_schedule.php' ? 'active' : ''); ?>">
                            <span class="menu-icon">📅</span> Jadwal praktik
                        </a>
                        <?php
                    }
                ?>
            </nav>
            <div class="sidebar-bottom">
                <div class="help-box">
                    <span class="help-icon">?</span>
                    <div class="help-text">
                        <strong>Butuh bantuan?</strong>
                        <p>Tim rumah sakit siap membantu Anda.</p>
                        <a href="#" class="help-link-action">Hubungi petugas ↗</a>
                    </div>
                </div>
                <a href="logout.php" class="logout-btn">
                    <span class="logout-icon">←</span> Keluar
                </a>
            </div>
        </aside>
    </div>
</body>
</html>