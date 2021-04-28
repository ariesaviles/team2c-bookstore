<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%
	String id = request.getParameter("userId");
	String driverName = "com.mysql.cj.jdbc.Driver";
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
<html>

<meta charset="utf-8">

<head>
	<meta charset="utf-8">
	<title>Team 2C Books</title>

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style> <%@ include file="css/style.css"%> </style>
	<style> <%@ include file="css/shop.css"%> </style>
	<style>
	.bottom-right {
		position: absolute;
		bottom: 8px;
		right: 16px;
		color: white;
		background-color: #e59285;
		padding: 5px;
	}
	a {
		cursor: pointer;
	}
	</style>
</head>
<body style="background-color: #F0F0F0">
<%--@elvariable id="accountForm" type=""--%>
<div class="wrapper" id="wrapper">
	<!-- Header -->
	<jsp:include page="components/header.jsp"/>

	<!---------------  large image at the top ----------------->
	<div class="indexImage">
		<img class= "bigBoy" src="../../images/books2.png" id="logo" alt="Team2c Large Image" width="100%">
<%--	<img class= "bigBoy" src="https://imaginarybookstack.com/wp-content/uploads/2018/02/book-stack-me-challenge-1.jpg" id="logo" alt="Team2c Large Image" width="100%">--%>
		<sec:authorize access="hasAnyAuthority('1')">
		<div class="bottom-right"><i class="fa fa-cog" style="font-size:20px;"> Edit</i></div>
		</sec:authorize>
	</div>


	<!-- Start Feat Read -->
	<section class="indexFeaturedReads">
		<div class="container">
			<div class="row">
				<div class="indexText">
<%--					<sec:authorize access="hasAnyAuthority('1')">--%>
<%--						<div style="position: inherit; color: black; border-style: solid; border-color: #e59285;padding: 5px; "><i class="fa fa-cog" style="font-size:20px;"> Edit</i></div>--%>
<%--					</sec:authorize>--%>
					<h2 class="indexH2">Featured <span class="color--theme">Reads</span></h2>

					<p><span class="color--dark">Featured books are the current books that have been rapidly getting more popular.</span></p>
				</div>
			</div>

			<!-- Start Single Tab Content -->
			<div class="row" style="margin-left: 10px">

					<%
						try{
							connection = DriverManager.getConnection(connectionUrl, userId, password);
							statement=connection.createStatement();
							String sql ="SELECT * FROM book;";

							resultSet = statement.executeQuery(sql);
							for(int i = 0; i < 16; i++) {
								resultSet.next();
							}
							for(int i = 0; i < 4; i++) {
					%>

					<!--            BOOK           -->
					<div class="bookBox">
						<div class="bookImg" style="margin-top: 30px;">
							<a>
								<img class="cover" onclick="location.href='bookPage?title=<%=resultSet.getString("Title") %>';" src="<%=resultSet.getString("Cover_Picture") %>" width="" height="250" alt="product image">
							</a>
						</div>

						<div class="bookLabel">
							<h4><a onclick="location.href='bookPage?title=<%=resultSet.getString("Title") %>';" > <%=resultSet.getString("Title") %> </a>
								<br> <a onclick="location.href='bookPage?title=<%=resultSet.getString("Title") %>';" > <%=resultSet.getString("Authors_Names") %> </a></h4>
								<p>$<%=resultSet.getString("Selling_Price") %></p>

						</div>

						<div class="action" style="position: relative; bottom: 0">
							<button class="editButton" onclick="location.href='addToCart?title=<%=resultSet.getString("Title") %>&qty=1';">Add to Cart</button>
						</div>
					</div>

					<%
					        resultSet.next();
							}

						} catch (Exception e) {
							e.printStackTrace();
						}
					%>


			</div>
			<!-- End Feat Read Content -->
		</div>
	</section>

	<div class="bodytext">
			<p style="font-family: Roboto;"> "Team 2C Books has amazing delivery and the best books I've ever seen on the Internet. I can't wait to keep ordering from them"</p>
			<div class="inside">
				<p>- Brad Barnes </p>
			</div>
	</div>

	<!-- Start New Arrivals -->
	<section class="indexNewArrivals">
		<div class="container">
			<div class="row">
				<div class="indexText">
<%--					<sec:authorize access="hasAnyAuthority('1')">--%>
<%--						<div style="position: inherit; color: black; border-style: solid; border-color: #e59285;padding: 5px; "><i class="fa fa-cog" style="font-size:20px;"> Edit</i></div>--%>
<%--					</sec:authorize>--%>
					<h2 class="indexH2">New <span class="color--theme">Arrivals</span></h2>

					<p><span class="color--dark">These are the books that just arrived this month, check them out!</span></p>
				</div>
			</div>

			<div class="row">

            					<%
            						try{
            							connection = DriverManager.getConnection(connectionUrl, userId, password);
            							statement=connection.createStatement();
            							String sql ="SELECT * FROM book;";

            							resultSet = statement.executeQuery(sql);
            							for (int i = 0; i < 12; i++) {
											resultSet.next();
										}
            							for (int i = 0; i < 4; i++) {
            								resultSet.next();
            					%>

					<!--            BOOK           -->
					<div class="bookBox">
						<div class="bookImg" style="margin-top: 30px;">
							<a>
								<img class="cover" onclick="location.href='bookPage?title=<%=resultSet.getString("Title") %>';" src="<%=resultSet.getString("Cover_Picture") %>" width="" height="250" alt="product image">
							</a>
						</div>

						<div class="bookLabel">
							<h4><a onclick="location.href='bookPage?title=<%=resultSet.getString("Title") %>';" > <%=resultSet.getString("Title") %> </a>
								<br> <a onclick="location.href='bookPage?title=<%=resultSet.getString("Title") %>';" > <%=resultSet.getString("Authors_Names") %> </a></h4>
							<p>$<%=resultSet.getString("Selling_Price") %></p>

						</div>

						<div class="action" style="position: relative; bottom: 0">
							<button class="editButton" onclick="location.href='addToCart?title=<%=resultSet.getString("Title") %>&qty=1';">Add to Cart</button>
						</div>
					</div>

            					<%
            							}

            						} catch (Exception e) {
            							e.printStackTrace();
            						}
            					%>


            			</div>
			<!-- End New Arrival Content -->
		</div>
	</section>


	<!-- Footer --->
	<jsp:include page="components/footer.jsp"/>

</div>

</body>
</html>
