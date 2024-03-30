<!-- 
<%
if (session.getAttribute("name") == null)
	response.sendRedirect("login.jsp");
%>
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="CSS/index.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<title>Index</title>

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

	<br><br>

	<div class="container1 d-flex justify-content-center">
		<form method=post action=addStudent>
			<div class="form-group">
				<label>Name</label> <input name="name" type="text"
					class="form-control" placeholder="Enter name">
			</div><br>
			<div class="form-group">
				<label>Email address</label> <input name="email" type="email"
					class="form-control" placeholder="Enter email">
			</div><br>
			<div class="form-group">
				<label>Course</label> <select name="course" class="form-select">
					<option selected>Select course</option>
					<option value="java">Java</option>
					<option value="php">PHP</option>
					<option value="reactjs">ReactJs</option>
					<option value="nodejs">NodeJs</option>
				</select>
			</div><br>
			<div class="form-group">
				<label>Mobile</label> <input name="mobile" type="text"
					class="form-control" placeholder="Enter mobile">
			</div><br>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	
	<div class="d-flex flex-column">
		<div class="container">
			<h3>Students Registered</h3>
			<table class="table table-bordered mx-auto" style="padding: 15px;">
				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Course</th>
						<th>Mobile</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<%
					try {

						Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MiniProjectJSP?useSSL=false", "root",
						"mysql");
						String query = "select * from students";
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(query);

						while (rs.next()) {
							
							String semail = rs.getString("semail");
					%>
					<tr>
						<td><%=rs.getString("sname")%></td>
						<td><%=rs.getString("semail")%></td>
						<td><%=rs.getString("scourse")%></td>
						<td><%=rs.getString("smobile")%></td>
						<td>
							<a href="update.jsp?semail=<%=semail%>" >Update</a>  <a href="delete.jsp?semail=<%=semail%>" >Delete</a>
						</td>
					</tr>
					<%
					}

					} catch (Exception e) {
					out.println("Exception: " + e.getMessage());
					e.printStackTrace();
					}
					%>


				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>