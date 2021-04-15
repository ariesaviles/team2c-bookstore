<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html"%>

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
    <style> <%@ include file="css/style.css"%> </style> <!-- main css -->
    <style> <%@ include file="css/userProfile.css"%> </style>
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
                <div class="cardDark">
                    <h>${userID}</h>
                    <h>${firstName} </h>
                    <h class="color--theme" style="margin-top: -50px;"> ${lastName}</h>
                </div>
                <p>Username: ${username}</p>
                <p>E-mail: ${userEmail}</p>
                <p>Birthdate: ${birthDate}</p>
                  <p>Subscribed to Promos: ${isPromotion}</p>
                <button class="editButton" onclick="location.href='editProfile';">Edit Info</button>
              </div>


            </div>

            <div class="columnR">
              <p>Previously Ordered Books</p>
              <hr class="solid">
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


              <br>
              <p style="text-align: right">Saved Payment Options <button class="editButton" style="margin-left: 70px; margin-right: 85px" onclick="location.href='addCard';">Edit Card</button></p>

              <hr class="solid">
                <table id = "table" data-search="true" data-toggle ="table" data-sort-order="desc" class="table table-striped table-hover sortable">
                    <thead>
                    <tr>
                        <th scope="row" data-field="cardType" data-sortable="true">Card Type</th>
                        <th scope="row" data-field="cardHolderName" data-sortable="true">Card Holder</th>
                        <th scope="row" data-field="expirationDate" data-sortable="true">expirationDate</th>


                    </tr>
                    </thead>
                    <%
                        try{
                            connection = DriverManager.getConnection(connectionUrl, userId, password);
                            statement=connection.createStatement();

                            System.out.println("-----------UserProfile-----------");
                            String StringUserID = pageContext.findAttribute("userEmail").toString()''
                            System.out.println(StringUserID);

                            String sql ="SELECT * FROM card c WHERE c.user_IDuser = " + StringUserID;

                            resultSet = statement.executeQuery(sql);

                            int cardLimit = 0;
                            while(resultSet.next() ){
//                                System.out.println("-----------cardLimit-----------");
//                                System.out.println("out:" + cardLimit);
                                cardLimit++;
                                if(cardLimit < 3) {
//                                    System.out.println("in:" + cardLimit);
                    %>

                        <tr>
                            <td><p><%=resultSet.getString("cardType") %></p></td>
                            <td><p><%=resultSet.getString("cardHolderName") %></p></td>
                            <td><p><%=resultSet.getString("expirationDate") %></p></td>
                        </tr>

                    <%
                                } // if
                            } // while

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </table>
              <br>
                <p style="text-align: right">Saved Addresses <button class="editButton" style="margin-left: 70px; margin-right: 85px" onclick="location.href='addAddress';">Edit Address</button></p>
              <hr class="solid">
                <table id = "table" data-search="true" data-toggle ="table" data-sort-order="desc" class="table table-striped table-hover sortable">
                    <thead>
                    <tr>
                        <th scope="row" data-field="street" data-sortable="true">Street</th>
                        <th scope="row" data-field="city" data-sortable="true">City</th>
                        <th scope="row" data-field="state" data-sortable="true">State</th>
                        <th scope="row" data-field="zipCode" data-sortable="true">Zip Code</th>
                    </tr>
                    </thead>
                        <c:forEach items="${addressTable}" var="address">
                            <tr>
                                <td>${address.street}</td>
                                <td>${address.city}</td>
                                <td>${address.state}</td>
                                <td>${address.zipCode}</td>
                            </tr>
                        </c:forEach>
                    </table>


              <br>

            </div>

          </div>
        </div>

        <!-- Footer --->
        <jsp:include page="components/footer.jsp"/>


		<!-- END QUICKVIEW PRODUCT -->
	</div>

</body>
</html>
