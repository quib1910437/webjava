<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Dang Nhap</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="icon" type="image/x-icon" href="https://tse2.mm.bing.net/th?id=OIP.8gGjkG-jt1H6KtsCTGCmdAHaE8&pid=Api&P=0&h=180">
</head>
<body style="background-color: #e6f8f9;">

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./LoginSrv" method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style="border: 2px solid black; border-radius: 10px; background-color: #8ecbd8; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: black;">DANG NHAP</h2>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Email</label> <input type="email"
							placeholder="Nhap vao Email..." name="username" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Password</label> <input type="password"
							placeholder="Nhap vao Password..." name="password" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="userrole">Chon vai tro:</label> <select name="usertype"
							id="userrole" class="form-control" required>
							<option value="customer" selected>KHACH HANG</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o" aria-hidden="true"></i></button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<%@ include file="footer.html"%>

</body>
</html>