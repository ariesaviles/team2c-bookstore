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
</head>
<body>
<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <jsp:include page="components/header.jsp"/>

<form:form method="POST" modelAttribute="accountForm">
    <span style="color: red">${passwordMessage}</span>
    <form:label path="password">Password:</form:label>
    <form:password class="springInput" id="firstName" path="firstName"/>

    <form:label path="password">Re-Enter Password:</form:label>
    <form:password class="springInput" id="lastName" path="lastName"/>

    <form:button type="submit" class="from-control">Submit</form:button>
</form:form>

    <!-- Footer --->
    <jsp:include page="components/footer.jsp"/>
</div>
<!-- //Main wrapper -->
</body>
</html>