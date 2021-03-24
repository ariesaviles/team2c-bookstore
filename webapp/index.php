<?php
	include('database.php');
	$query = 'SELECT * FROM books';
	$books = $db->query($query);
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

    	<!-- Start image -->
        <div class="indexImage">
           <a class= "bB" href="home.php"><img class= "bigBoy" src="images/1.jpg" id="logo" alt="SAJ Logo"></a>
        </div>


		<!-- Start Feat Read -->
		<section class="indexFeaturedReads">
			<div class="container">
				<div class="row">
						<div class="indexText">
							<h2 class="indexH2">Featured <span class="color--theme">Reads</span></h2>
							<p><span class="color--dark">There are many variations of passages of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form</span></p>
						</div>
				</div>
				<!-- Start Single Tab Content -->
				<div class="row">

					<!--            BOOK           -->
					<div class="indexBook">
							<div class="bookImg">
								<a href="single-product.html">
									<img src="images/8.jpg" alt="product image">
								</a>
							</div>

							<div class="bookLabel">
								<h4><a href="single-product.html">Bowen Greenwood</a></h4>
								<ul class="prize d-flex">
									<li>$40.00</li>
								</ul>

								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
					</div>

					<!--            BOOK           -->
					<div class="indexBook">
							<div class="bookImg">
								<a href="single-product.html">
									<img src="images/8.jpg" alt="product image">
								</a>
							</div>

							<div class="bookLabel">
								<h4><a href="single-product.html">Bowen Greenwood</a></h4>
								<ul class="prize d-flex">
									<li>$40.00</li>
								</ul>

								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
					</div>

					<!--            BOOK           -->
					<div class="indexBook">
							<div class="bookImg">
								<a href="single-product.html">
									<img src="images/8.jpg" alt="product image">
								</a>
							</div>

							<div class="bookLabel">
								<h4><a href="single-product.html">Bowen Greenwood</a></h4>
								<ul class="prize d-flex">
									<li>$40.00</li>
								</ul>

								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
					</div>

				</div>
				<!-- End Feat Read Content -->
			</div>
		</section>

		<div class="testimonial__text__slide testext_active">
			<div class="clint__info">
				<p>absolutely outstanding. When I needed them they came through in a big way! I know that if you buy this theme, you'll get the one thing we all look for when we buy on.</p>
				<div class="name__post">
					<span>Ra Munne</span>
					<h6>Head Of Project</h6>
				</div>
			</div>
		</div>

		<!-- Start New Arrivals -->
		<section class="indexNewArrivals">
			<div class="container">
				<div class="row">
						<div class="indexText">
							<h2 class="indexH2">New <span class="color--theme">Arrivals</span></h2>
							<p><span class="color--dark">There are many variations of passages of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form</span></p>
						</div>
				</div>

				<div class="row">
					<!--            BOOK           -->
					<div class="indexBook">
							<div class="bookImg">
								<a href="single-product.html">
									<img src="images/8.jpg" alt="product image">
								</a>
							</div>

							<div class="bookLabel">
								<h4><a href="single-product.html">Bowen Greenwood</a></h4>
								<ul class="prize d-flex">
									<li>$40.00</li>
								</ul>

								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
					</div>

					<!--            BOOK           -->
					<div class="indexBook">
							<div class="bookImg">
								<a href="single-product.html">
									<img src="images/8.jpg" alt="product image">
								</a>
							</div>

							<div class="bookLabel">
								<h4><a href="single-product.html">Bowen Greenwood</a></h4>
								<ul class="prize d-flex">
									<li>$40.00</li>
								</ul>

								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
					</div>

					<!--            BOOK           -->
					<div class="indexBook">
							<div class="bookImg">
								<a href="single-product.html">
									<img src="images/8.jpg" alt="product image">
								</a>
							</div>

							<div class="bookLabel">
								<h4><a href="single-product.html">Bowen Greenwood</a></h4>
								<ul class="prize d-flex">
									<li>$40.00</li>
								</ul>

								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
					</div>
				</div>
				<!-- End New Arrival Content -->
			</div>
		</section>


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


		<!-- END QUICKVIEW PRODUCT -->
	</div>

</body>
</html>