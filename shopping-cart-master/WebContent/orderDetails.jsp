<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Don Hang</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/changes.css">
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

	OrderService dao = new OrderServiceImpl();
	List<OrderDetails> orders = dao.getAllOrderDetails(userName);
	%>



	<jsp:include page="header.jsp" />

	
	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">DON HANG DA DAT</div>

	<div class="container">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: black; color: white; font-size: 14px; font-weight: bold;">
					<tr>
						<th>Anh</th>
						<th>Ten San Pham</th>
						<th>ID Don Hang</th>
						<th>So Luong</th>
						<th>Giá</th>
						<th>Thòi Gian</th>
						<th>Trang Thái</th>
					</tr>
				</thead>
				<tbody
					style="background-color: white; font-size: 15px; font-weight: bold;">
					<%
					for (OrderDetails order : orders) {
					%>

					<tr>
						<td><img src="./ShowImage?pid=<%=order.getProductId()%>"
							style="width: 50px; height: 50px;"></td>
						<td><%=order.getProdName()%></td>
						<td><%=order.getOrderId()%></td>
						<td><%=order.getQty()%></td>
						<td><%=order.getAmount()%></td>
						<td><%=order.getTime()%></td>
						<td class="text-success"><%=order.getShipped() == 0 ? "ORDER_PLACED" : "ORDER_SHIPPED"%></td>
					</tr>

					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>



	<%@ include file="footer.html"%>
</body>
</html>