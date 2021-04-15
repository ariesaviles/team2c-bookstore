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
    <style> <%@ include file="css/userProfile.css"%> </style>
</head>

<body>
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>

    <div class="mainBody">
        <table id = "table" data-search="true" data-toggle ="table" data-sort-order="desc" class="table table-striped table-hover sortable">
            <thead>
            <tr>
                <th scope="row" data-field="promocode" data-sortable="true">Promo Code</th>
                <th scope="row" data-field="discount" data-sortable="true">Discount</th>
                <th scope="row" data-field="dateStart" data-sortable="true">Start Date</th>
                <th scope="row" data-field="dateEnd" data-sortable="true">End Date</th>
                <th scope="row" data-field="hasSent" data-sortable="true">Has Been Sent</th>
                <th scope="row"  data-sortable="true">Edit</th>
                <th scope="row"  data-sortable="true">Delete</th>
            </tr>
            </thead>
            <c:forEach items="${promoForm}" var="promo">
                <tr>
                    <td>${promo.promocode}</td>
                    <td>${promo.discount}</td>
                    <td>${promo.dateStart}</td>
                    <td>${promo.dateEnd}</td>
                    <td style="padding-left: 35px"><a href="/sendEmail?promocode=${promo.promocode}" ><button class="btn btn-primary">
                        <p>${promo.hasSent == 1 ? 'Yes' : 'No'}</p>
                    </button></a></td>
                    <td><a href="/editPromo?promocode=${promo.promocode}"><button class="btn btn-primary">
                        <p> Edit </p>
                    </button></a></td>
                    <td><a href="/deletePromo?promocode=${promo.promocode}"><button class="btn btn-primary">
                        <p> Delete </p>
                    </button></a></td>
                </tr>
            </c:forEach>
        </table>
        <div  style="text-align: center; padding-top: 30px">
        <td ><a href="/adminAddPromo"><button class="btn btn-primary">
            <p>Create New Promo</p>
        </button></a></td>
        </div>
    </div>


    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>


    <!-- END QUICKVIEW PRODUCT -->
</div>

</body>
</html>