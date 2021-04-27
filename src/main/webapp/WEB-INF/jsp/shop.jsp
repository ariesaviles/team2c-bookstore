<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
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
                    <%

//                        if (request.getParameter("name") == null) {
//                            out.println("Please enter your name.");
//                        } else {
//                            out.println("Hello <b>"+request. getParameter("name")+"</b>!");
//                        }

                        try{
                            connection = DriverManager.getConnection(connectionUrl, userId, password);
                            statement=connection.createStatement();
                            String sql ="SELECT * FROM book;";

                            resultSet = statement.executeQuery(sql);
                            while(resultSet.next()){
                    %>

                    <div class="indexBook">
                        <div class="bookImg">
                            <a>
                                <img class="cover" src="<%=resultSet.getString("Cover_Picture") %>" width="" height="250" alt="product image">
                            </a>
                        </div>

                        <div class="bookLabel">
                            <h4><a href="test"> <%=resultSet.getString("Title") %> </a> <br> <a href="test"> <%=resultSet.getString("Authors_Names") %> </a></h4>
                            <p>$<%=resultSet.getString("Selling_Price") %>.99</p>

                        </div>

                        <div class="action" style="position: relative; bottom: 0">
                            <button class="editButton" onclick="location.href='editProfile';">Add to Cart</button>
                        </div>
                    </div>

                    <%
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>


                </div>


            </div>

        </div>
    </div>

    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>

</div>

</body>
</html>
