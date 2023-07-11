<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Dang Ky</title>
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

			<form action="./RegisterSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: #8ecbd8; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: black;">Dang Ky</h2>
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
					<div class="col-md-6 form-group">
						<label for="first_name">Ten</label> <input type="text"
							name="username" class="form-control" id="first_name"
							name="first_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Email</label> <input type="email"
							name="email" class="form-control" id="last_name" name="last_name"
							required>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">D/c</label>
					<textarea name="address" class="form-control" id="last_name"
						name="last_name" required></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">SDT</label> <input type="number"
							name="mobile" class="form-control" id="last_name"
							name="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Ma Pin </label> <input type="number"
							name="pincode" class="form-control" id="last_name"
							name="last_name" required>
					</div>

				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Password</label> <input type="password"
							name="password" class="form-control" id="last_name"
							name="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Confirm Password</label> <input
							type="password" name="confirmPassword" class="form-control"
							id="last_name" name="last_name" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6" style="margin-bottom: 2px;">
						<button type="Reset" class="btn btn-danger"><i class="fa fa-refresh" aria-hidden="true"></i></button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success"><i class="fa fa-user-plus" aria-hidden="true"></i></button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="footer.html"%>
</body>
</html>