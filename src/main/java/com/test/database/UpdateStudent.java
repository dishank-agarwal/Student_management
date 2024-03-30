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

@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet {
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
			String query = "update students set sname=?, scourse=?, smobile=? where semail=?";

			RequestDispatcher rd = null;

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.setString(2, scourse);
			ps.setString(3, smobile);
			ps.setString(4, semail);

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
	}

}
