<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style> <%@ include file="css/forms.css"%> </style>
<style> <%@ include file="css/userProfile.css"%> </style>

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
<body style="background-color: #f0f0f0">

<div class="wrapper" id="wrapper" style="margin-top: 130px;">
	<!-- Header -->
	<jsp:include page="components/header.jsp"/>


	<div class="bodytext" style="height: 800px; width: 90%; margin-left: 5%; height: auto;">
    <h2 style="margin-top: 10px; margin-left: 5%; font-size: 30pt;">Place Order</h2>
        <%--@elvariable id="orderForm" type=""--%>

    <div class="paymentSection" >
      <div class="shippingHeader">
    <h2 class="mainLabel">Shipping Address</h2>
    </div>
        <div class="shippingBody">
                <c:forEach items="${addressTable}" var="address">

                    <input  id="selectedAddress" value="${address.idAddress}" class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                    <label for="exampleRadios1">
                            ${address.street} ${address.city} ${address.state} ${address.zipCode}
                    </label>
                    <br>
                </c:forEach>


          <div class="divider-line-x" style="margin-left: 20%"><span> or </span></div>

              <button class="editButton" style="margin-left: 70px; margin-right: 85px" onclick="location.href='addAddress';">Add Address</button>

        </div>
      </div>


<br>
        <div class="paymentSection" >
            <div class="shippingHeader">
                <h2 class="mainLabel">Payment Method</h2>
            </div>
            <div class="shippingBody">
                <c:forEach items="${cardTable}" var="card">
                    <input  id="selectedCard" value="${card.idCard}" class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios1" value="option1" checked>
                    <label  for="exampleRadios1">
                            ${card.cardHolderName} ${card.cardType}
                    </label>
                    <br>
                </c:forEach>
                <div class="divider-line-x" style="margin-left: 20%"><span> or </span></div>
                <button class="editButton" style="margin-left: 70px; margin-right: 85px" onclick="location.href='addCard';">Add Card</button>
            </div>
        </div>

      <div class="divider-line-x" style="width: 75%; margin-left: 13%"></div>

      <div class="row">
        <div class="columnL">
            <div class="shippingSection" style="height: auto; width: 400px; ">
    		<h2 class="mainLabel" style="margin-top: 10px; margin-left: 10%; text-align: center">Cart </h2>
            <table id = "table" data-search="true" style="font-family: Roboto">
                <thead>
                <tr>
                    <th scope="row" data-field="title" data-sortable="true">Title</th>
                    <th scope="row" style="text-align: left">Author</th>
                    <th scope="row" style="text-align: left">Price</th>
                    <th scope="row" style="text-align: left">Quan.</th>
                </tr>
                </thead>

                <c:forEach items="${cartForm}" var="usercart">
                    <tr >
                        <td style="padding: 10px;">${usercart.book.title}</td>
                        <td>${usercart.book.authors}</td>
                        <td>${usercart.book.price}</td>
                        <td>${usercart.count}</td>
                    </tr>
                </c:forEach>
            </table>
            </div>
      </div>
<%--    localhost:8080/confirmCheckout?address=+&card=+&promo=+ --%>

        <div class="columnR">
        <div class="shippingSection" style="height: 200px;">
        		<h2 class="mainLabel" style="margin-top: 10px; text-align: center">Order Summary</h2>
            <div class="paymentMethodItems">
                  <div class="form-check">
                    <p>Total before promos: ${total}</p>
                  <div class="divider-line-x" style="width: 75%; margin-left: 5%"></div>
                      Promo Code
                      <input id="selectedPromo" type="text" class="fields" placeholder="Enter Code" style="width: 200px"><br/>
                  <br>
<%--                      ocalhost:8080/confirmCheckout?address=+&card=+&promo=+--%>
                      <button class="editButton" onclick="location.href='confirmCheckout?address='+document.getElementById('selectedAddress').value+'&card='+document.getElementById('selectedCard').value+'&promo='+document.getElementById('selectedPromo').value;">Place Order</button>
              </div>
            </div>
          </div>

          </div>
	</div>




	<!-- Footer --->
 	<jsp:include page="components/footer.jsp"/>
</div>
</div>

</body>
</html>
