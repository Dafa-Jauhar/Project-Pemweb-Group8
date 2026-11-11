<?php
    include ('connection.php');

    $error = '';
    $success = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        $username = trim($_POST['username']);
        $email = trim($_POST['email']);
        $password = $_POST['password'];
        $confirm_password =$_POST['confirm_password'];
        $patient_name = trim($_POST['patient_name']);
        $nik = trim($_POST['nik']);
        $phone_number = trim($_POST['phone_number']);
        $blood_type = trim($_POST['blood_type']);
        $gender = trim($_POST['gender']);
        $birth_date = trim($_POST['birth_date']);
        $address = trim($_POST['address']);
        $medical_record = trim($_POST['medical_record']);

        if ($password !== $confirm_password){
            $error = "Konfirmasi kata sandi tidak cocok.";
        } else {
            $username = mysqli_real_escape_string($connection, $username);
            $email = mysqli_real_escape_string($connection, $email);
            $patient_name = mysqli_real_escape_string($connection, $patient_name);
            $nik = mysqli_real_escape_string($connection, $nik);
            $phone_number = mysqli_real_escape_string($connection, $phone_number);
            $blood_type = mysqli_real_escape_string($connection, $blood_type);
            $address = mysqli_real_escape_string($connection, $address);
            $medical_record = mysqli_real_escape_string($connection, $medical_record);

            $check_query = "SELECT * FROM users WHERE UserName = '$username' OR Email = '$email'";
            $check_result = mysqli_query($connection, $check_query);

            if (mysqli_num_rows($check_result) > 0){
                $error = "Username atau Email sudah digunakan.";
            } else {
                mysqli_begin_transaction($connection);
                try {
                    $query_user = "INSERT INTO users (UserName, Email, Password, Role) VALUES ('$username','$email','$password','patient')";

                    if (!mysqli_query($connection, $query_user)){
                        throw new Exception("Gagal mendaftarkan akun pengguna.");
                    }

                    $user_id = mysqli_insert_id($connection);
                    $linked_patient = false;

                    if (!empty($medical_record)){
                        $patient_id_target = preg_replace('/[^0-9]/','',$medical_record);

                        if (!empty($patient_id_target)){
                            $q_check_pat = "SELECT * FROM patients WHERE PatientID = '$patient_id_target' AND UserID IS NULL";
                            $res_check_pat = mysqli_query($connection, $q_check_pat);

                            if ($res_check_pat && mysqli_num_rows($res_check_pat) === 1){
                                $query_update_patient = "UPDATE patients SET UserID = '$user_id', Email = '$email', PhoneNumber = '$phone_number', WHERE PatientID = '$patient_id_target'";

                                if (mysqli_query($connection, $query_update_patient)){
                                    $linked_patient = true;
                                }
                            }
                        }
                    }

                    if (!$linked_patient){
                        $query_patient = "INSERT INTO patients (PatientName, NIK, Email, BloodType, Address, Gender, BirthDate, UserID) VALUES ('$patient_name','$nik','$email','$blood_type','$address','$gender','$birth_date','$user_id')";

                        if (!mysqli_query($connection, $query_user)){
                            throw new Exception("Gagal menyimpan data profil pasien.");
                        }
                    }   

                    mysqli_commit($connection);
                    $success = "Registrasi berhasil! Silahkan <a href='login.php'>login di sini</a>.";
                } catch (Exception $e) {
                    mysqli_rollback($connection);
                    $error = "Terjadi kesahalan: " . $e->getMessage();
                }
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>ReMeDiVe</title>
</head>
<body class="register-body">
    <div class="register-container">
        <div class="register-sidebar">
            <div class="sidebar-header">
                <div class="brand">
                    <img src="assets/image/RedCross.png" alt="ReMeDiVe" class="logo-icon">
                    <span>ReMeDiVe</span>
                </div>
            </div>
            <div class="sidebar-content">
                <h1>Langkah awal untuk perawatan yang terhubung.</h1>
                <p class="subtitle">Buat akun pasien untuk melihat riwayat kunjungan dan menyimpan dokumen kesehatan Anda.</p>
                <div class="feature-steps">
                    <div class="step-items">
                        <span class="step-icon">👤</span>
                        <div>
                            <h3>Lengkapi identitas</h3>
                            <p>Gunakan data sesuai identitas</p>
                        </div>
                    </div>
                    <div class="step-items">
                        <span class="step-icon">✉️</span>
                        <div>
                            <h3>Verifikasi akun</h3>
                            <p>Tautan verifikasi dikirim melalui email.</p>
                        </div>
                    </div>
                    <div class="step-items">
                        <span class="step-icon">📂</span>
                        <div>
                            <h3>Akses rekam medis</h3>
                            <p>Data terhubung setelah verifikasi petugas.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sidebar-footer">
                <div class="security-note">
                    <span>🔒</span>
                    <p>Informasi kesehatan hanya dapat diakses oleh Anda dan tenaga medis yang berwenang.</p>
                </div>
            </div>
        </div>
        <div class="register-main">
            <div class="top-nav">
                <a href="login.php" class="back-link">← Kembali ke halaman masuk</a>
            </div>
            <div class="form-container">
                <div class="form-header-row">
                    <div>
                        <h2>Daftar akun pasien</h2>
                        <p class="form-subtitle">Sudah pernah berobat? Gunakan identitas yang terdaftar di rumah sakit.</p>
                    </div>
                    <span class="required-note">* Wajib diisi</span>
                </div>
                <?php
                    if (!empty($error)){
                        ?>
                        <div class="alert-error"><?php echo $error; ?></div>
                        <?php
                    }
                ?>
                <?php
                    if (!empty($success)){
                        ?>
                        <div class="alert-success"><?php echo $success; ?></div>
                        <?php
                    }
                ?>
                <form action="register.php" method="POST">
                    <h3 class="section-title">Informasi Akun</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="username">Username *</label>
                            <input type="text" name="username" id="username" placeholder="Buat username unik" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email *</label>
                            <input type="email" name="email" id="email" placeholder="username@example.com" required>
                        </div>
                    </div>
                    <h3 class="section-title">Informasi Pribadi</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="patient_name">Nama Lengkap *</label>
                            <input type="text" name="patient" id="patient" placeholder="Slamet Kopling">
                        </div>
                        <div class="form-group">
                            <label for="nik">NIK *</label>
                            <input type="text" name="nik" id="nik" maxlength="16" placeholder="Masukkan 16 digit NIK" required>
                        </div>
                    </div>                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="birth_date">Tanggal lahir *</label>
                            <input type="date" name="birth_date" id="birth_date" required>
                        </div>
                        <div class="form-group">
                            <label for="gender">Jenis Kelamin *</label>
                            <select name="gender" id="gender" required>
                                <option value="">Pilih jenis kelamin</option>
                                <option value="P">Perempuan</option>
                                <option value="L">Laki-laki</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="phone_number">Nomor telepon *</label>
                            <input type="text" name="phone_number" id="phone_number" placeholder="Masukkan nomor telepon aktif" required>
                        </div>
                        <div class="form-group">
                            <label for="blood_type">Golongan darah</label>
                            <select name="blood_type" id="blood_type">
                                <option value="">Pilih Golongan Darah</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group full-width">
                        <label for="medical_record">Nomor rekam medis (opsional)</label>
                        <input type="text" name="medical_record" id="medical_record" placeholder="RM-2026-121212">
                        <small class="input-hint">Tercantum pada kartu pasien. Kosongkan jika belum pernah berobat.</small>
                    </div>
                    <div class="form-group full-width">
                        <label for="address">Alamat lengkap *</label>
                        <textarea name="address" id="address" rows="3" placeholder="Masukkan alamat tempat tinggal saat ini" required></textarea>
                    </div>
                    <h3 class="section-title">Keamanan Akun</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">Kata sandi *</label>
                            <input type="password" name="password" id="password" placeholder="********" required>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password">Konfirmasi kata sandi *</label>
                            <input type="password" name="confirm_password" id="confirm_password" placeholder="********" required>
                        </div>
                    </div>
                    <small class="input-hint">Minimal 8 karakter, dengan kombinasi huruf besar, huruf kecil, dan angka.</small>
                    <div class="info-banner">
                        <span>🛡️</span>
                        <p>Identitas Anda akan diverifikasi sebelum rekam medis ditampilkan. Kami tidak membagikan data kesehatan untuk keperluan pemasaran</p>
                    </div>
                    <div class="form-group checkbox-group">
                        <label>
                            <input type="checkbox" required> Saya menyetujui Ketentuan Layanan dan Kebijakan Privasi, serta pemrosesan data pribadi untuk pelayanan dan akses rekam medis. *
                        </label>
                    </div>
                    <button type="submit" class="btn-submit-primary">
                        ➜ Buat akun pasien
                    </button>
                </form>
                <div class="doctor-notice">
                    Akun dokter dikelola oleh administrator rumah sakit.
                </div>
            </div>
            <div class="bottom-footer">
                <span>&copy; <?php echo date('Y'); ?> ReMeDiVe &bull; V1.0</span>
            </div>
        </div>
    </div>
</body>
</html>