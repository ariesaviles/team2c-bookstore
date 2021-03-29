<%@ page language="java" contentType="text/html"%>
<style>
    .dd-btn {
        cursor: pointer;
        background-color: #d5805d;
        color: white;
        border: none;
    }
    .dd {
        position: relative;
        display: inline-block;
    }
    .dd-content {
        display: none;
        position: absolute;
        right: 0;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 2;
    }
    .dd-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dd-content a:hover {background-color: #f1f1f1;}
    .dd:hover .dd-content { display: block; }
</style>
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
              <li ><a class="drop" href="shop-grid.html"><b>Shop</b></a></li>
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
