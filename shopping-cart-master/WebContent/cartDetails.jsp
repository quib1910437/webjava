<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Gio Hang</title>
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
	<link rel="icon" type="image/x-icon" href="https://tse2.mm.bing.net/th?id=OIP.8gGjkG-jt1H6KtsCTGCmdAHaE8&pid=Api&P=0&h=180">
</head>
<body style="background-color: #e6f8f9;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}

	String addS = request.getParameter("add");
	if (addS != null) {

		int add = Integer.parseInt(addS);
		String uid = request.getParameter("uid");
		String pid = request.getParameter("pid");
		int avail = Integer.parseInt(request.getParameter("avail"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));
		CartServiceImpl cart = new CartServiceImpl();

		if (add == 1) {
			//Add Product into the cart
			cartQty += 1;
			if (cartQty <= avail) {
		cart.addProductToCart(uid, pid, 1);
			} else {
		response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
			}
		} else if (add == 0) {
			//Remove Product from the cart
			cart.removeProductFromCart(uid, pid);
		}
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Gio Hang Cua Ban
		</div>
	
	<div class="container">

		<table class="table table-hover">
			<thead
				style="background-color: #186188; color: white; font-size: 16px; font-weight: bold;">
				<tr>
					<th>Anh</th>
					<th>San Pham</th>
					<th>Gia</th>
					<th>So Luong</th>
					<th>Them</th>
					<th>Xoa</th>
					<th>VND</th>
				</tr>
			</thead>
			<tbody
				style="background-color: white; font-size: 15px; font-weight: bold;">



				<%
				CartServiceImpl cart = new CartServiceImpl();
				List<CartBean> cartItems = new ArrayList<CartBean>();
				cartItems = cart.getAllCartItems(userName);
				double totAmount = 0;
				for (CartBean item : cartItems) {

					String prodId = item.getProdId();

					int prodQuantity = item.getQuantity();

					ProductBean product = new ProductServiceImpl().getProductDetails(prodId);

					double currAmount = product.getProdPrice() * prodQuantity;

					totAmount += currAmount;

					if (prodQuantity > 0) {
				%>

				<tr>
					<td><img src="./ShowImage?pid=<%=product.getProdId()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=product.getProdName()%></td>
					<td><%=product.getProdPrice()%></td>
					<td><form method="post" action="./UpdateToCart">
							<input type="number" name="pqty" value="<%=prodQuantity%>"
								style="max-width: 70px;" min="0"> <input type="hidden"
								name="pid" value="<%=product.getProdId()%>"> <input
								type="submit" name="Update" value="Update"
								style="max-width: 80px;">
						</form></td>
					<td><a
						href="cartDetails.jsp?add=1&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"><i
							class="fa fa-plus"></i></a></td>
					<td><a
						href="cartDetails.jsp?add=0&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"><i
							class="fa fa-minus"></i></a></td>
					<td><%=currAmount%></td>
				</tr>

				<%
				}
				}
				%>

				<tr style="background-color: grey; color: white;">
					<td colspan="6" style="text-align: center;">Tong tien thanh toan (VND)</td>
					<td><%=totAmount%></td>
				</tr>
				<%
				if (totAmount != 0) {
				%>
				<tr style="background-color: grey; color: white;">
					<td colspan="4" style="text-align: center;">
					<td><form method="post">
							<button formaction="userHome.jsp"
								style="background-color: black; color: white;">Thoat</button>
						</form></td>
					<td colspan="2" align="center"><form method="post">
							<button style="background-color: blue; color: white;"
								formaction="payment.jsp?amount=<%=totAmount%>">Thanh Toan</button>
						</form></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>



	<%@ include file="footer.html"%>

</body>
</html>