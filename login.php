<?php
    include ('connection.php');

    $error = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        $username_input = trim($_POST['username']);
        $password_input = trim($_POST['password']);
        $username_input = mysqli_real_escape_string($connection, $username_input);
        $query = "SELECT * FROM users WHERE UserName = '$username_input' OR Email = '$username_input'";
        $result = mysqli_query($connection, $query);

        if ($result && mysqli_num_rows($result) === 1){
            $user = mysqli_fetch_assoc($result);
            
            if ($password_input === $user['Password']){
                $_SESSION['UserID'] = $user['UserID'];
                $_SESSION['UserName'] = $user['UserName'];
                $_SESSION['Role'] = $user['Role'];

                if ($user['Role'] === 'patient'){
                    header("Location: patient_dashboard.php");
                    exit();
                } elseif ($user['Role'] === 'doctor'){
                    header("Location: doctor_dashboard.php");
                } else {
                    $error = "Admin tidak bisa mengakses dashboard.";
                }
            } else {
                $error = "Username atau Password salah!";
            }
        } else {
            $error = "Username atau Password salah!";
        }
    }
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>ReMeDiVe</title>
</head>
<body class="login-body">
    <div class="login-container">
        <div class="login-sidebar">
            <div class="sidebar-header">
                <div class="brand">
                    <img src="assets/image/RedCross.png" alt="ReMeDiVe" class="logo-icon">
                    <span class="brand-name">ReMeDiVe</span>
                </div>
                <div class="hospital-tag">RS SEHAT SENTOSA</div>
            </div>
            <div class="info-card">
                <div class="card-header">
                    <div>
                        <h3>Riwayat yang terhubung</h3>
                        <p>Informasi jelas, perawatan lebih baik</p>
                    </div>
                </div>
                <ul class="feature-list">
                    <li><span class="check-icon">✓</span><strong>Kunjungan & pemeriksaan</strong><br><small>Tersusun dalam satu timeline</small></li>
                    <li><span class="check-icon">✓</span><strong>Diagnosis & resep</strong><br><small>Mudah dibaca dan dipahami</small></li>
                    <li><span class="check-icon">✓</span><strong>Dokumen rekam medis</strong><br><small>Siap dicetak saat Anda perlukan</small></li>
                </ul>
            </div>
        </div>
        <div class="sidebar-footer">
            <span>Data Anda pribadi. Akses sesuai peran.</span>
        </div>
    </div>
    <div class="login-main">
        <div class="top-nav">
            <span class="portal-label">Portal rekam medis</span>
            <a href="#" class="help-link">Butuh bantuan?</a>
        </div>
        <div class="form-container">
            <h2>Selamat datang kembali</h2>
            <p class="form-subtitle">Masuk untuk mengakses rekam medis Anda.</p>
            <?php
                if (!empty($error)){
                    ?>
                    <div class="alert-error"><?php echo $error; ?></div>
                    <?php
                }
            ?>
            <div class="role-selector">
                <button type="button" class="role-btn active" id="btn-patient">
                    <span class="icon">👤</span> Pasien <span class="check">✓</span>
                </button>
                <button type="button" class="role-btn active" id="btn-doctor">
                    <span class="icon">🩺</span> Dokter <span class="check">✓</span>
                </button>
            </div>
            <p class="role-hint" id="role-hint-text">Dokter menggunakan akun yang diberikan rumah sakit.</p>
            <form action="login.php" method="POST">
                <div class="form-group">
                    <label for="username">Email atau nomor rekam medis</label>
                    <div class="input-with-icon">
                        <input type="text" id="username" name="username" placeholder="username@example.com" required>
                        <span class="input-icon">✉️</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Kata sandi</label>
                    <div class="input-with-icon">
                        <input type="password" name="password" id="password" placeholder="********" required>
                        <span class="input-icon">👀</span>
                    </div>
                </div>
                <div class="form-option">
                    <label class="remember-me">
                        <input type="checkbox" name="remember"> Ingat saya
                    </label>
                    <a href="#" class="forgot-password">Lupa kata sandi?</a>
                </div>
                <button type="submit" class="btn-submit-primaty">
                   ➜ Masuk sebagai pasien
                </button>
            </form>
            <div class="register-promt">
                Pasien baru? <a href="register.php">Daftar akun</a>
            </div>
            <div class="privacy-disclaimer">
                Dengan masuk, Anda menyetujui Ketentuan Layanan dan Kebijakan Privasi ReMeDiVe.
            </div>
            <div class="bottom-footer">
                <span>&copy; <?php echo date('Y'); ?> ReMeDiVe &bull; V1.0</span>
            </div>
        </div>
    </div>
</body>
</html>