<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">


	<div class="container mt-5 pt-5">
		<div class="row">
			<div class="col-12 col-sm-7 col-md-6 m-auto">
				<div class="card border-0 shadow">
					<div class="card-body">
						<h3>Registration</h3>
						<div class="x col-4">
							<img src="/image1.png" style="width: 400px; margin-right: auto;">
						</div>
						<form action="register" method="post">
							<input type="text" name="name" class="form-control my-4 py-2"
								placeholder="Enter name" /> <input type="text" name="email"
								class="form-control my-4 py-2" placeholder="Enter email" /> <input
								type="password" name="password" class="form-control my-4 py-2"
								placeholder="Enter password" /> <input type="text"
								name="mobile" class="form-control my-4 py-2"
								placeholder="Enter mobile" />
							<div class="text-center mt-3">
								<button class="btn btn-primary" type=submit>Register</button>
								<br> <br> <a href="login.jsp"
									class="signup-image-link">Login</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {

			swal("Congratulations", "Account registered successfully",
					"success");
		} else if (status == "failed") {

			swal("Sorry", "Account creation failed", "error");
		}
	</script>

</body>
</html>