<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #bfccd6;">
	
	<div class="container-fluid text-center"
		style="margin-top: 45px; background-color: #3d9ef7; color: white; padding: 5px;">
		<h2>Electronic Lazada Shopee</h2>
		<h6>From CanTho with love !</h6>
		<form class="form-inline" action="index.jsp" method="get">
			<div class="input-group">
				<input type="text" class="form-control" size="50" name="search"
					placeholder="Nhap vao day..." required>
				<div class="input-group-btn">
				  
					 <input type="submit" class="btn btn-danger" value="Tim kiem" />
				</div>
			</div>
		</form>
		<p align="center"
			style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;"
			id="message"></p>
	</div>
	

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>


	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Shopping Mall</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp">Dang Nhap</a></li>
					<li><a href="register.jsp">Dang Ky</a></li>
					<li><a href="index.jsp">San Pham</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Danh Muc <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp?type=mobile">Dien Thoai</a></li>
							<li><a href="index.jsp?type=tv">TVs</a></li>
							<li><a href="index.jsp?type=laptop">Laptops</a></li>
							<li><a href="index.jsp?type=camera">May Anh</a></li>
							<li><a href="index.jsp?type=speaker">Loa</a></li>
							<li><a href="index.jsp?type=tablet">May tinh bang</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Shopping Mall</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="glyphicon glyphicon-home">San Pham</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Danh Muc <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=mobile">Dien Thoai</a></li>
							<li><a href="userHome.jsp?type=tv">TV</a></li>
							<li><a href="userHome.jsp?type=laptop">Laptops</a></li>
							<li><a href="userHome.jsp?type=camera">May Anh</a></li>
							<li><a href="userHome.jsp?type=speaker">Loa</a></li>
							<li><a href="userHome.jsp?type=tablet">May Tinh Bang</a></li>
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Gio Hang
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 5px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding-right: 20px; padding-top:10px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Don Hang</a></li>
					<li><a href="userProfile.jsp">Thong Tin KH</a></li>
					<li><a href="./LogoutSrv">Dang Xuat</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Shopping Mall</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">San Pham</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Danh Muc <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=mobile">Dien Thoai</a></li>
							<li><a href="adminViewProduct.jsp?type=tv">Tvs</a></li>
							<li><a href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
							<li><a href="adminViewProduct.jsp?type=camera">May Anh</a></li>
							<li><a href="adminViewProduct.jsp?type=speaker">Loa</a></li>
							<li><a href="adminViewProduct.jsp?type=tablet">May Tinh Bang</a></li>
						</ul></li>
					<li><a href="adminStock.jsp">Kho Hang</a></li>
					<li><a href="shippedItems.jsp">Da Giao</a></li>
					<li><a href="unshippedItems.jsp">Don Hang</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Cap Nhat SP <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Them San Pham</a></li>
							<li><a href="removeProduct.jsp">Xoa San Pham</a></li>
							<li><a href="updateProductById.jsp">Cap Nhat San Pham</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Dang Xuat</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>

</body>
</html>