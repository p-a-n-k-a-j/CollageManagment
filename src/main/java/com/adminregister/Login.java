package com.adminregister;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String adminPassword = request.getParameter("password");
		HttpSession pass = request.getSession();
		
		pass.setAttribute("adminPass", adminPassword);
		//getting db connection things
		ServletContext context = getServletContext();
		String dbdriver = context.getInitParameter("dbdriver");
		String dburl = context.getInitParameter("dburl");
		String dbuserName = context.getInitParameter("dbusername");
		String dbpassword = context. getInitParameter("dbpassword");
		
		//now validate the  password that is correct or exist in table 
		try {
			Class.forName(dbdriver);
			Connection con = DriverManager.getConnection(dburl, dbuserName, dbpassword);
			PreparedStatement ps = con.prepareStatement("select admin_password from admin_register where admin_password=?" );
			ps.setString(1, adminPassword);
			ResultSet rs = ps.executeQuery();
			if(!rs.next()) {
				request.setAttribute("errorMessage", "Incorrect password entered ");
				request.getRequestDispatcher("./adminPages/AdminLogin.jsp").include(request, response);
			}
			else {
				response.sendRedirect("./adminPages/AdminDeshBoard.jsp");
				
			}
			ps.close();
			con.close();
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
