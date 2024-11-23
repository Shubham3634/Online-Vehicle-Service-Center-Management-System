package com.vehicle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateStatusServlet
 */
public class UpdateStatusServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");//setting the content type  
		PrintWriter pw=res.getWriter();//get the stream to write the data  
		  
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");  
			PreparedStatement ps=con.prepareStatement(  
			"update servicerequest set servicedetails=?,status=? where requestid=?");  
			   
			ps.setString(1,req.getParameter("servicedetails"));  
			ps.setString(2,req.getParameter("status"));
			ps.setString(3, req.getParameter("requestid"));
			          
			int i=ps.executeUpdate();  
			if(i>0)  
			{
			    pw.println("<html><body>"); 
				pw.println("<div style=\"color:MediumSeaGreen;font-size:20px;text-align:center;\">");
				pw.println("Request updated successfully!");
				pw.println("</div>");
				pw.println("</body></html>");
				req.setAttribute("name", req.getParameter("name"));
				RequestDispatcher rd=req.getRequestDispatcher("/ServiceProviderHome.jsp");  
		        rd.include(req, res);      
				con.close();
			}else {
				pw.println("<html><body>"); 
				pw.println("<div style=\"color:red;font-size:20px;text-align:center;\">");
				pw.println("Something went wrong... Please try again!");
				pw.println("</div>");
				pw.println("</body></html>");
				req.setAttribute("name", req.getParameter("name"));
				RequestDispatcher rd=req.getRequestDispatcher("/ServiceProviderHome.jsp");  
		        rd.include(req, res);      
				con.close();
			}
		}catch (Exception e2) {System.out.println(e2);}  			   
				
		pw.close();//closing the stream  

	}

}
