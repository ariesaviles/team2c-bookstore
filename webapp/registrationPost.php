<?php

include('database.php');

// get the info the user entered in the
$firstName = $_POST['first_name'];
$lastName = $POST['last_name'];
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$date = date("Ymd");
$userExists = false;
$isAdmin = false;
$userState = "active";

// query to see if this email already exitsts in the database
$query = "SELECT * FROM `user` WHERE email = '$email'";
$userCheck = $db->query($query);

// Check if the query returned rows and if so, the user already exists.
if ($userCheck->rowCount() > 0) {
    $userExists = true;
}


// if the user does not exists, then add them to the database
if ($userExists == false) {
    $query = "INSERT INTO user
        (firstName, lastName, username, password, birthDate, isAdmin, userState)
        VALUES ('$firstName', '$lastName', '$username', '$password', '$date', '$isAdmin', '$userState')";
    $db->exec($query);
} // if
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Team 2C Books</title>

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="style.css"> <!-- main css -->
</head>

<body>
    <?php include('header.php'); ?>
    <div id="processNewUser">
        <fieldset>
            <?php if ($userExists == TRUE) { ?>
                <meta http-equiv="refresh" content="2;newUser.php" />
                <h3> Error: User already Exists. Redirecting to login page... </h3>
            <?php } else { ?>
                <meta http-equiv="refresh" content="2;login.php" />
                <h3> Account Creation Successful! Redirecting to login page... </h3>
            <?php } // if-else
            ?>
        </fieldset>
    </div>

    <!-- footer -- >
    <div class="footerBody">
			<div class="footerLogoText">
				<a href="index.html">
					<img src="images/footer.png" alt="logo">
				</a>
				<p id="footerP">There are many variations of passages of Lorem Ipsum available, but the majority have suffered duskam alteration variations of passages</p>
			</div>
		</div>
</body>

</html>
