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
        <table id = "table" data-search="true" data-toggle ="table" data-sort-order="desc" class="">
            <thead>
            <tr>
                <th scope="row" data-field="firstName" data-sortable="true">First Name</th>
                <th scope="row" data-field="lastName" data-sortable="true">Last Name</th>
                <th scope="row" data-field="userName" data-sortable="true">Username</th>
                <th scope="row" data-field="email" data-sortable="true">Email</th>
                <th scope="row" data-field="birthDate" data-sortable="true">Date of Birth</th>
                <th scope="row" data-field="userStatus" data-sortable="false">User Status</th>
                <th scope="row" data-field="isAdmin" data-sortable="false">Admin Status</th>
            </tr>
            </thead>
        <c:forEach items="${accountForm}" var="account">
            <tr>
                <td>${account.firstName}</td>
                <td>${account.lastName}</td>
                <td>${account.userName}</td>
                <td>${account.email}</td>
                <td>${account.birthDate}</td>
                <td><a href="/changeStatus?email=${account.email}"><button class="btn btn-primary">
                    <p> ${account.userState}</p>
                  </button></a></td>
                <td><a href="/changeAdminStatus?email=${account.email}"><button class="btn btn-primary">
                    <p> ${account.isAdmin}</p>
                </button></a></td>
            </tr>
        </c:forEach>
        </table>
    </div>

    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>


    <!-- END QUICKVIEW PRODUCT -->
</div>

</body>
</html>