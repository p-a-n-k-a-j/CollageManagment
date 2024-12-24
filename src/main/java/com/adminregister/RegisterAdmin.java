package com.adminregister;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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



/**
 * Servlet implementation class RegisterAdmin
 */

public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String fullName = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//getting db connection things
		ServletContext context = getServletContext();
		String dbdriver = context.getInitParameter("dbdriver");
		String dburl = context.getInitParameter("dburl");
		String dbuserName = context.getInitParameter("dbusername");
		String dbpassword = context. getInitParameter("dbpassword");
		
		try {
			Class.forName(dbdriver);
			Connection con = DriverManager.getConnection(dburl, dbuserName, dbpassword);
			PreparedStatement ps = con.prepareStatement("select * from admin_register where admin_email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				request.setAttribute("errorMessage", "This user Already exist ! ");
				request.getRequestDispatcher("./adminPages/Admin.jsp").include(request, response);
			}else {
				
				CallableStatement call = con.prepareCall("call insertAdmin(?, ?, ?)");
				call.setString(1, fullName);
				call.setString(2, email);
				call.setString(3, password);
				call.executeUpdate();
				HttpSession emailSession = request.getSession();
				emailSession.setAttribute("adminEmail", email);
				System.out.println("Session attribute set: adminEmail = " + email);
				call.close();
				response.sendRedirect("./adminPages/AdminLogin.jsp");
				
			}
			con.close();
			ps.close();
			rs.close();
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
