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

public class CustomerRegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)  
			throws ServletException,IOException  
			{  
				res.setContentType("text/html");//setting the content type  
				PrintWriter pw=res.getWriter();//get the stream to write the data  
				  
				try{  
					Class.forName("com.mysql.cj.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");  
					  
					PreparedStatement ps=con.prepareStatement(  
					"insert into customer values(?,?,?,?,?,?)");  
					  
					ps.setString(1,req.getParameter("name"));  
					ps.setString(2,req.getParameter("contact"));  
					ps.setString(3,req.getParameter("email"));  
					ps.setString(4,req.getParameter("psw"));
					ps.setString(5,req.getParameter("vehicletype"));
					ps.setString(6,req.getParameter("vehicleno"));
					          
					int i=ps.executeUpdate();  
					if(i>0){	  
						    pw.println("<html><body>"); 
							pw.println("<div style=\"color:MediumSeaGreen;font-size:20px;text-align:center;\">");
							pw.println("You are successfully registered, Login Now!!");
							pw.println("</div>");
							pw.println("</body></html>");
								 
							RequestDispatcher rd=req.getRequestDispatcher("/customerLogin.html");  
					        rd.include(req, res);      
							con.close();
						}else {
							pw.println("<html><body>"); 
							pw.println("<div style=\"Red;font-size:20px;text-align:center;\">");
							pw.println("Something went wrong... Please try again!");
							pw.println("</div>");
							pw.println("</body></html>");
								 
							RequestDispatcher rd=req.getRequestDispatcher("/CustomerRegister.html");  
					        rd.include(req, res);      
							con.close();
						}
					}catch (Exception e2) {System.out.println(e2);}  			   
				
				
				pw.close();//closing the stream  
			}
}
