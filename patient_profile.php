<?php
    include ('header.php');

    if ($role !== 'patient') {
        header("Location: login.php");
        exit();
    }

    $patient_id = $data ? $data['PatientID'] : 0;

    $age_text = '-';

    if ($data && !empty($data['BirthDate'])) {
        $birth_date_obj = new DateTime($data['BirthDate']);
        $today = new DateTime('today');
        $age = $birth_date_obj->diff($today)->y;
        $age_text = $age . ' tahun';
    }
?>

<main class="main-content">
    <div class="page-header-row">
        <div>
            <h2>Profil Saya</h2>
            <p class="section-desc">Informasi data diri dan riwayat medis Anda dalam sistem.</p>
        </div>
    </div>
    <div class="notice-disclaimer-box">
        <span>!</span>
        <p>Jika ingin melakukan perubahan atau pembaruan data diri, harap hubungi admin rumah sakit.</p>
    </div>
    <div class="card profile-summary-card">
        <div class="profile-avatar-large"><?php echo $initials; ?></div>
        <div class="profile-info-grid">
            <div class="profile-main-data">
                <h3><?php echo htmlspecialchars($display_name); ?></h3>
                <p><?php echo $identifier; ?> · <?php echo ($data && isset($data['Gender']) && $data['Gender'] == 'P') ? 'Perempuan' : 'Laki-laki'; ?></p>
                <p class="birth-text"><?php echo ($data && !empty($data['BirthDate'])) ? date('d M Y', strtotime($data['BirthDate'])) : '-'; ?> · <?php echo $age_text; ?></p>
            </div>
            <div class="profile-col">
                <span class="label">Golongan darah</span>
                <span class="value"><?php echo ($data && !empty($data['BloodType'])) ? htmlspecialchars($data['BloodType']) : '-'; ?></span>
            </div>
            <div class="profile-col">
                <span class="label">Nomor Telepon</span>
                <span class="value"><?php echo ($data && !empty($data['PhoneNumber'])) ? htmlspecialchars($data['PhoneNumber']) : '-'; ?></span>
            </div>
            <div class="profile-col">
                <span class="label">Alergi Obat</span>
                <span class="value warning-tag"><?php echo ($data && !empty($data['Allergy'])) ? htmlspecialchars($data['Allergy']) : 'Tidak ada'; ?></span>
            </div>
        </div>
    </div>
    <div class="card content-card profile-edit-container">
        <div class="card-title-row">
            <h3>Informasi Data Diri</h3>
            <span class="section-sub-info">Data bersumber langsung dari database</span>
        </div>
        <div class="profile-details-view">
            <div class="form-grid-two">
                <div class="form-group">
                    <label class="label">Nama Lengkap</label>
                    <div class="profile-text-static"><?php echo htmlspecialchars($data['PatientName'] ?? '-'); ?></div>
                </div>
                <div class="form-group">
                    <label class="label">NIK (Nomor Induk Kependudukan)</label>
                    <div class="profile-text-static"><?php echo htmlspecialchars($data['NIK'] ?? '-'); ?></div>
                </div>
            </div>
            <div class="form-grid-two">
                <div class="form-group">
                    <label class="label">Email</label>
                    <div class="profile-text-static"><?php echo htmlspecialchars($data['Email'] ?? '-'); ?></div>
                </div>
                <div class="form-group">
                    <label class="label">Nomor Telepon</label>
                    <div class="profile-text-static"><?php echo htmlspecialchars($data['PhoneNumber'] ?? '-'); ?></div>
                </div>
            </div>
            <div class="form-grid-three">
                <div class="form-group">
                    <label class="label">Jenis Kelamin</label>
                    <div class="profile-text-static"><?php echo ($data && isset($data['Gender']) && $data['Gender'] == 'P') ? 'Perempuan' : 'Laki-laki'; ?></div>
                </div>
                <div class="form-group">
                    <label class="label">Tanggal Lahir</label>
                    <div class="profile-text-static"><?php echo ($data && !empty($data['BirthDate'])) ? date('d M Y', strtotime($data['BirthDate'])) : '-'; ?></div>
                </div>
                <div class="form-group">
                    <label class="label">Golongan Darah</label>
                    <div class="profile-text-static"><?php echo htmlspecialchars($data['BloodType'] ?? '-'); ?></div>
                </div>
            </div>
            <div class="form-group">
                <label class="label">Riwayat Alergi Obat</label>
                <div class="profile-text-static"><?php echo htmlspecialchars($data['Allergy'] ?? 'Tidak ada'); ?></div>
            </div>
            <div class="form-group">
                <label class="label">Alamat Lengkap</label>
                <div class="profile-text-static"><?php echo htmlspecialchars($data['Address'] ?? '-'); ?></div>
            </div>
        </div>
    </div>
</main>

<?php
    include ('footer.php');
?>