<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/index.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>


	<nav class="navbar">
		<div class="navdiv">
			<div class="logo">
				<a href="#">AdvJava</a>
			</div>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li>
				<button>
					<a href="logout"> Logout</a>
				</button>
			</ul>
		</div>
	</nav>


	<div class="container1 d-flex justify-content-center">
		<form method=post action=updateStudent>
			<%
			try {

				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MiniProjectJSP?useSSL=false", "root",
				"mysql");

				String semail = request.getParameter("semail");
				String sname = request.getParameter("semail");
				String scourse = request.getParameter("semail");
				String smobile = request.getParameter("semail");

				String query = "select * from students where semail=?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, semail);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
			%>



			<div class="form-group">
				<label>Name</label> <input name="name" type="text"
					class="form-control" placeholder="Enter name"
					value="<%=rs.getString("sname")%>">
			</div>
			<div class="form-group">
				<label>Email address</label> <input name="email" type="email"
					class="form-control" placeholder="Enter email"
					value="<%=rs.getString("semail")%>">
			</div>
			<div class="form-group">
				<label>Course</label> <select name="course" class="form-select">
					<option selected><%=rs.getString("scourse")%></option>
					<option value="java">Java</option>
					<option value="php">PHP</option>
					<option value="reactjs">ReactJs</option>
					<option value="nodejs">NodeJs</option>
				</select>
			</div>
			<div class="form-group">
				<label>Mobile</label> <input name="mobile" type="text"
					class="form-control" placeholder="Enter mobile"
					value="<%=rs.getString("smobile")%>">
			</div>
			<%
			}

			} catch (Exception e) {
			out.println("Exception: " + e.getMessage());
			e.printStackTrace();
			}
			%>

			<button type="submit" class="btn btn-primary">Submit</button>
			
		</form>
		<a href="index.jsp"><button class="btn btn-primary">Return</button></a>
		
	</div>


</body>
</html>