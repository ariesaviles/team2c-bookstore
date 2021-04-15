<!doctype html>
<head>
    <meta charset="utf-8">
    <title>Team 2C Books</title>

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <style> <%@ include file="css/style.css"%> </style>
    <style> <%@ include file="css/userProfile.css"%> </style>
</head>
<body>
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>
    <div style="width: 50%; margin: 50px; margin-top: 120px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); padding: 16px;background-color: #fff;">
        <div class="cardDark">
            <h>Edit</h>
            <h class="color--theme" style="margin-top: -50px;"> User Info</h>
        </div>


    <div id="register" style="padding-top: 100px;">
        <jsp:include page="components/forms/editProfileForm.jsp"/>
    </div>
    </div>


    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>
</div>
<!-- //Main wrapper -->
</body>
</html>