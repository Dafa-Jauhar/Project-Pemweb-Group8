<?php
include('header.php');

if ($role !== 'patient' && $role !== 'doctor') {
    header("Location: login.php");
    exit();
}

$error_msg = '';
$selected_target_id = isset($_GET['target_id']) ? intval($_GET['target_id']) : 0;
$current_user_id = intval($user_id);

$contacts_list = [];
$chat_history = [];
$target_user_id = 0;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['send_message'])) {

    $message_text = trim($_POST['message_text'] ?? '');
    $target_id = intval($_POST['target_id'] ?? 0);
    $receiver_user_id = 0;

    if ($message_text === '') {
        $error_msg = "Pesan tidak boleh kosong.";
    } elseif ($target_id <= 0) {
        $error_msg = "Penerima tidak valid.";
    } else {

        if ($role === 'patient') {

            $stmt = mysqli_prepare(
                $connection,
                "SELECT d.UserID
                 FROM doctors d
                 INNER JOIN medical_examinations m
                    ON d.DoctorID = m.DoctorID
                 INNER JOIN patients p
                    ON p.PatientID = m.PatientID
                 WHERE d.DoctorID = ?
                   AND p.UserID = ?
                 LIMIT 1"
            );

            mysqli_stmt_bind_param(
                $stmt,
                "ii",
                $target_id,
                $current_user_id
            );

            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            if ($row = mysqli_fetch_assoc($result)) {
                $receiver_user_id = intval($row['UserID']);
            }

            mysqli_stmt_close($stmt);

        } elseif ($role === 'doctor') {

            $stmt = mysqli_prepare(
                $connection,
                "SELECT p.UserID
                 FROM patients p
                 INNER JOIN medical_examinations m
                    ON p.PatientID = m.PatientID
                 INNER JOIN doctors d
                    ON d.DoctorID = m.DoctorID
                 WHERE p.PatientID = ?
                   AND d.UserID = ?
                 LIMIT 1"
            );

            mysqli_stmt_bind_param(
                $stmt,
                "ii",
                $target_id,
                $current_user_id
            );

            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            if ($row = mysqli_fetch_assoc($result)) {
                $receiver_user_id = intval($row['UserID']);
            }

            mysqli_stmt_close($stmt);
        }

        if ($receiver_user_id <= 0) {

            $error_msg = "Penerima tidak valid.";

        } elseif ($receiver_user_id === $current_user_id) {

            $error_msg = "Tidak dapat mengirim pesan kepada diri sendiri.";

        } else {

            $stmt = mysqli_prepare(
                $connection,
                "INSERT INTO message
                    (SenderID, ReceiverID, Chat, Time)
                 VALUES (?, ?, ?, NOW())"
            );

            mysqli_stmt_bind_param(
                $stmt,
                "iis",
                $current_user_id,
                $receiver_user_id,
                $message_text
            );

            if (mysqli_stmt_execute($stmt)) {
                mysqli_stmt_close($stmt);

                header(
                    "Location: chat.php?target_id=" . $target_id
                );
                exit();
            }

            $error_msg = "Gagal mengirim pesan.";
            mysqli_stmt_close($stmt);
        }
    }
}

if ($role === 'patient') {

    $stmt = mysqli_prepare(
        $connection,
        "SELECT DISTINCT
            d.DoctorID,
            d.DoctorName,
            d.Speciality
         FROM doctors d
         INNER JOIN medical_examinations m
            ON d.DoctorID = m.DoctorID
         INNER JOIN patients p
            ON p.PatientID = m.PatientID
         WHERE p.UserID = ?
         ORDER BY d.DoctorName ASC"
    );

    mysqli_stmt_bind_param(
        $stmt,
        "i",
        $current_user_id
    );

    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    while ($row = mysqli_fetch_assoc($result)) {

        $contacts_list[] = [
            'id' => intval($row['DoctorID']),
            'name' => $row['DoctorName'],
            'info' => 'Poli ' . $row['Speciality']
        ];
    }

    mysqli_stmt_close($stmt);

} elseif ($role === 'doctor') {

    $stmt = mysqli_prepare(
        $connection,
        "SELECT DISTINCT
            p.PatientID,
            p.PatientName,
            p.Gender
         FROM patients p
         INNER JOIN medical_examinations m
            ON p.PatientID = m.PatientID
         INNER JOIN doctors d
            ON d.DoctorID = m.DoctorID
         WHERE d.UserID = ?
         ORDER BY p.PatientName ASC"
    );

    mysqli_stmt_bind_param(
        $stmt,
        "i",
        $current_user_id
    );

    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    while ($row = mysqli_fetch_assoc($result)) {

        $gender_text = ($row['Gender'] === 'P')
            ? 'Perempuan'
            : 'Laki-laki';

        $contacts_list[] = [
            'id' => intval($row['PatientID']),
            'name' => $row['PatientName'],
            'info' => $gender_text
        ];
    }

    mysqli_stmt_close($stmt);
}

if (
    $selected_target_id === 0 &&
    !empty($contacts_list)
) {
    $selected_target_id = $contacts_list[0]['id'];
}

if ($selected_target_id > 0) {

    if ($role === 'patient') {

        $stmt = mysqli_prepare(
            $connection,
            "SELECT d.UserID
             FROM doctors d
             INNER JOIN medical_examinations m
                ON d.DoctorID = m.DoctorID
             INNER JOIN patients p
                ON p.PatientID = m.PatientID
             WHERE d.DoctorID = ?
               AND p.UserID = ?
             LIMIT 1"
        );

        mysqli_stmt_bind_param(
            $stmt,
            "ii",
            $selected_target_id,
            $current_user_id
        );

        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($row = mysqli_fetch_assoc($result)) {
            $target_user_id = intval($row['UserID']);
        }

        mysqli_stmt_close($stmt);

    } elseif ($role === 'doctor') {

        $stmt = mysqli_prepare(
            $connection,
            "SELECT p.UserID
             FROM patients p
             INNER JOIN medical_examinations m
                ON p.PatientID = m.PatientID
             INNER JOIN doctors d
                ON d.DoctorID = m.DoctorID
             WHERE p.PatientID = ?
               AND d.UserID = ?
             LIMIT 1"
        );

        mysqli_stmt_bind_param(
            $stmt,
            "ii",
            $selected_target_id,
            $current_user_id
        );

        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($row = mysqli_fetch_assoc($result)) {
            $target_user_id = intval($row['UserID']);
        }

        mysqli_stmt_close($stmt);
    }
}

if ($target_user_id > 0) {

    $stmt = mysqli_prepare(
        $connection,
        "SELECT
            MessageID,
            SenderID,
            ReceiverID,
            Chat,
            Time
         FROM message
         WHERE
            (SenderID = ? AND ReceiverID = ?)
            OR
            (SenderID = ? AND ReceiverID = ?)
         ORDER BY Time ASC, MessageID ASC"
    );

    mysqli_stmt_bind_param(
        $stmt,
        "iiii",
        $current_user_id,
        $target_user_id,
        $target_user_id,
        $current_user_id
    );

    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    while ($row = mysqli_fetch_assoc($result)) {

        $chat_history[] = [
            'message' => $row['Chat'],
            'msg_time' => $row['Time'],
            'sender' => (
                intval($row['SenderID']) === $current_user_id
            )
                ? 'outgoing'
                : 'incoming'
        ];
    }

    mysqli_stmt_close($stmt);
}
?>

<main class="main-content">

    <div class="page-header-row">
        <div>
            <h2>
                <?php
                echo ($role === 'patient')
                    ? 'Konsultasi Dokter Penanggung Jawab'
                    : 'Chat Pasien Dalam Perawatan';
                ?>
            </h2>

            <p class="section-desc">
                Komunikasi antara pasien dan dokter yang menangani.
            </p>
        </div>
    </div>

    <?php if (!empty($error_msg)): ?>
        <div class="alert-error-box">
            <?php echo htmlspecialchars($error_msg); ?>
        </div>
    <?php endif; ?>

    <div class="chat-container-grid">

        <div class="card chat-sidebar-card">

            <h3>
                <?php
                echo ($role === 'patient')
                    ? 'Dokter Pemeriksa'
                    : 'Daftar Pasien Anda';
                ?>
            </h3>

            <div class="chat-contact-list">

                <?php if (!empty($contacts_list)): ?>

                    <?php foreach ($contacts_list as $contact): ?>

                        <a
                            href="chat.php?target_id=<?php echo $contact['id']; ?>"
                            class="chat-contact-item
                            <?php
                            echo ($selected_target_id === $contact['id'])
                                ? 'active-contact'
                                : '';
                            ?>"
                        >

                            <div class="contact-avatar">
                                <?php
                                echo ($role === 'patient')
                                    ? '👨‍⚕️'
                                    : '👤';
                                ?>
                            </div>

                            <div>
                                <strong>
                                    <?php
                                    echo htmlspecialchars(
                                        $contact['name']
                                    );
                                    ?>
                                </strong>

                                <small>
                                    <?php
                                    echo htmlspecialchars(
                                        $contact['info']
                                    );
                                    ?>
                                </small>
                            </div>

                        </a>

                    <?php endforeach; ?>

                <?php else: ?>

                    <p class="section-desc">
                        Belum ada relasi pemeriksaan aktif.
                    </p>

                <?php endif; ?>

            </div>
        </div>

        <div class="card chat-main-card">

            <div class="chat-header-box">

                <div class="contact-avatar">
                    💬
                </div>

                <div>
                    <h4>
                        Ruang Percakapan
                    </h4>

                    <small>
                        Konsultasi pasien dan dokter
                    </small>
                </div>

            </div>

            <div class="chat-messages-scroll-area">

                <?php if (
                    $selected_target_id > 0 &&
                    !empty($chat_history)
                ): ?>

                    <?php foreach ($chat_history as $chat): ?>

                        <div
                            class="chat-bubble
                            <?php
                            echo ($chat['sender'] === 'outgoing')
                                ? 'bubble-outgoing'
                                : 'bubble-incoming';
                            ?>"
                        >

                            <p>
                                <?php
                                echo htmlspecialchars(
                                    $chat['message']
                                );
                                ?>
                            </p>

                            <small class="chat-time">
                                <?php
                                echo date(
                                    'd M Y, H:i',
                                    strtotime($chat['msg_time'])
                                );
                                ?>
                            </small>

                        </div>

                    <?php endforeach; ?>

                <?php else: ?>

                    <div class="chat-empty-state">
                        <p>
                            Belum ada pesan.
                        </p>
                    </div>

                <?php endif; ?>

            </div>

            <?php if (
                $selected_target_id > 0 &&
                $target_user_id > 0
            ): ?>

                <form
                    action="chat.php?target_id=<?php echo $selected_target_id; ?>"
                    method="POST"
                    class="chat-input-form"
                >

                    <input
                        type="hidden"
                        name="target_id"
                        value="<?php echo $selected_target_id; ?>"
                    >
                    <input
                        type="text"
                        name="message_text"
                        class="form-control"
                        placeholder="Ketik pesan..."
                        required
                        autocomplete="off"
                    >
                    <button
                        type="submit"
                        name="send_message"
                        class="btn-action-primary"
                    >
                        Kirim
                    </button>
                </form>
            <?php endif; ?>
        </div>
    </div>
</main>

<?php
include('footer.php');
?>
