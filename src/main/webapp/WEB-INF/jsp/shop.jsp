<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html"%>



<!doctype html>
<head>
    <meta charset="utf-8">
    <title>Team 2C Books</title>

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style> <%@ include file="css/style.css"%> </style> <!-- main css -->
    <style> <%@ include file="css/shop.css"%> </style>

</head>
<body style="background-color: #F0F0F0">
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>

    <div class="mainBody">
        <div class="row"><h2 style="margin-top: 10px; margin-left: 2%; font-size: 30pt;">Browse Books</h2>
            <input type="search" id="searchTerm" name="searchTerm" style="width: 40%; height: 40%; margin-left: 20%; margin-top: 30px;" class="" placeholder="Search by Title, Author, Category..." aria-label="Search"/>
            <button type="submit" onclick="location.href='/shop?title=' + document.getElementById('searchTerm').value" style="height: 40%; margin-top: 30px;">Submit</button>
        </div>

        <div class="row" style="margin-top: 10px;">
            <div class="columnL">

                <div class="shippingSection">
                    <div class="categories">
                    <p style="padding-top: 30px;">Popular Categories</p>
                    <hr class="solid ticket" style="width: 85%">

                    <p class="category" onclick="location.href='/shop?title=Action'" style="cursor: pointer;">Action</p>
                    <hr class="dashed" style="width: 90%">
                        <p class="category" onclick="location.href='/shop?title=Cooking'" style="cursor: pointer;">Cooking</p>
                    <hr class="dashed" style="width: 90%">
                        <p class="category" onclick="location.href='/shop?title=Fantasy'" style="cursor: pointer;">Fantasy</p>
                    <hr class="dashed" style="width: 90%">
                        <p class="category" onclick="location.href='/shop?title=Fiction'" style="cursor: pointer;">Fiction</p>
                    <hr class="dashed" style="width: 90%">
                        <p class="category" onclick="location.href='/shop?title=Personal'" style="cursor: pointer;">Personal</p>
                    <hr class="dashed" style="width: 90%">
                        <p class="category" onclick="location.href='/shop?title='" style="cursor: pointer;">Show All</p>
                        <hr class="dashed" style="width: 90%">
                    </div>
                </div>

            </div>

            <div class="columnR">

                    <div class="grid-container">
                        <c:forEach items="${bookForm}" var="book">
                            <div class="bookBox">
                                <div class="bookImg" style="margin-top: 30px;">
                                    <a>
                                        <img class="cover" onclick="location.href='bookPage?title=${book.title}';" src="${book.imgLink}" width="" height="250" alt="product image">
                                    </a>
                                </div>

                                <div class="bookLabel">
                                    <h4><a href="test" style=""> ${book.title} </a> <br> <br>By ${book.authors} </h4>
                                    <p style="font-size: 20px;">$${book.price}</p>

                                </div>

                                <div class="action" style="position: relative; bottom: 0">
                                    <button class="editButton" onclick="location.href='addToCart?title=${book.title}&qty=1';">Add to Cart</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


            </div>




            </div>

        </div>
    </div>

    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>

</div>

</body>
</html>
