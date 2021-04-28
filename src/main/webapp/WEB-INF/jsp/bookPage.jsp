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
  <style> <%@ include file="css/bookPage.css"%> </style>
</head>
<body>
	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		<!-- Header -->
		<jsp:include page="components/header.jsp"/>

<div class="mainBody">
  <div class="columnL" >
    <div class="bookIMG" style="position: absolute;  z-index:0 ">

      <img src="${imageURL}" id="layer1" alt="product image" style="margin-left: 30%; height: 600px; padding-bottom: 10px; z-index:0;">

    </div>
  </div>

  <div class="cardLight" style="margin-top: 50px;">
  <div class="row" style="position: relative;">
    <div class="columnL" style="width:500px"></div>
    <div class="columnR" style="overflow: hidden; margin-left: 35%">
      <div class="information" style="position: absolute; width: 30%">
      <p class="bookGenre">${category}</p>
      <p class="bookTitle">${title}</p>
      <p class="bookAuthor">${authors} ${isbn}</p>
      <div class="row" style="margin-bottom: 40px;">
      <select class="form-control form-control-sm" id="qtySelect" style="width: 70px; height: 40px; margin-right: 20px; margin-top: 4px; margin-left: 20px;">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
      </select>
      <button class="editButton" onclick="location.href='addToCart?title=${title}&qty=' + document.getElementById('qtySelect').value;">Add to Cart</button>
    </div>
      <p class="bookDesc"> ${description} </p>
      </div>
    </div>
  </div>
</div>
	 <!-- Footer --->
		<jsp:include page="components/footer.jsp"/>


	</div>

</body>
</html>
