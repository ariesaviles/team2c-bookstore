<%@ page language="java" contentType="text/html"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .adminFlair {
            border-style: solid;
            border-color: #e59285;
            height: 13px;
        }

    </style>
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

                <sec:authorize access="!hasAnyAuthority('0','1')">
                <a class='dd-btn active' href='loginOrRegister'>Sign-Up/Login</a>
                </sec:authorize>

                <sec:authorize access="hasAnyAuthority('0','1')">
                 <a class='dd-btn active'>Account</a>

                <div class='dd-content'>
                    <a href='userProfile'>Profile</a>

                    <sec:authorize access="hasAnyAuthority('1')">
                    <a href='adminPanel'>Admin Panel</a>
                    </sec:authorize>

                    <a href='logout'>Logout</a>
                </div>
                </sec:authorize>
            </li>
            <li style='float:right'><a class='active' href='cart'>Your Cart</a></li>
              <sec:authorize access="hasAnyAuthority('1')">
              <li style='float:right'><a class='adminFlair' >ADMINISTRATOR</a></li>
              </sec:authorize>
          </ul>
      </div>
    </div>
  </div>
</header>
