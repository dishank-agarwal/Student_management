<%@page import="java.sql.*"%>
<%
String semail = request.getParameter("semail");

try {
	

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MiniProjectJSP?useSSL=false", "root",
	"mysql");
	String query = "delete from students where semail=?";

	RequestDispatcher rd = null;

	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, semail);

	ps.executeUpdate();

	int rowCount = ps.executeUpdate();
	System.out.println(rowCount);

	rd = request.getRequestDispatcher("index.jsp");

	if (rowCount > 0) {
		request.setAttribute("status", "success");
		System.out.println(request.getAttribute("status") + "!!!!!");
	} else {
		request.setAttribute("status", "failed");

	}

	rd.forward(request, response);

} catch (Exception e) {
	e.printStackTrace();
}
%>