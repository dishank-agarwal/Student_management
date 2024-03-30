package com.test.database;

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

@WebServlet("/addStudent")
public class Course extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("working..");

		String sname = request.getParameter("name");
		String semail = request.getParameter("email");
		String scourse = request.getParameter("course");
		String smobile = request.getParameter("mobile");

		out.println(sname);
		out.println(scourse);
		out.println(semail);
		out.println(smobile);

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MiniProjectJSP?useSSL=false",
					"root", "mysql");
			String query = "insert into students (sname, semail, scourse, smobile) values (?, ?, ?, ?)";

			RequestDispatcher rd = null;

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.setString(2, semail);
			ps.setString(3, scourse);
			ps.setString(4, smobile);

			int rowCount = ps.executeUpdate();
			if(rowCount > 0)
			{
				System.out.println("Student added successfully..");
			}

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
	}

}
