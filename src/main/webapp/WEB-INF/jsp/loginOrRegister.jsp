<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value=""/>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Team 2C Books</title>

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <style> <%@ include file="css/style.css"%> </style>
    <style> <%@ include file="css/userProfile.css"%> </style>
    <style>
        hr.solid {
            border-top: 3px solid #bbb;
            width: 500px;
        }

    </style>
</head>
<body>
<!-- Main wrapper -->
<div class="wrapper" id="wrapper" style="margin-bottom: 20px;">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>

    <div class="cardLight" style="padding-top: 200px; padding-bottom: 100px; margin-bottom: 100px;">
    <p>Already have an account?</p> <p> <button class="editButton" style="margin-left: 70px; margin-right: 85px" onclick="location.href='/login';">Click here to Login.</button></p>
        <p style="padding-top: 20px; color:  #009879;" >Forgot password?</p> <p><button class="editButton" style="margin-left: 70px; margin-right: 85px; margin-bottom: 20px;" onclick="location.href='/changePasswordEmail';">Create new password here.</button></p>
        <hr class="solid">
        <p style="padding-top: 20px;">Are you a new user?</p> <p><button class="editButton" style="margin-left: 70px; margin-right: 85px" onclick="location.href='/registration';">Click Here to Register</button> </p>
    </div>

    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>
</div>
<!-- //Main wrapper -->
</body>
</html>
