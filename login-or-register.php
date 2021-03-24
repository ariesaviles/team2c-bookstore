<?php

	session_start();
	include_once('database.php');

	$error = false;

	if(isset($_POST['username'], $_POST['password'])){
			$username = $_POST['username'];
			$password = $_POST['password'];

			$query="SELECT * FROM user
				WHERE username = '$username' AND password = '$password'";

			$data = $db->query($query);

			if($data->rowCount()>0){
					$_SESSION['user'] = $data->fetch()['IDuser'];
					header("Location: index.php");
			}
			else{
					$error = true;
			}
	}

?>

<!doctype html>
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
	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		<!-- Header -->
			<?php include('php_comps/header.php'); ?>

    	<div id="login" style="padding-top: 100px; text-align: center;">

            <form name="login_form" method="post">
                <fieldset id="login_section" style="border: none">

                    <label for="username">Username:</label>
                    <input type="text" onchange="checkLength(this,3)" name="username" id="username" required><br>
                    <label for="password">Password:</label>
                    <input type="password" onchange="checkLength(this,6)" name="password" id="password" required><br>
                    <input type="submit" value="Login" id="login_submit"><br>

                    <?php
											if($error) {
												echo "<p class='login_fail'><b>Your password and email do not match. Please try again</b></p>";
											}
										?>

                    <a href="registration.html" id="contact_link">Are you a new user? Click here to register.</a>
                </fieldset>
            </form>

        </div>


    	<!-- Footer --->
		<div class="footerBody">
			<div class="footerLogoText">
				<a href="index.html">
					<img src="images/footer.png" alt="logo">
				</a>
				<p id="footerP">There are many variations of passages of Lorem Ipsum available, but the majority have suffered duskam alteration variations of passages</p>
			</div>
		</div>
		<!-- //Footer Area -->
		<!-- QUICKVIEW PRODUCT -->

		<!-- END QUICKVIEW PRODUCT -->
	</div>
	<!-- //Main wrapper -->
</body>
</html>
