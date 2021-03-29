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
    <style> <%@ include file="css/shop.css"%> </style>

</head>
<body>
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="comps/header.jsp"/>

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
                <p>shop</p>
                <hr class="solid" style="width: 90%;">
                <div class="orderHistory">
                    <table class="cartTable">
                        <tbody>
                        <div class="addToCart">
                            <tr>
                                <td>
                                    <div id="cart_square">
                                        <img src="images/8.jpg" id="cartImage"/>
                                    </div>
                                </td>
                                <td class="prodName">Test Name</td>
                            </tr>
                        </div>
                        </tbody>
                    </table>

                </div>


            </div>

        </div>
    </div>

    <!-- Footer --->
    <jsp:include page="comps/footer.jsp"/>


    <!-- END QUICKVIEW PRODUCT -->
</div>

</body>
</html>
