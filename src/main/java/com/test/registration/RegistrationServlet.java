package com.test.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		out.println("working..");
		
		String uname = request.getParameter("name");
		String upassword = request.getParameter("password");
		String uemail = request.getParameter("email");
		String umobile = request.getParameter("mobile");
	
		out.println(uname);
		out.println(upassword);
		out.println(uemail);
		out.println(umobile);
		
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MiniProjectJSP?useSSL=false", "root", "mysql");
			String query = "insert into users (uname, upassword, uemail, umobile) values (?, ?, ?, ?)";
			
			RequestDispatcher rd = null;
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uname);
			ps.setString(2, upassword);
			ps.setString(3,  uemail);
			ps.setString(4, umobile);
			
			int rowCount = ps.executeUpdate();
			
			rd = request.getRequestDispatcher("registration.jsp");
			
			if(rowCount > 0)
			{
				request.setAttribute("status", "success");
				System.out.println(request.getAttribute("status") + "!!!!!");
			}
			else
			{
				request.setAttribute("status", "failed");
				
			}
			
			rd.forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
