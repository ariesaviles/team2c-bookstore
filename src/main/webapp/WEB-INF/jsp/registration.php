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

    	<div id="register" style="padding-top: 100px;">
	        <form name="newUser_form" id="newUser_form" method="POST" action="registrationPost.php" onsubmit="event.preventDefault(); checkSame();"> <!--  -->
	            <fieldset id="newUser_section">
	                <legend><b>Create a New Account</b></legend>
	                <label>First Name:</label>
	                <input type="text" onchange="checkLength(this,3)" name="first_name" required><br>
	                <label>Last Name:</label>
	                <input type="text" onchange="checkLength(this,3)" name="last_name" required><br>
	                <label>Username:</label>
	                <input type="text" onchange="checkLength(this,3)" name="username" required><br>
	                <label>E-mail:</label>
	                <input type="email" id="email" name="email" required><br>
	                <label>Password:</label>
	                <input type="password" onchange="checkLength(this,6)" name="password" placeholder="At least 6 characters" pattern=".{6,}" title="6 or more characters" required><br>
	                <label for="confirmPassword">Confirm Password:</label>
	                <input type="password" onchange="checkLength(this,6)" name="confirmPassword" placeholder="Re-enter password" pattern=".{6,}" title="6 or more characters" required><br>
                  <input type="submit" value="Sign Up" id="newUser_submit" ><br>
	            </fieldset>

              <fieldset>

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
	</div>
	<!-- //Main wrapper -->
</body>
</html>
