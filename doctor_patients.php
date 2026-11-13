<?php
    include ('header.php');
    include ('timezone.php');

    if ($role !== 'doctor') {
        header("Location: login.php");
        exit();
    }

    $doctor_id  = isset($data['DoctorID']) ? $data['DoctorID'] : 0;
    $doctor_name = isset($data['DoctorName']) ? $data['DoctorName'] : 'Dokter';
    $speciality = isset($data['Speciality']) ? $data['Speciality'] : 'Umum';
    $patient_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    $action     = isset($_GET['action']) ? $_GET['action'] : 'list';
    $exam_id    = isset($_GET['exam_id']) ? intval($_GET['exam_id']) : 0;
    $success_msg = '';
    $error_msg   = '';

    if ($action === 'delete' && $exam_id > 0) {
        mysqli_query($connection, "DELETE FROM medical_prescriptions WHERE ExaminationID = '$exam_id'");
        $del_query = "DELETE FROM medical_examinations WHERE ExaminationID = '$exam_id' AND DoctorID = '$doctor_id'";

        if (mysqli_query($connection, $del_query)) {
            header("Location: doctor_patients.php?id=$patient_id&status=deleted");
            exit();
        } else {
            $error_msg = "Gagal menghapus rekam medis: " . mysqli_error($connection);
        }
    }

    if (isset($_GET['status']) && $_GET['status'] === 'deleted') {
        $success_msg = "Catatan rekam medis berhasil dihapus.";
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && (isset($_POST['save_examination']) || isset($_POST['update_examination']))) {
        $exam_date    = mysqli_real_escape_string($connection, $_POST['Examination_date']);
        $exam_time    = mysqli_real_escape_string($connection, $_POST['Examination_time']);
        $datetime     = $exam_date . ' ' . $exam_time . ':00';
        $service_type = mysqli_real_escape_string($connection, $_POST['ServiceType']);
        $chief_compl  = mysqli_real_escape_string($connection, $_POST['ChiefComplaint']);
        $phys_exam    = mysqli_real_escape_string($connection, $_POST['PhysicalExam']);
        $bp           = mysqli_real_escape_string($connection, $_POST['BloodPressure']);
        $pulse        = mysqli_real_escape_string($connection, $_POST['Pulse']);
        $temp         = mysqli_real_escape_string($connection, $_POST['Temperature']);
        $weight       = mysqli_real_escape_string($connection, $_POST['Weight']);
        $diagnosis    = mysqli_real_escape_string($connection, $_POST['Diagnosis']);
        $treatment    = mysqli_real_escape_string($connection, $_POST['Treatment']);
        $notes        = mysqli_real_escape_string($connection, $_POST['Notes']);
        $next_control = mysqli_real_escape_string($connection, $_POST['NextControlDate']);

        if (isset($_POST['update_examination']) && $exam_id > 0) {
            $q_upd = "UPDATE medical_examinations SET Examination_date = '$datetime',ServiceType = '$service_type',ChiefComplaint = '$chief_compl',PhysicalExam = '$phys_exam',BloodPressure = '$bp',Pulse = '$pulse',Temperature = '$temp',Weight = '$weight',Diagnosis = '$diagnosis',Treatment = '$treatment',Notes = '$notes',NextControlDate = '$next_control',status = 'Accepted' WHERE ExaminationID = '$exam_id' AND DoctorID = '$doctor_id'";

            if (mysqli_query($connection, $q_upd)) {
                if (!empty($_POST['DrugID'])) {
                    mysqli_query($connection, "DELETE FROM medical_prescriptions WHERE ExaminationID = '$exam_id'");
                    foreach ($_POST['DrugID'] as $index => $drug_id) {
                        $d_id = intval($drug_id);
                        $qty  = mysqli_real_escape_string($connection, $_POST['Quantity'][$index]);
                        $dose = mysqli_real_escape_string($connection, $_POST['Dosage'][$index]);
                        if ($d_id > 0) {
                            mysqli_query($connection, "INSERT INTO medical_prescriptions (ExaminationID, DrugID, Quantity, Dosage) VALUES ('$exam_id', '$d_id', '$qty', '$dose')");
                        }
                    }
                }
                header("Location: doctor_patients.php?id=$patient_id&status=updated");
                exit();
            } else {
                $error_msg = "Gagal memperbarui catatan: " . mysqli_error($connection);
            }
        } elseif (isset($_POST['save_examination'])) {
            $q_ins = "INSERT INTO medical_examinations (PatientID, DoctorID, Examination_date, ServiceType, ChiefComplaint, PhysicalExam, BloodPressure, Pulse, Temperature, Weight, Diagnosis, Treatment, Notes, NextControlDate, status) VALUES ('$patient_id', '$doctor_id', '$datetime', '$service_type', '$chief_compl', '$phys_exam', '$bp', '$pulse', '$temp', '$weight', '$diagnosis', '$treatment', '$notes', '$next_control', 'Accepted')";
        
            if (mysqli_query($connection, $q_ins)) {
                $new_exam_id = mysqli_insert_id($connection);

                if (!empty($_POST['DrugID'])) {
                    foreach ($_POST['DrugID'] as $index => $drug_id) {
                        $d_id = intval($drug_id);
                        $qty  = mysqli_real_escape_string($connection, $_POST['Quantity'][$index]);
                        $dose = mysqli_real_escape_string($connection, $_POST['Dosage'][$index]);

                        if ($d_id > 0) {
                            mysqli_query($connection, "INSERT INTO medical_prescriptions (ExaminationID, DrugID, Quantity, Dosage) VALUES ('$new_exam_id', '$d_id', '$qty', '$dose')");
                        }
                    }
                }
                header("Location: doctor_patients.php?id=$patient_id&status=created");
                exit();
            } else {
                $error_msg = "Gagal menyimpan rekam medis baru: " . mysqli_error($connection);
            }
        }
    }

    if (isset($_GET['status'])) {
        if ($_GET['status'] === 'updated') $success_msg = "Rekam medis berhasil diperbarui.";
        if ($_GET['status'] === 'created') $success_msg = "Rekam medis baru berhasil ditambahkan.";
    }

    $patient_data = null;
    $b_date = null;
    $patient_age = 0;

    if ($patient_id > 0) {
        $res_p = mysqli_query($connection, "SELECT * FROM patients WHERE PatientID = '$patient_id'");

        if ($res_p && mysqli_num_rows($res_p) > 0) {
            $patient_data = mysqli_fetch_assoc($res_p);
            
            if (!empty($patient_data['BirthDate'])) {
                $b_date = new DateTime($patient_data['BirthDate']);
                $patient_age = $b_date->diff(new DateTime('today'))->y;
            }
        }
    }

    $drugs_list = [];
    $res_drugs = mysqli_query($connection, "SELECT * FROM drugs ORDER BY DrugName ASC");

    while ($d_row = mysqli_fetch_assoc($res_drugs)) {
        $drugs_list[] = $d_row;
    }
?>

<main class="main-content">
    <?php 
        if ($patient_id === 0 || $action === 'list'){
            ?>
            <div class="page-header-row">
                <div>
                    <h2>Daftar Pasien</h2>
                    <p class="section-desc">Pilih pasien untuk melihat detail rekam medis atau mengelola pemeriksaan.</p>
                </div>
            </div>
            <?php 
                if (!empty($success_msg)){
                    ?>
                    <div class="alert-success-box">✅ <?php echo $success_msg; ?></div>
                    <?php
                }
            ?>
            <div class="card content-card">
                <div class="table-filter-toolbar">
                    <div class="search-box-wrapper">
                        <span class="search-icon">🔍</span>
                        <input type="text" class="form-control" placeholder="Cari nama pasien atau NIK..." readonly>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>NAMA PASIEN</th>
                                <th>NIK</th>
                                <th>GOL. DARAH</th>
                                <th>ALERGI OBAT</th>
                                <th>AKSI</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $q_my_patients = "SELECT DISTINCT p.* FROM patients p JOIN medical_examinations m ON p.PatientID = m.PatientID WHERE m.DoctorID = '$doctor_id'";
                                $res_mp = mysqli_query($connection, $q_my_patients);

                                if ($res_mp && mysqli_num_rows($res_mp) > 0){
                                    while ($pat = mysqli_fetch_assoc($res_mp)){
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
                                            <td><?php echo htmlspecialchars($pat['NIK']); ?></td>
                                            <td><?php echo htmlspecialchars($pat['BloodType']); ?></td>
                                            <td><span class="warning-tag"><?php echo htmlspecialchars($pat['Allergy'] ?? 'Tidak ada'); ?></span></td>
                                            <td>
                                                <a href="doctor_patients.php?id=<?php echo $pat['PatientID']; ?>" class="table-action-link">Kelola Rekam Medis ↗</a>
                                            </td>
                                        </tr>
                                        <?php
                                    } 
                                } else { 
                                    ?>
                                    <tr>
                                        <td colspan="5" class="text-center">Belum ada pasien terdaftar dalam perawatan Anda.</td>
                                    </tr>
                                    <?php
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <?php 
        } elseif ($patient_data && ($action === 'view' || $action === 'list')){
            ?>
            <div class="breadcrumb-row">
                <small>Daftar pasien / <?php echo htmlspecialchars($patient_data['PatientName']); ?></small>
            </div>
            <div class="page-header-row">
                <div>
                    <h2>Detail pasien</h2>
                    <p class="section-desc">Tinjau riwayat kesehatan dan kelola catatan kunjungan pasien.</p>
                </div>
                <div class="header-action-group">
                    <a href="patient_records.php?action=download&id=<?php echo $patient_id; ?>" target="_blank" class="btn-action-secondary">🖨️ Cetak / PDF</a>
                    <a href="doctor_patients.php?id=<?php echo $patient_id; ?>&action=add" class="btn-action-primary">+ Tambah kunjungan</a>
                </div>
            </div>
            <?php 
                if (!empty($success_msg)){
                    ?>
                    <div class="alert-success-box">✅ <?php echo $success_msg; ?></div>
                    <?php
                }
            ?>
            <?php
                if (!empty($error_msg)){
                    ?>
                    <div class="alert-error-box">❌ <?php echo $error_msg; ?></div>
                    <?php
                }
            ?>
            <div class="card profile-summary-card">
                <div class="profile-avatar-large"><?php echo strtoupper(mb_substr($patient_data['PatientName'], 0, 2)); ?></div>
                <div class="profile-info-grid-horizontal">
                    <div>
                        <h3><?php echo htmlspecialchars($patient_data['PatientName']); ?></h3>
                        <p>RM-2026-<?php echo str_pad($patient_data['PatientID'], 6, '0', STR_PAD_LEFT); ?> · <?php echo ($patient_data['Gender'] == 'P') ? 'Perempuan' : 'Laki-laki'; ?></p>
                        <p class="birth-text"><?php echo date('d M Y', strtotime($patient_data['BirthDate'])); ?> · 
                            <?php 
                            $b_date = new DateTime($patient_data['BirthDate']);
                            echo $b_date->diff(new DateTime('today'))->y; 
                            ?> tahun
                        </p>
                    </div>
                    <div class="profile-col">
                        <span class="label">Golongan darah</span>
                        <span class="value"><?php echo htmlspecialchars($patient_data['BloodType']); ?></span>
                    </div>
                    <div class="profile-col">
                        <span class="label">Kondisi aktif</span>
                        <span class="value">Hipertensi esensial</span>
                    </div>
                    <div class="profile-col">
                        <span class="label">Alergi obat</span>
                        <span class="value warning-tag"><?php echo htmlspecialchars($patient_data['Allergy'] ?? 'Tidak ada'); ?></span>
                    </div>
                </div>
            </div>
            <div class="patient-tabs-row">
                <span class="tab-item active-tab">Riwayat rekam medis</span>
                <span class="tab-item">Informasi pasien</span>
                <span class="tab-item">Dokumen pasien</span>
            </div>
            <div class="audit-notice-banner">
                <span>🛡️</span>
                <p><strong>Akses pengelolaan rekam medis</strong><br>Anda dapat menambah, mengedit, menghapus, dan mencetak catatan. Semua perubahan disimpan dalam jejak audit untuk menjaga integritas data.</p>
            </div>
            <div class="timeline-container">
                <?php
                    $q_exams = "SELECT * FROM medical_examinations WHERE PatientID = '$patient_id' ORDER BY Examination_date DESC";
                    $res_exams = mysqli_query($connection, $q_exams);

                    if ($res_exams && mysqli_num_rows($res_exams) > 0){
                        while ($exam = mysqli_fetch_assoc($res_exams)){
                            $e_id = $exam['ExaminationID'];
                            ?>
                            <div class="card timeline-card">
                                <div class="timeline-header-row">
                                    <div>
                                        <strong><?php echo date('d M Y', strtotime($exam['Examination_date'])); ?></strong>
                                        <small><?php echo date('H:i', strtotime($exam['Examination_date'])); ?> WIB</small>
                                    </div>
                                    <h4><?php echo htmlspecialchars($exam['Diagnosis'] ?? 'Pemeriksaan Klinis'); ?></h4>
                                    <span class="service-pill"><?php echo htmlspecialchars($exam['ServiceType']); ?></span>
                                </div>
                                <div class="timeline-body-grid">
                                    <div class="form-group">
                                        <label class="label">Keluhan utama</label>
                                        <p><?php echo htmlspecialchars($exam['ChiefComplaint']); ?></p>
                                    </div>
                                    <div class="form-group">
                                        <label class="label">Hasil pemeriksaan fisik</label>
                                        <p><?php echo htmlspecialchars($exam['PhysicalExam']); ?></p>
                                    </div>
                                </div>
                                <div class="vitals-mini-grid">
                                    <div><span class="label">Tekanan darah</span><strong><?php echo htmlspecialchars($exam['BloodPressure']); ?> mmHg</strong></div>
                                    <div><span class="label">Nadi</span><strong><?php echo htmlspecialchars($exam['Pulse']); ?> x/menit</strong></div>
                                    <div><span class="label">Suhu</span><strong><?php echo htmlspecialchars($exam['Temperature']); ?> °C</strong></div>
                                    <div><span class="label">Berat badan</span><strong><?php echo htmlspecialchars($exam['Weight']); ?> kg</strong></div>
                                </div>
                                <?php
                                    $q_pres = "SELECT mp.*, d.DrugName FROM medical_prescriptions mp JOIN drugs d ON mp.DrugID = d.DrugID WHERE mp.ExaminationID = '$e_id'";
                                    $res_pres = mysqli_query($connection, $q_pres);

                                    if ($res_pres && mysqli_num_rows($res_pres) > 0){
                                        ?>
                                        <div class="prescription-box-mini">
                                            <?php 
                                                while ($pres = mysqli_fetch_assoc($res_pres)){ 
                                                    ?>
                                                    <div class="prescription-item">
                                                        💊 <strong><?php echo htmlspecialchars($pres['DrugName']); ?></strong> - <?php echo htmlspecialchars($pres['Quantity']); ?> tablet
                                                        <small><?php echo htmlspecialchars($pres['Dosage']); ?></small>
                                                    </div>
                                                    <?php
                                                }
                                            ?>
                                        </div>
                                        <?php
                                    }
                                ?>
                                <div class="timeline-footer-actions">
                                    <small>Diperbarui <?php echo date('d M Y, H:i', strtotime($exam['Examination_date'])); ?></small>
                                    <div class="action-buttons-group">
                                        <a href="doctor_patients.php?id=<?php echo $patient_id; ?>&action=edit&exam_id=<?php echo $e_id; ?>" class="btn-sm-action">✏️ Edit</a>
                                        <a href="doctor_patients.php?id=<?php echo $patient_id; ?>&action=delete&exam_id=<?php echo $e_id; ?>" class="btn-sm-action text-danger" onclick="return confirm('Yakin ingin menghapus catatan rekam medis ini?')">🗑️ Hapus</a>
                                        <a href="patient_records.php?action=download&id=<?php echo $patient_id; ?>" target="_blank" class="btn-sm-action">🖨️ Cetak</a>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                    } else {
                        ?>
                        <div class="card text-center">
                            <p>Belum ada riwayat rekam medis untuk pasien ini.</p>
                        </div>
                        <?php
                    }
                ?>
            </div>
            <?php
        } elseif ($patient_data && ($action === 'add' || $action === 'edit')){
            $edit_data = [
                'Examination_date' => date('Y-m-d'),
                'Examination_time' => date('H:i'),
                'ServiceType' => 'Rawat jalan',
                'ChiefComplaint' => '',
                'PhysicalExam' => '',
                'BloodPressure' => '',
                'Pulse' => '',
                'Temperature' => '',
                'Weight' => '',
                'Diagnosis' => '',
                'Treatment' => '',
                'Notes' => '',
                'NextControlDate' => date('Y-m-d', strtotime('+1 month'))
            ];

            if ($action === 'edit' && $exam_id > 0) {
            $res_ed = mysqli_query($connection, "SELECT * FROM medical_examinations WHERE ExaminationID = '$exam_id'");

            if ($res_ed && mysqli_num_rows($res_ed) > 0) {
                $row_ed = mysqli_fetch_assoc($res_ed);
                $edit_data['Examination_date'] = date('Y-m-d', strtotime($row_ed['Examination_date']));
                $edit_data['Examination_time'] = date('H:i', strtotime($row_ed['Examination_date']));
                $edit_data['ServiceType'] = $row_ed['ServiceType'];
                $edit_data['ChiefComplaint'] = $row_ed['ChiefComplaint'];
                $edit_data['PhysicalExam'] = $row_ed['PhysicalExam'];
                $edit_data['BloodPressure'] = $row_ed['BloodPressure'];
                $edit_data['Pulse'] = $row_ed['Pulse'];
                $edit_data['Temperature'] = $row_ed['Temperature'];
                $edit_data['Weight'] = $row_ed['Weight'];
                $edit_data['Diagnosis'] = $row_ed['Diagnosis'];
                $edit_data['Treatment'] = $row_ed['Treatment'];
                $edit_data['Notes'] = $row_ed['Notes'];
                $edit_data['NextControlDate'] = $row_ed['NextControlDate'];
            }
        }
    ?>
    <div class="breadcrumb-row">
        <small>Daftar pasien / <?php echo htmlspecialchars($patient_data['PatientName']); ?> / <?php echo ($action === 'edit') ? 'Edit kunjungan' : 'Tambah kunjungan'; ?></small>
    </div>
    <div class="page-header-row">
        <div>
            <h2><?php echo ($action === 'edit') ? 'Edit rekam medis' : 'Tambah rekam medis baru'; ?></h2>
            <p class="section-desc">Perbarui catatan kunjungan. Pastikan seluruh informasi sudah benar.</p>
        </div>
        <span class="warning-tag">Perubahan belum disimpan</span>
    </div>
    <form action="doctor_patients.php?id=<?php echo $patient_id; ?>&action=<?php echo $action; ?>&exam_id=<?php echo $exam_id; ?>" method="POST" class="form-layout-grid">
        <div class="form-main-column">
            <div class="card content-card">
                <h3>Informasi kunjungan</h3>
                <small class="text-muted">* Wajib diisi</small>
                <div class="form-grid-three" style="margin-top: 16px;">
                    <div class="form-group">
                        <label class="label">Tanggal kunjungan *</label>
                        <input type="date" name="Examination_date" class="form-control" value="<?php echo $edit_data['Examination_date']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label class="label">Waktu *</label>
                        <input type="time" name="Examination_time" class="form-control" value="<?php echo $edit_data['Examination_time']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label class="label">Jenis layanan *</label>
                        <select name="ServiceType" class="form-control" required>
                            <option value="Rawat jalan" <?php echo ($edit_data['ServiceType'] === 'Rawat jalan') ? 'selected' : ''; ?>>Rawat jalan</option>
                            <option value="Rawat inap" <?php echo ($edit_data['ServiceType'] === 'Rawat inap') ? 'selected' : ''; ?>>Rawat inap</option>
                            <option value="IGD" <?php echo ($edit_data['ServiceType'] === 'IGD') ? 'selected' : ''; ?>>IGD</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="card content-card">
                <h3>Keluhan & pemeriksaan</h3>
                <div class="form-group" style="margin-top: 16px;">
                    <label class="label">Keluhan utama *</label>
                    <textarea name="ChiefComplaint" class="form-control" rows="3" required><?php echo htmlspecialchars($edit_data['ChiefComplaint']); ?></textarea>
                </div>
                <div class="form-group">
                    <label class="label">Hasil pemeriksaan fisik *</label>
                    <textarea name="PhysicalExam" class="form-control" rows="3" required><?php echo htmlspecialchars($edit_data['PhysicalExam']); ?></textarea>
                </div>
                <div class="form-grid-four">
                    <div class="form-group">
                        <label class="label">TD (mmHg)</label>
                        <input type="text" name="BloodPressure" class="form-control" value="<?php echo htmlspecialchars($edit_data['BloodPressure']); ?>" placeholder="120/80">
                    </div>
                    <div class="form-group">
                        <label class="label">Nadi (x/menit)</label>
                        <input type="text" name="Pulse" class="form-control" value="<?php echo htmlspecialchars($edit_data['Pulse']); ?>" placeholder="80">
                    </div>
                    <div class="form-group">
                        <label class="label">Suhu (°C)</label>
                        <input type="text" name="Temperature" class="form-control" value="<?php echo htmlspecialchars($edit_data['Temperature']); ?>" placeholder="36.5">
                    </div>
                    <div class="form-group">
                        <label class="label">Berat (kg)</label>
                        <input type="text" name="Weight" class="form-control" value="<?php echo htmlspecialchars($edit_data['Weight']); ?>" placeholder="65">
                    </div>
                </div>
            </div>
            <div class="card content-card">
                <h3>Diagnosis & tindakan</h3>
                <div class="form-group" style="margin-top: 16px;">
                    <label class="label">Diagnosis utama - ICD-10 *</label>
                    <input type="text" name="Diagnosis" class="form-control" value="<?php echo htmlspecialchars($edit_data['Diagnosis']); ?>" placeholder="Cari kode atau nama diagnosis..." required>
                </div>
                <div class="form-group">
                    <label class="label">Tindakan / penatalaksanaan *</label>
                    <textarea name="Treatment" class="form-control" rows="3" required><?php echo htmlspecialchars($edit_data['Treatment']); ?></textarea>
                </div>
            </div>
            <div class="card content-card">
                <div class="card-title-row">
                    <h3>Resep obat</h3>
                    <button type="button" class="btn-sm-action">+ Tambah obat</button>
                </div>
                <div class="prescription-input-row" style="margin-top: 16px;">
                    <div class="form-group">
                        <label class="label">Nama & kekuatan obat *</label>
                        <select name="DrugID[]" class="form-control">
                            <option value="">Pilih obat dari database...</option>
                            <?php
                                foreach ($drugs_list as $drug){
                                    ?>
                                    <option value="<?php echo $drug['DrugID']; ?>"><?php echo htmlspecialchars($drug['DrugName']); ?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Jumlah *</label>
                        <input type="text" name="Quantity[]" class="form-control" placeholder="30 tablet">
                    </div>
                </div>
                <div class="form-grid-three">
                    <div class="form-group">
                        <label class="label">Dosis & frekuensi *</label>
                        <input type="text" name="Dosage[]" class="form-control" placeholder="1 tablet 1x sehari">
                    </div>
                    <div class="form-group">
                        <label class="label">Rute</label>
                        <select name="Route[]" class="form-control">
                            <option value="Oral">Oral</option>
                            <option value="Injeksi">Injeksi</option>
                            <option value="Topikal">Topikal</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Durasi</label>
                        <input type="text" name="Duration[]" class="form-control" placeholder="30 hari">
                    </div>
                </div>
            </div>
            <div class="card content-card">
                <h3>Catatan & tindak lanjut</h3>
                <div class="form-group" style="margin-top: 16px;">
                    <label class="label">Catatan tindak lanjut *</label>
                    <textarea name="Notes" class="form-control" rows="3"><?php echo htmlspecialchars($edit_data['Notes']); ?></textarea>
                </div>
                <div class="form-grid-two">
                    <div class="form-group">
                        <label class="label">Tanggal kontrol berikutnya</label>
                        <input type="date" name="NextControlDate" class="form-control" value="<?php echo $edit_data['NextControlDate']; ?>">
                    </div>
                    <div class="form-group">
                        <label class="label">Poliklinik tujuan</label>
                        <select class="form-control">
                            <option>Poli <?php echo htmlspecialchars($speciality); ?></option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-actions-bar">
                <small>Periksa sebelum menyimpan. Perubahan akan tercatat di jejak audit.</small>
                <div class="button-group">
                    <a href="doctor_patients.php?id=<?php echo $patient_id; ?>" class="btn-action-secondary">Batal</a>
                    <?php
                        if ($action === 'edit'){
                            ?>
                            <button type="submit" name="update_examination" class="btn-action-primary">✓ Simpan perubahan</button>
                            <?php 
                        } else {
                            ?>
                            <button type="submit" name="save_examination" class="btn-action-primary">✓ Simpan rekam medis</button>
                            <?php
                        }
                    ?>
                </div>
            </div>
        </div>
        <div class="form-sidebar-column">
            <div class="card sidebar-patient-info">
                <h4>Data pasien</h4>
                <div class="patient-sidebar-mini">
                    <span class="table-avatar-badge"><?php echo strtoupper(mb_substr($patient_data['PatientName'], 0, 2)); ?></span>
                    <div>
                        <strong><?php echo htmlspecialchars($patient_data['PatientName']); ?></strong>
                        <small>RM-2026-<?php echo str_pad($patient_data['PatientID'], 6, '0', STR_PAD_LEFT); ?></small>
                    </div>
                </div>
                <hr class="divider">
                <p><span class="label">Tanggal lahir / usia</span><br><strong><?php echo date('d M Y', strtotime($patient_data['BirthDate'])); ?> · <?php echo $patient_age; ?> tahun</strong></p>
                <p><span class="label">Jenis kelamin</span><br><strong><?php echo ($patient_data['Gender'] == 'P') ? 'Perempuan' : 'Laki-laki'; ?></strong></p>
                <p><span class="label">Gol. darah</span><br><strong><?php echo htmlspecialchars($patient_data['BloodType']); ?></strong></p>
                <hr class="divider">
                <p><span class="label">Dokter penanggung jawab</span><br><strong><?php echo htmlspecialchars($doctor_name); ?></strong></p>
                <small class="text-muted">Data identitas hanya baca. Koreksi identitas melalui petugas pendaftaran.</small>
            </div>
            <div class="card warning-card-sidebar">
                <div class="warning-header">⚠️ Alergi: <?php echo htmlspecialchars($patient_data['Allergy'] ?? 'Tidak ada'); ?></div>
                <p><small>Riwayat reaksi berupa ruam. Perhatikan alergi saat memilih terapi.</small></p>
            </div>
            <div class="card checklist-card">
                <h4>Bagian catatan</h4>
                <ul class="checklist-list">
                    <li><span>✓</span> Informasi kunjungan</li>
                    <li><span>✓</span> Keluhan & pemeriksaan</li>
                    <li><span>✓</span> Diagnosis & tindakan</li>
                    <li><span>✓</span> Resep obat</li>
                    <li><span>✓</span> Catatan & tindak lanjut</li>
                </ul>
            </div>
        </div>
    </form>
            <?php
        }
    ?>
</main>
<?php
    include ('footer.php');
?>