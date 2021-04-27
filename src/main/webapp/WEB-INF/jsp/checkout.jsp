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

	<style>
	</style>
</head>
<body>

<div class="wrapper" id="wrapper">
	<!-- Header -->
	<jsp:include page="components/header.jsp"/>


	<div class="bodytext" style="height: 800px">
    <h2 style="margin-top: 100px; margin-left: 2%; font-size: 30pt;">Place Order</h2>

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

          <div class="form-check shippingItems">
            <div class="">
              <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                <label for="">New Shipping Address</label>
              </div>
              <div class="newFormRow">
                  <input type="text" class="fields" placeholder="Street Address" style="width: 200px">
                  <input type="text" class="fields" placeholder="City" style="width: 100px">
                  <input type="text" class="fields" placeholder="State" style="width: 50px">
                  <input type="text" class="fields" placeholder="Zip" style="width: 70px">
              </div>
          </div>
        </div>
      </div>


<br>
<div class="paymentSection" style="height: 200px;">
		<h2 class="mainLabel" style="margin-top: 50px;">Payment Method</h2>
    <div class="paymentMethodItems">
          <div class="form-check">
            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
            <label class="form-check-label" for="exampleRadios1">
              Card info #1
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
            <label class="form-check-label" for="exampleRadios2">
              Card info #2
            </label>
          </div>
          <div class="form-check disabled">
            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3" disabled>
            <label class="form-check-label" for="exampleRadios3">
              Add new card information
            </label>
          </div>
      </div>
    </div>

      <div class="divider-line-x" style="width: 75%; margin-left: 13%"></div>

      <div class="row">
        <div class="columnL">
    		<h2 class="mainLabel" style="margin-top: 10px; margin-left: 10%">Cart </h2>
        <p> table of books similar to cart right here</p>
      </div>

        <div class="columnR">
        <div class="shippingSection" style="height: 200px;">
        		<h2 class="mainLabel" style="margin-top: 10px;">Order Summary</h2>
            <div class="paymentMethodItems">
                  <div class="form-check">
                    <p>add info about total here</p>
                  <div class="divider-line-x" style="width: 75%; margin-left: 5%"></div>
                  Promo Code
                  <input type="text" class="fields" placeholder="Enter Code" style="width: 200px">
                  <br>
                  <button class="editButton" style="margin-top: 2%">Place Order</button>
              </div>
            </div>
          </div>

          </div>
	</div>
<


	<!-- Footer --->
 	<jsp:include page="components/footer.jsp"/>

</div>

</body>
</html>
