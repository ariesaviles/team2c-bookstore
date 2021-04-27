<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%
//    String searchTerm = request.getParameter("searchTerm");
//    System.out.println(searchTerm);

    String id = request.getParameter("userId");
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/mydb";
    //String dbName = "mydb";
    String userId = "adminuser";
    String password = "password";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

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

    <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/mydb"
                   user="adminuser"  password="password"/>

    <sql:query dataSource="${snapshot}" var="sql">
    SELECT * from book;
    </sql:query>
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

                <div class="input-group">
<%--                    <form onclick="document.getElementById('searchTerm').value" method="POST">--%>
                        <input type="search" id="searchTerm" name="searchTerm" style="width: 300px; margin-left: 30%;" class="form-control rounded" placeholder="Search by Title, Author, Category..." aria-label="Search"/>

                        <select class="form-control form-control-sm" id="exampleFormControlSelect2" style="width: 70px; height: 20px; margin-right: 5px; margin-top: 4px; margin-left: 5px;">
                            <option>Title</option>
                            <option>Author</option>
                            <option>Category</option>
                            <option>ISBN</option>
                        </select>

                        <button type="submit" onclick="location.href=document.getElementById('searchTerm').value">

<%--                        <a href="/searchBy?term="><button class="btn btn-primary">--%>
<%--                            <p> Search</p>--%>
<%--                        </button></a>--%>
                </div>

                <hr class="solid" style="width: 90%;">
                <div class="orderHistory">
                    <p>For page is for testing purposes: this currently displays ALL the book titles in the database. see search.jsp</p>
                    <c:forEach var="book" items="${sql.rows}">

                            <td><c:out value="${book.title}" /></td>

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