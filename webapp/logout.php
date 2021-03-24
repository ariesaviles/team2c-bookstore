<?php
    session_start();
    unset($_SESSION['user']);
    header("Location: login-or-register.php");
?>
