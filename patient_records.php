<?php
    include ('header.php');

    if ($role !== 'patient') {
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

    $is_download_mode = isset($_GET['action']) && $_GET['action'] === 'download';
    $selected_exam_id = isset($_GET['exam_id']) ? intval($_GET['exam_id']) : 0;
    $search = isset($_GET['search']) ? mysqli_real_escape_string($connection, $_GET['search']) : '';
    $query_exams = "SELECT me.*, d.DoctorName, d.Speciality FROM medical_examinations me JOIN doctors d ON me.DoctorID = d.DoctorID WHERE me.PatientID = '$patient_id'";

    if (!empty($search)) {
        $query_exams .= " AND (me.Diagnosis LIKE '%$search%' OR me.mainIssues LIKE '%$search%' OR d.DoctorName LIKE '%$search%')";
    }

    $query_exams .= " ORDER BY me.Examination_date DESC";
    $result_exams = mysqli_query($connection, $query_exams);
    $all_exams = [];

    while ($row_ex = mysqli_fetch_assoc($result_exams)) {
        $all_exams[] = $row_ex;
    }

    $total_exam_count = count($all_exams);
    $pdf_exam = null;

    if ($is_download_mode) {
        if ($selected_exam_id > 0) {
            foreach ($all_exams as $ex) {
                if ($ex['ExamID'] == $selected_exam_id) {
                    $pdf_exam = $ex;
                    break;
                }
            }
        }
        if (!$pdf_exam && $total_exam_count > 0) {
            $pdf_exam = $all_exams[0];
        }
    }

    $pdf_prescriptions = [];

    if ($pdf_exam) {
        $p_exam_id = $pdf_exam['ExamID'];
        $q_p = "SELECT mp.*, dr.DrugName, dr.DrugType FROM medical_prescriptions mp JOIN drugs dr ON mp.DrugID = dr.DrugID WHERE mp.ExamID = '$p_exam_id'";
        $r_p = mysqli_query($connection, $q_p);
        while($row_p = mysqli_fetch_assoc($r_p)) {
            $pdf_prescriptions[] = $row_p;
        }
    }
?>

<main class="main-content">
    <?php
        if (!$is_download_mode){
            ?>
            <div class="page-header-row">
                <div>
                    <h2>Riwayat rekam medis</h2>
                    <p class="section-desc">Setiap kunjungan, tersusun untuk membantu Anda memahami perjalanan kesehatan.</p>
                </div>
                <a href="patient_records.php?action=download" class="btn-action-primary">
                    🖨️ Cetak / unduh PDF
                </a>
            </div>
            <div class="card profile-summary-card mini-card">
                <div class="profile-avatar-medium"><?php echo $initials; ?></div>
                <div class="profile-info-grid horizontal-grid">
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
                        <span class="label">Kondisi aktif</span>
                        <span class="value"><?php echo ($total_exam_count > 0) ? htmlspecialchars($all_exams[0]['Diagnosis']) : 'Belum ada data'; ?></span>
                    </div>
                    <div class="profile-col">
                        <span class="label">Alergi obat</span>
                        <span class="value warning-tag"><?php echo ($data && !empty($data['Allergy'])) ? htmlspecialchars($data['Allergy']) : 'Tidak ada data alergi'; ?></span>
                    </div>
                </div>
            </div>
            <div class="filter-search-container">
                <form action="patient_records.php" method="GET" class="search-form-inline">
                    <div class="search-input-wrapper">
                        <span class="search-icon">🔍</span>
                        <input type="text" name="search" placeholder="Cari diagnosis atau keluhan..." value="<?php echo htmlspecialchars($search); ?>">
                    </div>
                    <div class="filter-dropdowns">
                        <select name="period" class="filter-select">
                            <option value="">Semua periode</option>
                            <option value="2026">Tahun 2026</option>
                        </select>
                        <select name="service" class="filter-select">
                            <option value="">Semua layanan</option>
                            <option value="poli">Semua Poli</option>
                        </select>
                        <button type="submit" class="btn-filter-sort">📅 Terbaru</button>
                    </div>
                </form>
            </div>
            <div class="timeline-container">
                <div class="timeline-header-info">
                    <h3>Timeline kunjungan</h3>
                    <span class="badge-count"><?php echo $total_exam_count; ?> kunjungan</span>
                </div>
                <?php
                    if ($total_exam_count > 0){
                        foreach ($all_exams as $index => $exam){
                            $exam_id = $exam['ExamID'];
                            $q_presc = "SELECT mp.*, dr.DrugName, dr.DrugType FROM medical_prescriptions mp JOIN drugs dr ON mp.DrugID = dr.DrugID WHERE mp.ExamID = '$exam_id'";
                            $res_presc = mysqli_query($connection, $q_presc);
                            $is_latest = ($index === 0);
                            ?>
                            <div class="card timeline-card">
                                <div class="timeline-date-badge">
                                    <span class="t-day"><?php echo date('d', strtotime($exam['Examination_date'])); ?></span>
                                    <span class="t-mon"><?php echo strtoupper(date('M Y', strtotime($exam['Examination_date']))); ?></span>
                                    <span class="t-time"><?php echo date('H:i', strtotime($exam['Examination_date'])); ?> WIB</span>
                                    <?php
                                        if ($is_latest){
                                            ?>
                                                <span class="badge-terbaru-sub">Terbaru</span>
                                            <?php
                                        }
                                    ?>
                                </div>
                                <div class="timeline-content-body">
                                    <div class="timeline-title-row">
                                        <h4><?php echo htmlspecialchars($exam['mainIssues']); ?></h4>
                                        <span class="status-badge-green"><?php echo $is_latest ? 'Rawat jalan' : 'Selesai'; ?></span>
                                    </div>
                                    <p class="doctor-meta">dr. <?php echo htmlspecialchars($exam['DoctorName']); ?> · <?php echo htmlspecialchars($exam['Speciality']); ?></p>
                                    <div class="exam-details-grid">
                                        <div class="ex-col">
                                            <span class="label">Keluhan utama</span>
                                            <p><?php echo htmlspecialchars($exam['mainIssues']); ?></p>
                                            <br>
                                            <span class="label">Hasil pemeriksaan fisik</span>
                                            <p><?php echo htmlspecialchars($exam['examResult']); ?></p>
                                        </div>
                                        <div class="ex-col metrics-mini">
                                            <span class="label">Tanda vital</span>
                                            <div class="vital-tags-grid">
                                                <span>❤️ <?php echo $exam['BloodPressureSistolik'] . '/' . $exam['BloodPressureDiastolik']; ?> mmHg</span>
                                                <span>📈 <?php echo $exam['pulse']; ?> x/menit</span>
                                                <span>🌡️ <?php echo $exam['temperature']; ?> °C</span>
                                                <span>⚖️ <?php echo intval($exam['WeightKg']); ?> kg</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="diagnosis-box-inner">
                                        <p><strong>Diagnosis (ICD-10):</strong> <?php echo htmlspecialchars($exam['Diagnosis']); ?></p>
                                        <p><strong>Tindakan / Penatalaksanaan:</strong> <?php echo htmlspecialchars($exam['examResult']); ?></p>
                                    </div>
                                    <?php 
                                        if (mysqli_num_rows($res_presc) > 0){ 
                                            ?>
                                            <div class="prescription-list-box">
                                                <?php 
                                                    while ($p = mysqli_fetch_assoc($res_presc)){ 
                                                        ?>
                                                        <div class="presc-item">
                                                            <span class="p-icon">💊</span>
                                                            <div>
                                                                <strong><?php echo htmlspecialchars($p['DrugName']); ?> · <?php echo $p['Quantity']; ?> <?php echo $p['DrugType']; ?></strong>
                                                                <p><?php echo htmlspecialchars($p['Notes']); ?></p>
                                                            </div>
                                                        </div>
                                                        <?php
                                                    }
                                                ?>
                                            </div>
                                            <?php
                                        }
                                    ?>
                                    <div class="timeline-footer-row">
                                        <small>Catatan & tindak lanjut: <?php echo htmlspecialchars($exam['Notes'] ?? '-'); ?></small>
                                        <a href="patient_records.php?action=download&exam_id=<?php echo $exam['ExamID']; ?>" class="link-print">🖨️ Cetak</a>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                    } else {
                        ?>
                        <div class="card content-card text-center">
                            <p>Belum ada riwayat rekam medis tercatat di database.</p>
                        </div>
                        <?php
                    }
                ?>
            <?php
        } else {
            ?>
            <div class="page-header-row">
                <div class="breadcrumb-header">
                    <span class="text-muted">Rekam medis / Cetak & ekspor</span>
                    <h2>Pratinjau rekam medis</h2>
                    <p class="section-desc">Pilih kunjungan yang ingin disertakan, lalu unduh atau cetak dokumen.</p>
                </div>
                <div class="action-buttons-top">
                    <a href="patient_records.php" class="btn-outline-secondary">Kembali</a>
                    <a href="#" onclick="window.print(); return false;" class="btn-action-primary">
                        ⬇ Unduh PDF
                    </a>
                </div>
            </div>
            <div class="download-preview-layout">
                <div class="card settings-sidebar-card">
                    <h3>Pengaturan dokumen</h3>
                    
                    <div class="form-group-section">
                        <label class="section-label">Rentang kunjungan</label>
                        <div class="radio-group">
                            <label><input type="radio" name="range" checked> Kunjungan terpilih</label>
                        </div>
                    </div>
                    <div class="visit-checkbox-list">
                        <?php 
                            foreach ($all_exams as $ex){ 
                                $active_cls = ($pdf_exam && $pdf_exam['ExamID'] == $ex['ExamID']) ? 'active' : ''; 
                                ?>
                                <a href="patient_records.php?action=download&exam_id=<?php echo $ex['ExamID']; ?>" class="visit-check-item <?php echo $active_cls; ?>" style="text-decoration:none; color:inherit; display:flex;">
                                    <input type="radio" <?php echo ($pdf_exam && $pdf_exam['ExamID'] == $ex['ExamID']) ? 'checked' : ''; ?>>
                                    <div>
                                        <strong><?php echo date('d M Y', strtotime($ex['Examination_date'])); ?></strong>
                                        <p><?php echo htmlspecialchars($ex['mainIssues']); ?></p>
                                    </div>
                                </a>
                                <?php 
                            } 
                        ?>
                    </div>
                    <div class="form-group-section">
                        <label class="section-label">Ukuran kertas</label>
                        <select class="form-control-select">
                            <option>A4 - Potret</option>
                        </select>
                    </div>
                    <div class="form-group-section">
                        <label class="section-label">Isi dokumen</label>
                        <p class="doc-content-desc">Identitas, pemeriksaan, diagnosis, tindakan, resep, dan tindak lanjut.</p>
                    </div>
                    <button onclick="window.print(); return false;" class="btn-outline-primary full-width-btn">🖨️ Cetak dokumen</button>
                    <small class="text-center-muted">1 kunjungan dipilih · 1 halaman</small>
                    <div class="security-notice-box">
                        <strong>🛡️ Jaga kerahasiaan</strong>
                        <p>Simpan PDF di perangkat pribadi. Jangan membagikan dokumen tanpa pertimbangan yang tepat.</p>
                    </div>
                </div>
                <div class="pdf-paper-preview">
                    <div class="pdf-toolbar-top">
                        <span>📄 RekamMedis_<?php echo str_replace(' ', '', $display_name); ?>_<?php echo $pdf_exam ? date('dmY', strtotime($pdf_exam['Examination_date'])) : 'date'; ?>.pdf</span>
                        <span>- 100% +</span>
                    </div>
                    <div class="pdf-document-sheet">
                        <div class="pdf-header-top">
                            <div class="pdf-brand">
                                <span class="pdf-hospital-logo">🏥</span>
                                <div>
                                    <h4>RS Sehat Sentosa</h4>
                                    <small>Unit Rekam Medis - Bandung</small>
                                </div>
                            </div>
                            <div class="pdf-meta-right">
                                <span class="badge-rahasia">RAHASIA MEDIS</span>
                                <small><?php echo $identifier; ?></small>
                            </div>
                        </div>
                        <hr class="pdf-divider">
                        <div class="pdf-title-section">
                            <h3>Ringkasan Rekam Medis</h3>
                            <p>Kunjungan <?php echo $pdf_exam ? date('j F Y', strtotime($pdf_exam['Examination_date'])) : '-'; ?> · <?php echo $pdf_exam ? htmlspecialchars($pdf_exam['Speciality']) : '-'; ?></p>
                        </div>
                        <table class="pdf-info-table">
                            <tr>
                                <td><strong>Nama pasien</strong><br><?php echo htmlspecialchars($display_name); ?></td>
                                <td><strong>No. rekam medis</strong><br><?php echo $identifier; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Tanggal lahir / jenis kelamin</strong><br><?php echo ($data && !empty($data['BirthDate'])) ? date('d M Y', strtotime($data['BirthDate'])) : '-'; ?> / <?php echo ($data && isset($data['Gender']) && $data['Gender'] == 'P') ? 'Perempuan' : 'Laki-laki'; ?></td>
                                <td><strong>Alergi</strong><br><?php echo ($data && !empty($data['Allergy'])) ? htmlspecialchars($data['Allergy']) : 'Tidak ada data alergi'; ?></td>
                            </tr>
                        </table>
                        <table class="pdf-vitals-table">
                            <tr>
                                <td>Tekanan darah<br><strong><?php echo $pdf_exam ? $pdf_exam['BloodPressureSistolik'] . '/' . $pdf_exam['BloodPressureDiastolik'] . ' mmHg' : '-'; ?></strong></td>
                                <td>Nadi<br><strong><?php echo $pdf_exam ? $pdf_exam['pulse'] . ' x/menit' : '-'; ?></strong></td>
                                <td>Suhu<br><strong><?php echo $pdf_exam ? $pdf_exam['temperature'] . ' °C' : '-'; ?></strong></td>
                                <td>Berat badan<br><strong><?php echo $pdf_exam ? intval($pdf_exam['WeightKg']) . ' kg' : '-'; ?></strong></td>
                            </tr>
                        </table>
                            <div class="pdf-section-block">
                            <span class="pdf-label">Keluhan & hasil pemeriksaan</span>
                            <p><strong>Keluhan:</strong> <?php echo $pdf_exam ? htmlspecialchars($pdf_exam['mainIssues']) : '-'; ?></p>
                            <p><strong>Pemeriksaan fisik:</strong> <?php echo $pdf_exam ? htmlspecialchars($pdf_exam['examResult']) : '-'; ?></p>
                        </div>
                        <div class="pdf-grid-two">
                            <div>
                                <span class="pdf-label">Diagnosis (ICD-10)</span>
                                <p><?php echo $pdf_exam ? htmlspecialchars($pdf_exam['Diagnosis']) : '-'; ?></p>
                            </div>
                            <div>
                                <span class="pdf-label">Tindakan</span>
                                <p><?php echo $pdf_exam ? htmlspecialchars($pdf_exam['examResult']) : '-'; ?></p>
                            </div>
                        </div>
                        <div class="pdf-section-block">
                            <span class="pdf-label">Resep obat</span>
                            <table class="pdf-drug-table">
                                <thead>
                                    <tr>
                                        <th>Nama obat</th>
                                        <th>Aturan pakai</th>
                                        <th>Jumlah</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                        if (!empty($pdf_prescriptions)){
                                            foreach ($pdf_prescriptions as $dp){ ?>
                                                <tr>
                                                    <td><?php echo htmlspecialchars($dp['DrugName']); ?></td>
                                                    <td><?php echo htmlspecialchars($dp['Notes']); ?> · Oral</td>
                                                    <td><?php echo $dp['Quantity'] . ' ' . $dp['DrugType']; ?></td>
                                                </tr>
                                                <?php
                                            } 
                                        } else{ 
                                            ?>
                                            <tr>
                                                <td colspan="3">Tidak ada resep obat pada kunjungan ini.</td>
                                            </tr>
                                            <?php 
                                        }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="pdf-section-block">
                            <span class="pdf-label">Catatan & tindak lanjut</span>
                            <p><?php echo $pdf_exam ? htmlspecialchars($pdf_exam['Notes'] ?? '-') : '-'; ?></p>
                        </div>
                        <div class="pdf-footer-sign">
                            <div>
                                <small>Dicetak pada</small>
                                <p><?php echo date('d F Y, H:i'); ?> WIB<br>Sumber: ReMeDiVe</p>
                            </div>
                            <div class="text-right">
                                <small>Dokter pemeriksa</small>
                                <p><strong>dr. <?php echo $pdf_exam ? htmlspecialchars($pdf_exam['DoctorName']) : '-'; ?></strong><br><?php echo $pdf_exam ? htmlspecialchars($pdf_exam['Speciality']) : '-'; ?></p>
                            </div>
                        </div>
                        <div class="pdf-legal-footer">
                            <span>DATA KONTAK / MEDIS - Dokumen memuat informasi rahasia pasien.</span>
                            <span>Halaman 1 dari 1</span>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
    ?>
</main>

<?php
    include ('footer.php');
?>