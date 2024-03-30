package com.test.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");
		
		
		PrintWriter out = response.getWriter();
		out.println("working..");
	
		out.println(upassword);
		out.println(uemail);
		
		
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MiniProjectJSP?useSSL=false",
					"root", "mysql");
			String query = "select * from users where uemail=? and upassword=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uemail);
			ps.setString(2, upassword);

			ResultSet rs = ps.executeQuery();
			
			
			
			if (rs.next() == true) {
				
				request.setAttribute("status ", "success");
				session.setAttribute("name", rs.getString("uname"));
				System.out.println(request.getAttribute("status") + "!!!!!");
				rd = request.getRequestDispatcher("index.jsp");
				
			} else {
				
				request.setAttribute("status ", "failed");
				rd = request.getRequestDispatcher("registration.jsp");
				
			}

			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
