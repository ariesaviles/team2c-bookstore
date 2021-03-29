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
          <div class="row">
            <div class="columnL">
              <div class="cardLight">
                <div class="cardDark">
                    <h>First </h>
                    <h class="color--theme" style="margin-top: -50px;"> Last</h>
                </div>
                <p>Username: username420</p>
                <p>E-mail: username420@lmao.com</p>
                <p>Birthdate: 04/20/2021</p>
                <button class="editButton">Edit Info</button>
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
              <p>Saved Payment Options</p>
              <hr class="solid">
              <br>
              <p>Saved Addresses</p>
              <hr class="solid">
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
