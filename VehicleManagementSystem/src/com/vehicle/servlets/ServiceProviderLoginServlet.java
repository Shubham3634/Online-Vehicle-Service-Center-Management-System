package com.vehicle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServiceProviderLoginServlet
 */
public class ServiceProviderLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
		PrintWriter pw=response.getWriter();
		
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");  
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from admincred;");
			
			if(rs.next()) {
				if(rs.getString(1).equals(request.getParameter("uname"))) {
					if(rs.getString(2).equals(request.getParameter("psw"))) {
						request.setAttribute("name", rs.getString(1));
						RequestDispatcher rd=request.getRequestDispatcher("/ServiceProviderHome.jsp");
				        rd.include(request, response);
					} else {
						pw.println("<html><body>"); 
						pw.println("<div style=\"color:red;font-size:20px;text-align:center;\">");
						pw.println("Passsword is incorrect, Please relogin!!");
						pw.println("</div>");
						pw.println("</body></html>");
							 
						RequestDispatcher rd=request.getRequestDispatcher("/ServiceProviderLogin.html");  
				        rd.include(request, response); 
					}
				}else {
					pw.println("<html><body>"); 
					pw.println("<div style=\"color:red;font-size:20px;text-align:center;\">");
					pw.println("Username is incorrect, Please relogin!!");
					pw.println("</div>");
					pw.println("</body></html>");
						 
					RequestDispatcher rd=request.getRequestDispatcher("/ServiceProviderLogin.html");  
			        rd.include(request, response); 
				}
			}else {
				pw.println("<html><body>"); 
				pw.println("<div style=\"color:red;font-size:20px;text-align:center;\">");
				pw.println("Something went wrong... Please try again!");
				pw.println("</div>");
				pw.println("</body></html>");
					 
				RequestDispatcher rd=request.getRequestDispatcher("/ServiceProviderLogin.html");  
		        rd.include(request, response);
			}
						  
			 
		         
			con.close();      
			}catch (Exception e2) {System.out.println(e2);}  			   
		
		
		pw.close();//closing the stream  
		}

}
