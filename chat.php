<?php
    include ('header.php');

    if ($role !== 'patient' && $role !== 'doctor') {
        header("Location: login.php");
        exit();
    }

    $success_msg = '';
    $error_msg   = '';
    $selected_target_id = isset($_GET['target_id']) ? intval($_GET['target_id']) : 0;

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['send_message'])) {
        $message_text = mysqli_real_escape_string($connection, $_POST['message_text']);
        $current_time = date('Y-m-d H:i:s');
        $target_id    = intval($_POST['target_id']);

        if (!empty(trim($message_text)) && $target_id > 0) {
            if ($role === 'patient') {
                $patient_pk = isset($data['PatientID']) ? $data['PatientID'] : 0;
                $insert_p = "INSERT INTO patient_chat (UserID, Chat, Time) VALUES ('$user_id', '$message_text', '$current_time')";
                
                if (mysqli_query($connection, $insert_p)) {
                    $chat_pid = mysqli_insert_id($connection);
                    mysqli_query($connection, "INSERT INTO chat_connect (ChatPID) VALUES ('$chat_pid')");
                    
                    header("Location: chat.php?target_id=" . $target_id);
                    exit();
                } else {
                    $error_msg = "Gagal mengirim pesan.";
                }
            } else {
                if ($role === 'doctor') {
                    $doctor_pk = isset($data['DoctorID']) ? $data['DoctorID'] : 0;
                    $insert_d = "INSERT INTO doctor_chat (UserID, Chat, Time) VALUES ('$user_id', '$message_text', '$current_time')";
                    if (mysqli_query($connection, $insert_d)) {
                        $chat_did = mysqli_insert_id($connection);
                        mysqli_query($connection, "INSERT INTO chat_connect (ChatDID) VALUES ('$chat_did')");
                        
                        header("Location: chat.php?target_id=" . $target_id);
                        exit();
                    } else {
                        $error_msg = "Gagal mengirim balasan." . mysqli_error($connection);;
                    }
                }
            }
        }
    }
    $contacts_list = [];

    if ($role === 'patient') {
        $patient_pk = isset($data['PatientID']) ? $data['PatientID'] : 0;
        if ($patient_pk > 0) {
            $q_docs = "SELECT DISTINCT d.* FROM doctors d JOIN medical_examinations m ON d.DoctorID = m.DoctorID WHERE m.PatientID = '$patient_pk' ORDER BY d.DoctorName ASC";
            $res_c = mysqli_query($connection, $q_docs);

            if ($res_c) {
                while ($row = mysqli_fetch_assoc($res_c)) {
                    $contacts_list[] = [
                        'id'   => $row['DoctorID'],
                        'name' => $row['DoctorName'],
                        'info' => 'Poli ' . $row['Speciality']
                    ];
                }
            }
        }
    } else {
        if ($role === 'doctor') {
            $doctor_pk = isset($data['DoctorID']) ? $data['DoctorID'] : 0;
            if ($doctor_pk > 0) {
                $q_pats = "SELECT DISTINCT p.PatientID, p.PatientName, p.Gender FROM patients p JOIN medical_examinations m ON p.PatientID = m.PatientID WHERE m.DoctorID = '$doctor_pk' ORDER BY p.PatientName ASC";
                $res_c = mysqli_query($connection, $q_pats);

                if ($res_c) {
                    while ($row = mysqli_fetch_assoc($res_c)) {
                        $contacts_list[] = [
                            'id'   => $row['PatientID'],
                            'name' => $row['PatientName'],
                            'info' => ($row['Gender'] == 'P' ? 'Perempuan' : 'Laki-laki')
                        ];
                    }
                }
            }
        }
    }

    if ($selected_target_id === 0 && !empty($contacts_list)) {
        $selected_target_id = $contacts_list[0]['id'];
    }
    $chat_history = [];

    if ($selected_target_id > 0) {
        if ($role === 'patient') {
            $res_doc_user = mysqli_query($connection, "SELECT UserID FROM doctors WHERE DoctorID = '$selected_target_id'");

            if ($res_doc_user && mysqli_num_rows($res_doc_user) > 0) {
                $doc_user_row = mysqli_fetch_assoc($res_doc_user);
                $doc_user_id  = $doc_user_row['UserID'];
                $q_chat = "(SELECT Chat as message, Time as msg_time, 'outgoing' as sender FROM patient_chat WHERE UserID = '$user_id') UNION (SELECT Chat as message, Time as msg_time, 'incoming' as sender FROM doctor_chat WHERE UserID = '$doc_user_id') ORDER BY msg_time ASC";
                $res_h = mysqli_query($connection, $q_chat);

                if ($res_h) {
                    while ($h = mysqli_fetch_assoc($res_h)) {
                        $chat_history[] = $h;
                    }
                }
            }
        } else {
            if ($role === 'doctor') {
                $res_pat_user = mysqli_query($connection, "SELECT UserID FROM patients WHERE PatientID = '$selected_target_id'");

                if ($res_pat_user && mysqli_num_rows($res_pat_user) > 0) {
                    $pat_user_row = mysqli_fetch_assoc($res_pat_user);
                    $pat_user_id  = $pat_user_row['UserID'];
                    $q_chat = "(SELECT Chat as message, Time as msg_time, 'incoming' as sender FROM patient_chat WHERE UserID = '$pat_user_id') UNION (SELECT Chat as message, Time as msg_time, 'outgoing' as sender FROM doctor_chat WHERE UserID = '$user_id') ORDER BY msg_time ASC";
                    $res_h = mysqli_query($connection, $q_chat);

                    if ($res_h) {
                        while ($h = mysqli_fetch_assoc($res_h)) {
                            $chat_history[] = $h;
                        }
                    }
                }
            }
        }
    }
?>

<main class="main-content">
    <div class="page-header-row">
        <div>
            <h2><?php echo ($role === 'patient') ? 'Konsultasi Dokter Penanggung Jawab' : 'Chat Pasien Dalam Perawatan'; ?></h2>
            <p class="section-desc">Komunikasi eksklusif antara pasien dan dokter yang menangani.</p>
        </div>
    </div>
    <?php
        if (!empty($success_msg)){
            ?>
            <div class="alert-success-box">✅ <?php echo $success_msg; ?></div>
            <?php
        }

        if (!empty($error_msg)){
            ?>
            <div class="alert-error-box">❌ <?php echo $error_msg; ?></div>
            <?php
        }
    ?>
    <div class="chat-container-grid">
        <div class="card chat-sidebar-card">
            <h3><?php echo ($role === 'patient') ? 'Dokter Pemeriksa' : 'Daftar Pasien Anda'; ?></h3>
            <p class="section-desc">Kontak terbatas sesuai rekam medis.</p>
            <div class="chat-contact-list">
                <?php
                    if (!empty($contacts_list)){
                        foreach ($contacts_list as $contact){
                            ?>
                            <a href="chat.php?target_id=<?php echo $contact['id']; ?>" class="chat-contact-item <?php echo ($selected_target_id === $contact['id']) ? 'active-contact' : ''; ?>">
                                <div class="contact-avatar"><?php echo ($role === 'patient') ? '👨‍⚕️' : '👤'; ?></div>
                                <div>
                                    <strong><?php echo htmlspecialchars($contact['name']); ?></strong>
                                    <small><?php echo htmlspecialchars($contact['info']); ?></small>
                                </div>
                            </a>
                            <?php
                        }
                    } else {
                        ?>
                        <p class="section-desc">Belum ada relasi pemeriksaan aktif.</p>
                        <?php
                    }
                ?>
            </div>
        </div>
        <div class="card chat-main-card">
            <div class="chat-header-box">
                <div class="contact-avatar">💬</div>
                <div>
                    <h4>Ruang Percakapan Terenkripsi</h4>
                    <small>Tersambung melalui database ReMeDiVe</small>
                </div>
            </div>
            <div class="chat-messages-scroll-area">
                <?php
                    if ($selected_target_id > 0 && !empty($chat_history)){
                        foreach ($chat_history as $chat){
                            ?>
                            <div class="chat-bubble <?php echo ($chat['sender'] === 'outgoing') ? 'bubble-outgoing' : 'bubble-incoming'; ?>">
                                <p><?php echo htmlspecialchars($chat['message']); ?></p>
                                <small class="chat-time"><?php echo date('d M Y, H:i', strtotime($chat['msg_time'])); ?></small>
                            </div>
                            <?php
                        }
                    } else { 
                        ?>
                        <div class="chat-empty-state">
                            <p>Pilih kontak di samping atau mulai percakapan baru.</p>
                        </div>
                        <?php
                    }
                ?>
            </div>
            <?php 
                if ($selected_target_id > 0){
                    ?>
                    <form action="chat.php?target_id=<?php echo $selected_target_id; ?>" method="POST" class="chat-input-form">
                        <input type="hidden" name="target_id" value="<?php echo $selected_target_id; ?>">
                        <input type="text" name="message_text" class="form-control" placeholder="Ketik pesan konsultasi..." required autocomplete="off">
                        <button type="submit" name="send_message" class="btn-action-primary">Kirim</button>
                    </form>
                    <?php
                }
            ?>
        </div>
    </div>
</main>

<?php
    include ('footer.php');
    ?>