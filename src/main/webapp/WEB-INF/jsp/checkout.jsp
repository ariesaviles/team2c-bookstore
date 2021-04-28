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
<body>

<div class="wrapper" id="wrapper">
	<!-- Header -->
	<jsp:include page="components/header.jsp"/>


	<div class="bodytext" style="height: 800px">
    <h2 style="margin-top: 100px; margin-left: 2%; font-size: 30pt;">Place Order</h2>
        <%--@elvariable id="orderForm" type=""--%>
        <form:form method="POST" modelAttribute="orderForm">
    <div class="paymentSection" >
      <div class="shippingHeader">
    <h2 class="mainLabel">Shipping Address</h2>
  </div>
        <div class="shippingBody">
                <c:forEach items="${addressTable}" var="address">

                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                    <label class="form-check-label" for="exampleRadios1">
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
                <c:forEach items="${cardTable}" var="cards">

                    <input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios1" value="option1" checked>
                    <label class="form-check-label" for="exampleRadios1">
                            ${cards.cardHolderName} ${cards.cardType}
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
            <div class="shippingSection" style="height: 200px;">
    		<h2 class="mainLabel" style="margin-top: 10px; margin-left: 10%">Cart </h2>
            <table id = "table" data-search="true" data-toggle ="table" data-sort-order="desc" class="table table-striped table-hover sortable">
                <thead>
                <tr>
                    <th scope="row" data-field="title" data-sortable="true">Title</th>
                    <th scope="row" data-field="authors" data-sortable="true">Author</th>
                    <th scope="row" data-field="sellPrice" data-sortable="true">Price</th>
                </tr>
                </thead>
                <c:forEach items="${cartForm}" var="usercart">
                    <tr>
                        <td>${usercart.title}</td>
                        <td>${usercart.authors}</td>
                        <td>${usercart.price}</td>
                    </tr>
                </c:forEach>
            </table>
            </div>
      </div>

        <div class="columnR">
        <div class="shippingSection" style="height: 200px;">
        		<h2 class="mainLabel" style="margin-top: 10px;">Order Summary</h2>
            <div class="paymentMethodItems">
                  <div class="form-check">
                    <p>Total before promos: ${total}</p>
                  <div class="divider-line-x" style="width: 75%; margin-left: 5%"></div>
                      <form:label path="promotion_IDpromotion.promocode">Promo code: </form:label>
                      <form:input type="text" class="springInput" id="promotion_IDpromotion.promocode" placeholder="Promo code" path="promotion_IDpromotion.promocode"/><br/>
                  <br>
                      <form:button type="submit" class="from-control">Place Order</form:button>
              </div>
            </div>
          </div>

          </div>
	</div>

</form:form>


	<!-- Footer --->
 	<jsp:include page="components/footer.jsp"/>
</div>
</div>

</body>
</html>
