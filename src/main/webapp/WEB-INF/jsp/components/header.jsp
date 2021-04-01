<%@ page language="java" contentType="text/html"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

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

                <sec:authorize access="!hasAnyRole('USER','ADMIN')">
                <a class='dd-btn active' href='loginOrRegister'>Sign-Up/Login</a>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('USER','ADMIN')">
                 <a class='dd-btn active' href='login'>Account</a>
                </sec:authorize>

                <div class='dd-content'>
                    <sec:authorize access="hasRole('USER')">
                    <a href='userProfile'>Profile</a>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ADMIN')">
                    <a href='admin_page.html'>Admin Panel</a>
                    </sec:authorize>

                    <sec:authorize access="hasAnyRole('USER','ADMIN')">
                    <a href='logout'>Logout</a>
                    </sec:authorize>
                </div>

            </li>
            <li style='float:right'><a class='active' href='cart.html'>Your Cart</a></li>

          </ul>
      </div>
    </div>
  </div>
</header>
