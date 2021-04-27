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
<body>
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>

    <div class="mainBody">
        <div class="row">
            <div class="columnL">
                <div class="cardLight">
                    <p>Book Categories</p>
                    <hr class="solid" style="width: 95%">
                    <p class="category">Action & Adventure</p>
                    <hr class="dashed" style="width: 90%">
                    <p class="category">Classics</p>
                    <hr class="dashed" style="width: 90%">
                    <p class="category">Cooking</p>
                    <hr class="dashed" style="width: 90%">
                    <p class="category">Fantasy</p>
                    <hr class="dashed" style="width: 90%">
                    <p class="category">Self Improvement</p>
                    <hr class="dashed" style="width: 90%">

                </div>


            </div>

            <div class="columnR">

                <%--@elvariable id="searchForm" type=""--%>
                <form:form method="POST" modelAttribute="searchForm">
                    <div class="MyForm form-group" style="padding-top: 100px;">
                        <form:label path="title">Search:</form:label>
                        <form:input type="title" class="springInput" id="title" path="title"/><br/>

                        <form:button type="submit" class="from-control">Submit</form:button>
                    </div>
                </form:form>
                        <%--                        <a href="/searchBy?term="><button class="btn btn-primary">--%>
                        <%--                            <p> Search</p>--%>
                        <%--                        </button></a>--%>
                </div>

                <hr class="solid" style="width: 90%;">
                <div class="orderHistory">

        <c:forEach items="${bookForm}" var="book">
                    <div class="indexBook">
                        <div class="bookImg">
                            <a>
                                <img class="cover" src="${book.imgLink}" width="" height="250" alt="product image">
                            </a>
                        </div>

                        <div class="bookLabel">
                            <h4><a href="test"> ${book.title} </a> <br> <a href="test"> ${book.authors} </a></h4>
                            <p>$<${book.price}</p>

                        </div>

                        <div class="action" style="position: relative; bottom: 0">
                            <button class="editButton" onclick="location.href='editProfile';">Add to Cart</button>
                        </div>
                    </div>
        </c:forEach>

                </div>


            </div>

        </div>
    </div>

    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>

</div>

</body>
</html>
