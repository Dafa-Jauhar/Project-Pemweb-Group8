<?php
    include ('header.php');

    if ($role !== 'doctor') {
        header("Location: login.php");
        exit();
    }

    $schedules = [
        [
            'day'   => 'Senin',
            'time'  => '08:00 - 20:00',
            'room'  => 'Poli Utama / Ruang Pemeriksaan 1',
            'status'=> 'Aktif'
        ],
        [
            'day'   => 'Selasa',
            'time'  => '08:00 - 20:00',
            'room'  => 'Poli Utama / Ruang Pemeriksaan 1',
            'status'=> 'Aktif'
        ],
        [
            'day'   => 'Rabu',
            'time'  => '08:00 - 20:00',
            'room'  => 'Poli Utama / Ruang Pemeriksaan 1',
            'status'=> 'Aktif'
        ],
        [
            'day'   => 'Kamis',
            'time'  => '08:00 - 20:00',
            'room'  => 'Poli Utama / Ruang Pemeriksaan 1',
            'status'=> 'Aktif'
        ],
        [
            'day'   => 'Jumat',
            'time'  => '08:00 - 20:00',
            'room'  => 'Poli Utama / Ruang Pemeriksaan 1',
            'status'=> 'Aktif'
        ]
    ];
?>

<main class="main-content">
    <div class="page-header-row">
        <div>
            <h2>Jadwal Praktik</h2>
            <p class="section-desc">Kelola dan tinjau jam operasional layanan pemeriksaan medis Anda.</p>
        </div>
    </div>
    <div class="card profile-summary-card">
        <div class="profile-avatar-large">👨‍⚕️</div>
        <div class="profile-info-grid-horizontal">
            <div>
                <h3><?php echo htmlspecialchars($data['DoctorName'] ?? 'Dokter'); ?></h3>
                <p>NIP/ID Dokter: <?php echo htmlspecialchars($data['DoctorID'] ?? '-'); ?> · Spesialisasi: <?php echo htmlspecialchars($data['Speciality'] ?? 'Umum'); ?></p>
            </div>
            <div class="profile-col">
                <span class="label">Status Keaktifan</span>
                <span class="value"><span class="service-pill">Praktik Reguler</span></span>
            </div>
            <div class="profile-col">
                <span class="label">Total Hari Kerja</span>
                <span class="value">5 Hari / Pekan</span>
            </div>
        </div>
    </div>
    <div class="card content-card">
        <div class="table-filter-toolbar">
            <div class="search-box-wrapper">
                <span class="search-icon">📅</span>
                <input type="text" class="form-control" value="Periode Praktik: Senin s.d. Jumat" readonly>
            </div>
        </div>
        <div class="table-responsive">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>HARI PRAKTIK</th>
                        <th>JAM OPERASIONAL</th>
                        <th>RUANGAN / POLI</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        if (!empty($hardcoded_schedules)){
                            foreach ($hardcoded_schedules as $schedule){
                                ?>
                                <tr>
                                    <td>
                                        <strong><?php echo htmlspecialchars($schedule['day']); ?></strong>
                                    </td>
                                    <td><?php echo htmlspecialchars($schedule['time']); ?> WIB</td>
                                    <td><?php echo htmlspecialchars($schedule['room']); ?></td>
                                    <td><span class="warning-tag"><?php echo htmlspecialchars($schedule['status']); ?></span></td>
                                </tr>
                                <?php
                            }
                        } else {
                            ?>
                            <tr>
                                <td colspan="4" class="text-center">Belum ada jadwal praktik yang tersedia.</td>
                            </tr>
                            <?php
                        }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="audit-notice-banner" style="margin-top: 24px;">
        <span>!</span>
        <p><strong>Informasi Sistem</strong><br>Perubahan jadwal shift darurat atau cuti harus dikoordinasikan melalui bagian administrasi rumah sakit.</p>
    </div>
</main>

<?php
    include ('footer.php');
?>