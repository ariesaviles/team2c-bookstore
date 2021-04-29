<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<meta charset="utf-8">

<head>
    <meta charset="utf-8">
    <title>Team 2C Books</title>

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style> <%@ include file="css/style.css"%> </style>
    <style> <%@ include file="css/checkout.css"%> </style>
    <style> <%@ include file="css/userProfile.css"%> </style>

    <style>
    </style>
</head>
<body>

<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>


    <div class="bodytext" style="height: 800px">
        <h2 style="margin-top: 100px; margin-left: 2%; font-size: 30pt;">Order Complete!</h2>







        <!-- Footer --->
        <jsp:include page="components/footer.jsp"/>
    </div>
</div>

</body>
</html>