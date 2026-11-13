<?php
    include ('header.php');
    include ('timezone.php');

    if ($role !== 'doctor') {
        header("Location: login.php");
        exit();
    }

    $doctor_id = $data ? $data['DoctorID'] : 0;
    $doctor_name = $data ? $data['DoctorName'] : 'Dokter';
    $speciality = $data ? $data['Speciality'] : 'Umum';
    $hour = (int)date('G');

    if ($hour < 11) {
        $greeting = "Selamat pagi";
    } elseif ($hour < 15) {
        $greeting = "Selamat siang";
    } elseif ($hour < 18) {
        $greeting = "Selamat sore";
    } else {
        $greeting = "Selamat malam";
    }

    $q_today = "SELECT COUNT(*) as total FROM medical_examinations WHERE DoctorID = '$doctor_id'";
    $res_today = mysqli_query($connection, $q_today);
    $row_today = mysqli_fetch_assoc($res_today);
    $total_patients_today = $row_today['total'] ?? 0;
    $q_completed = "SELECT COUNT(*) as total FROM medical_examinations WHERE DoctorID = '$doctor_id' AND status = 'Accepted'";
    $res_completed = mysqli_query($connection, $q_completed);
    $row_completed = mysqli_fetch_assoc($res_completed);
    $total_completed = $row_completed['total'] ?? 0;
    $total_review = max(0, $total_patients_today - $total_completed);
    $patients_list = [];
    $q_patients = "SELECT m.*, p.PatientName, p.PatientID, p.NIK FROM medical_examinations m JOIN patients p ON m.PatientID = p.PatientID WHERE m.DoctorID = '$doctor_id' ORDER BY m.Examination_date DESC LIMIT 10";
    $res_patients = mysqli_query($connection, $q_patients);

    if ($res_patients) {
        while ($p_row = mysqli_fetch_assoc($res_patients)) {
            $patients_list[] = $p_row;
        }
    }

    $q_last = "SELECT m.*, p.PatientName, p.PatientID FROM medical_examinations m JOIN patients p ON m.PatientID = p.PatientID WHERE m.DoctorID = '$doctor_id' ORDER BY m.Examination_date DESC LIMIT 1";
    $res_last = mysqli_query($connection, $q_last);
    $last_access = ($res_last && mysqli_num_rows($res_last) > 0) ? mysqli_fetch_assoc($res_last) : null;
?>

<main class="main-content">
    <div class="doctor-welcome-row">
        <div>
            <h2><?php echo $greeting; ?>, <?php echo htmlspecialchars($doctor_name); ?></h2>
            <p class="section-desc"><?php echo $tanggal_sekarang; ?> - Berikut ringkasan pelayanan Anda.</p>
        </div>
        <div class="practice-schedule-badge">
            <span>Poli <?php echo htmlspecialchars($speciality); ?> · 08.00-12.00</span>
        </div>
    </div>
    <div class="doctor-metrics-grid">
        <div class="card metric-card">
            <div class="metric-info">
                <span class="metric-title">Pasien hari ini</span>
                <h3 class="metric-value"><?php echo $total_patients_today; ?></h3>
                <small class="metric-note">Total dalam sistem</small>
            </div>
            <div class="metric-icon-box">👥</div>
        </div>
        <div class="card metric-card">
            <div class="metric-info">
                <span class="metric-title">Pemeriksaan selesai</span>
                <h3 class="metric-value"><?php echo $total_completed; ?></h3>
                <small class="metric-note">Status diterima</small>
            </div>
            <div class="metric-icon-box">📋</div>
        </div>
        <div class="card metric-card">
            <div class="metric-info">
                <span class="metric-title">Catatan perlu ditinjau</span>
                <h3 class="metric-value"><?php echo $total_review; ?></h3>
                <small class="metric-note">Prioritas hari ini</small>
            </div>
            <div class="metric-icon-box">⚠️</div>
        </div>
    </div>
    <div class="card content-card">
        <div class="card-title-row">
            <div>
                <h3>Daftar pasien</h3>
                <p class="section-desc">Pasien dalam lingkup perawatan Anda.</p>
            </div>
            <span class="section-sub-info">Menampilkan riwayat dari database</span>
        </div>
        <div class="table-filter-toolbar">
            <div class="search-box-wrapper">
                <span class="search-icon">🔍</span>
                <input type="text" class="form-control" placeholder="Cari nama pasien atau nomor rekam medis..." readonly>
            </div>
            <div class="filter-actions-group">
                <button type="button" class="btn-filter-dropdown">▼ Semua kondisi</button>
                <button type="button" class="btn-filter-dropdown">📋 Kunjungan terbaru</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>PASIEN / NO. REKAM MEDIS</th>
                        <th>KUNJUNGAN TERAKHIR</th>
                        <th>KONDISI UTAMA</th>
                        <th>STATUS</th>
                        <th>AKSI</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        if (!empty($patients_list)){ 
                            foreach ($patients_list as $pat){
                                ?>
                                <tr>
                                    <td>
                                        <div class="patient-table-identity">
                                            <span class="table-avatar-badge"><?php echo strtoupper(mb_substr($pat['PatientName'], 0, 2)); ?></span>
                                            <div>
                                                <strong><?php echo htmlspecialchars($pat['PatientName']); ?></strong>
                                                <small>RM-2026-<?php echo str_pad($pat['PatientID'], 6, '0', STR_PAD_LEFT); ?></small>
                                            </div>
                                        </div>
                                    </td>
                                    <td><?php echo date('d M Y', strtotime($pat['Examination_date'])); ?></td>
                                    <td><?php echo htmlspecialchars($pat['Diagnosis'] ?? 'Pemeriksaan Umum'); ?></td>
                                    <td>
                                        <span class="status-pill <?php echo ($pat['status'] === 'Accepted') ? 'status-accepted' : 'status-pending'; ?>">
                                            <?php echo ($pat['status'] === 'Accepted') ? 'Selesai' : 'Kontrol rutin'; ?>
                                        </span>
                                    </td>
                                    <td>
                                        <a href="doctor_patients.php?id=<?php echo $pat['PatientID']; ?>" class="table-action-link">Buka ↗</a>
                                    </td>
                                </tr>
                                <?php 
                            } 
                        } else{
                            ?>
                            <tr>
                                <td colspan="5" class="text-center">Belum ada data pasien dalam perawatan.</td>
                            </tr>
                            <?php
                        }
                    ?>
                </tbody>
            </table>
        </div>
        <div class="table-footer-row">
            <span class="table-footer-note">Identitas pasien disamarkan pada tampilan contoh ini.</span>
            <div class="pagination-controls">
                <button type="button" class="page-btn" disabled>Sebelumnya</button>
                <button type="button" class="page-btn active-page">1</button>
                <button type="button" class="page-btn">Berikutnya</button>
            </div>
        </div>
    </div>
    <div class="dashboard-bottom-grid">
        <div class="card last-access-card">
            <h4>Terakhir Anda akses</h4>
            <?php 
                if ($last_access){
                    ?>
                    <div class="last-access-item">
                        <div class="access-icon">🕒</div>
                        <div>
                            <strong><?php echo htmlspecialchars($last_access['PatientName']); ?></strong>
                            <small>RM-2026-<?php echo str_pad($last_access['PatientID'], 6, '0', STR_PAD_LEFT); ?> · Dibuka <?php echo date('d M Y, H:i', strtotime($last_access['Examination_date'])); ?></small>
                        </div>
                        <a href="doctor_patients.php?id=<?php echo $last_access['PatientID']; ?>" class="link-action-inline">Lihat rekam medis</a>
                    </div>
                    <?php
                } else {
                    ?>
                    <p class="section-desc">Belum ada riwayat akses rekam medis.</p>
                    <?php 
                }
            ?>
        </div>
        <div class="card security-notice-card">
            <div class="security-notice-header">
                <span>🛡️</span>
                <strong>Setiap akses tercatat</strong>
            </div>
            <p class="section-desc">Gunakan informasi pasien hanya untuk kebutuhan pelayanan. Pastikan identitas pasien sebelum menambah atau mengubah catatan.</p>
        </div>
    </div>
</main>

<?php
    include ('footer.php');
?>