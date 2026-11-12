<?php
    include ('header.php');
    include ('timezone.php');

    if ($role !== 'patient'){
        header("Location: login.php");
        exit();
    }

    $patient_id = $data ? $data['PatientID'] : 0;
    $age_text = '-';

    if ($data && !empty($data['BirthDate'])) {
        $birth_date = new DateTime($data['BirthDate']);
        $today = new DateTime('today');
        $age = $birth_date->diff($today)->y;
        $age_text = $age . ' tahun';
    }

    $query_stats = "SELECT COUNT(*) as total_visits, MIN(Examination_date) as first_visit FROM medical_examinations WHERE PatientID = '$patient_id'";
    $result_stats = mysqli_query($connection, $query_stats);
    $stats = mysqli_fetch_assoc($result_stats);
    $total_visits = $stats['total_visits'] ?? 0;
    $first_visit_formatted = '-';

    if (!empty($stats['first_visit'])) {
        $f_date = new DateTime($stats['first_visit']);
        $first_visit_formatted = $MonthList[$f_date->format('F')] . ' ' . $f_date->format('Y');
    }

    $query_exam = "SELECT me.*, d.DoctorName, d.Speciality FROM medical_examinations me JOIN doctors d ON me.DoctorID = d.DoctorID WHERE me.PatientID = '$patient_id' ORDER BY me.Examination_date DESC LIMIT 1";
    $result_exam = mysqli_query($connection, $query_exam);
    $latest_exam = mysqli_fetch_assoc($result_exam);

    $query_prev = "SELECT BloodPressureSistolik, BloodPressureDiastolik FROM medical_examinations WHERE PatientID = '$patient_id' ORDER BY Examination_date DESC LIMIT 1 OFFSET 1";
    $result_prev = mysqli_query($connection, $query_prev);
    $prev_exam = mysqli_fetch_assoc($result_prev);
    $prev_bp_text = $prev_exam ? 'Sebelumnya ' . $prev_exam['BloodPressureSistolik'] . '/' . $prev_exam['BloodPressureDiastolik'] . ' mmHg' : 'Belum ada data sebelumnya';

    $latest_prescriptions = [];

    if ($latest_exam) {
        $exam_id = $latest_exam['ExamID'];
        $query_presc = "SELECT mp.*, dr.DrugName, dr.DrugType FROM medical_prescriptions mp JOIN drugs dr ON mp.DrugID = dr.DrugID WHERE mp.ExamID = '$exam_id'";
        $result_presc = mysqli_query($connection, $query_presc);

        while ($row = mysqli_fetch_assoc($result_presc)) {
            $latest_prescriptions[] = $row;
        }
    }

    $bp_systolic  = $latest_exam ? $latest_exam['BloodPressureSistolik'] : '-';
    $bp_diastolic = $latest_exam ? $latest_exam['BloodPressureDiastolik'] : '-';
    $pulse_value  = $latest_exam ? $latest_exam['pulse'] : '-';
    $weight_kg    = $latest_exam ? floatval($latest_exam['WeightKg']) : 0;
    $height_cm    = (isset($latest_exam['HeightCm']) && !empty($latest_exam['HeightCm'])) ? floatval($latest_exam['HeightCm']) : 0;

    $imt_value = '-';

    if ($weight_kg > 0 && $height_cm > 0) {
        $height_m = $height_cm / 100;
        $imt_value = number_format($weight_kg / ($height_m * $height_m), 1, ',', '.');
    }

    $allergy_data = isset($data['Allergy']) && !empty($data['Allergy']) ? $data['Allergy'] : 'Tidak ada catatan alergi';

    $next_control_date = '-';

    if ($latest_exam && isset($latest_exam['NextControlDate']) && !empty($latest_exam['NextControlDate'])) {
        $nc_date = new DateTime($latest_exam['NextControlDate']);
        $next_control_date = $nc_date->format('d') . ' ' . $MonthList[$nc_date->format('F')] . ' ' . $nc_date->format('Y');
    } else {
        $next_control_date = 'Sesuai anjuran dokter';
    }
?>

<main class="main-content">
    <div class="welcome-section">
        <div class="welcome-text">
            <h2>Halo, <?php echo htmlspecialchars(explode(' ', $display_name)[0]); ?>👋🏼</h2>
            <p><?php echo $tanggal_sekarang; ?> - Mari pantau kesehatan Anda hari ini.</p>
        </div>
        <a href="patient_records.php" class="btn-action-primary">↗ Lihat rekam medis</a>
    </div>
    <div class="card profile-summary-card">
        <div class="profile-avatar-large"><?php echo $initials; ?></div>
        <div class="profile-info-grid">
            <div class="profile-main-data">
                <h3><?php echo htmlspecialchars($display_name); ?></h3>
                <p><?php echo $identifier; ?> · <?php echo ($data && $data['Gender'] == 'P') ? 'Perempuan' : 'Laki-laki'; ?></p>
                <p class="birth-text"><?php echo $data ? date('d M Y', strtotime($data['BirthDate'])) : '-'; ?> · <?php echo $age_text; ?></p>
            </div>
            <div class="profile-col">
                <span class="label">Golongan darah</span>
                <span class="value"><?php echo $data ? htmlspecialchars($data['BloodType']) : '-'; ?></span>
            </div>
            <div class="profile-col">
                <span class="label">Kondisi aktif</span>
                <span class="value"><?php echo $latest_exam ? htmlspecialchars($latest_exam['Diagnosis']) : 'Sehat / Stabil'; ?></span>
            </div>
            <div class="profile-col">
                <span class="label">Alergi obat</span>
                <span class="value warning-tag">Tidak ada</span>
            </div>
        </div>
    </div>
    <div class="section-header-row">
        <h3>Ringkasan kesehatan</h3>
        <span class="section-sub-info">Hasil kunjungan <?php echo $latest_exam ? date('d M Y', strtotime($latest_exam['Examination_date'])) : 'Terbaru'; ?></span>
    </div>
    <div class="health-metrics-grid">
        <!-- Tekanan Darah -->
        <div class="metric-card">
            <div class="metric-title-row">
                <span>Tekanan darah</span>
                <span class="metric-icon">❤️</span>
            </div>
            <div class="metric-value-row">
                <h2><?php echo $bp_systolic . '/' . $bp_diastolic; ?> <small>mmHg</small></h2>
            </div>
            <div class="metric-footer-row">
                <span><?php echo $prev_bp_text; ?></span>
            </div>
        </div>
        <div class="metric-card">
            <div class="metric-title-row">
                <span>Denyut nadi</span>
                <span class="metric-icon">📈</span>
            </div>
            <div class="metric-value-row">
                <h2><?php echo $pulse_value; ?> <small>x/menit</small></h2>
            </div>
            <div class="metric-footer-row">
                <span>Diukur saat pemeriksaan</span>
            </div>
        </div>
        <div class="metric-card">
            <div class="metric-title-row">
                <span>Berat badan</span>
                <span class="metric-icon">⚖️</span>
            </div>
            <div class="metric-value-row">
                <h2><?php echo $weight_kg > 0 ? $weight_kg : '-'; ?> <small>kg</small></h2>
            </div>
            <div class="metric-footer-row">
                <span>Tinggi badan <?php echo $height_cm > 0 ? $height_cm . ' cm' : '-'; ?> · IMT <?php echo $imt_value; ?></span>
            </div>
        </div>
    </div>
    <div class="dashboard-grid-split">
        <div class="left-split-content">
            <div class="card content-card">
                <div class="card-title-row">
                    <h3>Kunjungan terakhir</h3>
                    <span class="status-badge-green">Selesai</span>
                </div>
                <div class="visit-detail-box">
                    <div class="visit-date-badge">
                        <span class="v-day"><?php echo $latest_exam ? date('d', strtotime($latest_exam['Examination_date'])) : '--'; ?></span>
                        <span class="v-mon"><?php echo $latest_exam ? strtoupper(date('M Y', strtotime($latest_exam['Examination_date']))) : '----'; ?></span>
                    </div>
                    <div class="visit-info">
                       <h4><?php echo $latest_exam ? htmlspecialchars($latest_exam['mainIssues']) : 'Belum ada kunjungan tercatat'; ?></h4>
                       <p class="poli-text"><?php echo $latest_exam ? htmlspecialchars($latest_exam['Speciality']) : 'Poli Medis'; ?> · <?php echo $latest_exam ? date('H:i', strtotime($latest_exam['Examination_date'])) : '--:--'; ?> WIB</p>
                       <p class="doctor-text"><?php echo $latest_exam ? 'dr. ' . htmlspecialchars($latest_exam['DoctorName']) . ', ' . htmlspecialchars($latest_exam['Speciality']) : '-'; ?></p>
                    </div>
                </div>
                <div class="diagnosis-summary-box">
                    <div class="diag-col">
                        <span class="label">Diagnosis</span>
                        <p><?php echo $latest_exam ? htmlspecialchars($latest_exam['Diagnosis']) . ' - ' . htmlspecialchars($latest_exam['examResult']) : 'Belum ada data diagnosis'; ?></p>
                    </div>
                    <div class="diag-col">
                        <span class="label">Status kondisi</span>
                        <p class="text-green">Terkontrol, terapi dilanjutkan</p>
                    </div>
                </div>
                <div class="card-footer-action">
                    <span><?php echo $total_visits; ?> kunjungan tercatat sejak <?php echo $first_visit_formatted; ?></span>
                    <a href="patient_records.php" class="link-arrow">Detail kunjungan →</a>
                </div>
            </div>
            <div class="card content-card">
                <h3>Obat dari kunjungan terakhir</h3>
                <p class="section-desc">Gunakan sesuai petunjuk dokter Anda.</p>
                <?php 
                    if (!empty($latest_prescriptions)){ 
                        ?>
                        <?php foreach ($latest_prescriptions as $presc){ 
                            ?>
                            <div class="medicine-item-box">
                                <div class="med-icon">💊</div>
                                <div class="med-details">
                                    <h4><?php echo htmlspecialchars($presc['DrugName']); ?></h4>
                                    <p><?php echo $presc['Quantity']; ?> <?php echo $presc['DrugType']; ?>, sesuai anjuran dokter · oral</p>
                                    <small><?php echo htmlspecialchars($presc['Notes']); ?> · Resep terbaru</small>
                                </div>
                                <span class="med-tag">Terapi rutin</span>
                            </div>
                        <?php
                        }
                    } else { 
                        ?>
                        <div class="medicine-item-box">
                            <div class="med-icon">💊</div>
                            <div class="med-details">
                                <h4>Tidak ada resep aktif</h4>
                                <p>Belum ada obat tercatat pada kunjungan terakhir.</p>
                            </div>
                        </div>
                        <?php
                    }
                ?>
            </div>
            <div class="notice-disclaimer-box">
                <span>🛡️</span>
                <p>Anda memiliki akses baca dan cetak. Jika ada informasi yang tidak sesuai, hubungi petugas rumah sakit untuk verifikasi.</p>
            </div>
        </div>
        <div class="right-split-content">
            <div class="card content-card highlight-card">
                <div class="card-title-row">
                    <span class="icon-title">📅</span>
                    <h3>Kontrol berikutnya</h3>
                </div>
                <div class="next-control-date">
                    <h2><?php echo $next_control_date; ?></h2>
                    <p><?php echo $latest_exam ? htmlspecialchars($latest_exam['Speciality']) : 'Poli Terkait'; ?></p>
                </div>
                <p class="control-note">Sesuai anjuran dokter. Jadwal ini belum merupakan konfirmasi pendaftaran.</p>
                <a href="#" class="btn-outline-primary">
                    ↗ Informasi pendaftaran
                </a>
            </div>
            <div class="card content-card">
                <h3>Akses cepat</h3>
                <ul class="quick-links-list">
                    <li>
                        <a href="patient_records.php">
                            <span>📁 Riwayat rekam medis</span>
                            <span class="arrow">></span>
                        </a>
                    </li>
                    <li>
                        <a href="patient_records.php?action=download">
                            <span>🖨️ Cetak / unduh PDF</span>
                            <span class="arrow">></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</main>

<?php
    include ('footer.php');
?>