<?php
    if(!isset($_SESSION))
    {
        session_start();
    }
?>

<header id="wn__header" class="sticky_header header_bar">
  <div class="nav_bar">
    <div class="row">
      <div class="logo">
          <a href="index.html">
            <img src="images/logo.png" alt="logo images">
          </a>
        </div>

                <!-- Nav bar menu items -->
      <div class="menuItems">

          <ul class="navUl">
            <li ><a class="drop" href="index.html">Home</a></li>
                            <li ><a class="drop" href="shop-grid.html"><b>Shop</b></a></li>
            <li ><a class="drop" href="about.html">About</a></li>
            <li><a class="drop" href="contact.html">Contact</a></li>

            <?php if(isset($_SESSION['user'])){
                echo "<li id='dropdown' style='float:right'><a class='active' href='logout.php'>Your Account</a><div class='dropdown'><a href='logout.php'>Profile</a><a href='logout.php'>Logout</a></div></li>";
            } else{
                echo "<li style='float:right'><a class='active' href='login-or-register.php'>Login</a></li>";
            }?>

            <li style="float:right"><a class="active" href="cart.html">Your Cart</a></li>
          </ul>
      </div>
    </div>
  </div>
</header>
