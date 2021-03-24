<?php
    // Connect to the database.

     $dsn='mysql:host=localhost;dbname=mydb';
     $username='root';
     $password='';

    try {
        $db = new PDO($dsn, $username, $password);
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        include('database-error.php');
        exit();
    }
?>
