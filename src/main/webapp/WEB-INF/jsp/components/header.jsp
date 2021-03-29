<%@ page language="java" contentType="text/html"%>

<header id="wn__header" class="sticky_header header_bar">
  <div class="nav_bar">
    <div class="row">
      <div class="logo">
          <a href='index'>
            <img src="images/logo.png" alt="logo images">
          </a>
        </div>

                <!-- Nav bar menu items -->
      <div class="menuItems">

          <ul class="navUl">
            <li ><a class="drop" href='index'>Home</a></li>
              <li ><a class="drop" href="shop"><b>Shop</b></a></li>
            <li ><a class="drop" href="about.html">About</a></li>
            <li><a class="drop" href="contact.html">Contact</a></li>
            <li id='dd' style='float:right'>
                <a class='dd-btn active' href='login'>Login</a>
                <div class='dd-content'>
                    <a href='userProfile'>Profile</a>
                    <a href='admin_page.html'>Admin Panel</a>
                    <a href='logout.php'>Logout</a>
                </div>

            </li>
            <li style='float:right'><a class='active' href='cart.html'>Your Cart</a></li>

          </ul>
      </div>
    </div>
  </div>
</header>
