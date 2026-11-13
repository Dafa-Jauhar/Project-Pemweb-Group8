<?php
    include ('connection.php');

    if (!isset($_SESSION['UserID'])){
        header("Location: login.php");
        exit();
    }

    $user_id = $_SESSION['UserID'];
    $role = $_SESSION['Role'];
    $display_name = '';
    $identifier   = '';
    $initials     = '';
    $data         = null;

    if ($role === 'patient') {
    $query = "SELECT * FROM patients WHERE UserID = '$user_id'";
    $result = mysqli_query($connection, $query);

        if ($result && mysqli_num_rows($result) > 0) {
            $data = mysqli_fetch_assoc($result);
            $display_name = $data['PatientName'];
            $identifier = 'RM-' . $data['PatientID'];
            $words = explode(' ', $display_name);
            $initials = mb_substr($words[0], 0, 1) . (isset($words[1]) ? mb_substr($words[1], 0, 1) : '');
            $initials = strtoupper($initials);
        }
    } elseif ($role === 'doctor') {
        $query = "SELECT * FROM doctors WHERE UserID = '$user_id'";
        $result = mysqli_query($connection, $query);
        if ($result && mysqli_num_rows($result) > 0) {
            $data = mysqli_fetch_assoc($result);
            $display_name = $data['DoctorName'];
            $identifier = $data['RegistrationNumber'];
            
            $words = explode(' ', str_replace('dr. ', '', $display_name));
            $initials = mb_substr($words[0], 0, 1) . (isset($words[1]) ? mb_substr($words[1], 0, 1) : '');
            $initials = strtoupper($initials);
        }
    } else {
        $display_name = 'Administrator';
        $identifier = 'ADM';
        $initials = 'AD';
    }
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>ReMeDiVe - <?php echo ucfirst($role) ?></title>
</head>
<body>
    <div class="app-layout">
        <aside class="sidebar">
            <div class="sidebar-brand">
                <img src="assets/image/RedCross.png" alt="ReMeDiVe" style="height: 25px; width:auto;">
                <h2>ReMeDiVe</h2>
                <small><?php echo ($role === 'patient') ? 'Portal pasien' : (($role === 'doctor') ? 'Portal dokter' : 'Portal admin'); ?></small>
            </div>
            <nav class="sidebar-menu">
                <?php 
                    if ($role === 'patient'){ 
                        ?>
                        <a href="patient_dashboard.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'patient_dashboard.php') ? 'active' : ''; ?>">
                            <span>📊 Dashboard</span>
                        </a>
                        <a href="patient_records.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'patient_records.php') ? 'active' : ''; ?>">
                            <span>📁 Rekam medis</span>
                        </a>
                        <a href="patient_profile.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'patient_profile.php') ? 'active' : ''; ?>">
                            <span>👤 Profil saya</span>
                        </a>
                        <?php 
                    } elseif ($role === 'doctor'){ 
                        ?>
                        <a href="doctor_dashboard.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'doctor_dashboard.php') ? 'active' : ''; ?>">
                            <span>📊 Dashboard</span>
                        </a>
                        <a href="doctor_patients.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'doctor_patients.php') ? 'active' : ''; ?>">
                            <span>👥 Daftar pasien</span>
                        </a>
                        <a href="doctor_schedule.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'doctor_schedule.php') ? 'active' : ''; ?>">
                            <span>📅 Jadwal praktik</span>
                        </a>
                        <?php
                    } 
                ?>
            </nav>
            <div class="sidebar-footer-menu">
                <a href="chat.php" class="menu-item <?php echo (basename($_SERVER['PHP_SELF']) == 'chat.php') ? 'active' : ''; ?>">
                    <span>💬 <?php echo ($role === 'patient') ? 'Konsultasi Dokter' : 'Chat Pasien'; ?></span>
                </a>
                <a href="logout.php" class="menu-item logout-item">
                    <span>🚪 Keluar</span>
                </a>
                <div class="copyright-box">
                    <span>&copy; <?php echo date('Y'); ?> ReMeDiVe &bull; V1.0</span>
                </div>
            </div>
        </aside>
        <div class="main-wrapper">
            <header class="top-header">
                <div class="top-header-left">
                    <p>Kesehatan Anda, dalam satu tempat</p>
                </div>
                <div class="top-header-right">
                    <span class="role-badge"><?php echo ($role === 'patient') ? 'Akses pasien' : (($role === 'doctor') ? 'Akses dokter' : 'Akses admin'); ?></span>
                    <div class="user-profile-mini">
                        <span class="user-avatar-small"><?php echo $initials; ?></span>
                        <div class="user-info-text">
                            <span class="u-name"><?php echo htmlspecialchars($display_name); ?></span>
                            <small><?php echo htmlspecialchars($identifier); ?></small>
                        </div>
                    </div>
                </div>
            </header>
        </div>
    </div>
</body>
</html>