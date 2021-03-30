<%@ page import="java.sql.*" %>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Login Error</title>

</head>

<body>

<center><p style="color:red">Sorry, your record is not available.</p></center>

<%

    request.getServletContext().getRequestDispatcher("/home.jsp").include(request,
            response);

%>

</body>

</html>