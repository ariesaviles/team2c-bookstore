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
    <style> <%@ include file="css/style.css"%> </style> <!-- main css -->
    <style> <%@ include file="css/cart.css"%> </style>
</head>

<body style="background-color: #F0F0F0">
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>

    <div class="mainBody" style="min-height: 500px; height: auto;">

        <div class="row">
        <div class="columnL">
            <h2 style="margin-top: 10px; margin-left: 2%; font-size: 30pt;">Shopping Cart</h2>
            <div class="cartSection">

                <table class="styled-table">
                    <thead style="">
                    <tr>
                        <th scope="row" > </th>
                        <th scope="row" >Title</th>
                        <th scope="row" >Author</th>
                        <th scope="row" >Price</th>
                        <th scope="row" > </th>
                    </tr>
                    </thead>

                    <c:forEach items="${cartForm}" var="usercart">
                        <tr>
                            <td>
                            <div id="cart_square">
                                <img src="${usercart.imgLink}" id="cartImage"/>
                            </div>
                            </td>
                            <td>${usercart.title}</td>
                            <td>${usercart.authors}</td>
                            <td>$${usercart.price}</td>
                            <td><a href="/removeFromCart?title=${usercart.title}"><button class="btn btn-primary">
                                <p> Remove </p>
                            </button></a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
            <div class="columnR">
                <div class="orderSection">
                    <h2 style="font-size: 20pt;">Summary</h2>
                <p>Total: $${total}</p>

                    <div class="divider-line-x" style="margin-left: 25%"></div>

                <button class="editButton" onclick="location.href='checkout';">Proceed to Checkout</button>
                </div>
            </div>
        </div>


    </div>
    </div>



    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>


    <!-- END QUICKVIEW PRODUCT -->
</div>

</body>
</html>