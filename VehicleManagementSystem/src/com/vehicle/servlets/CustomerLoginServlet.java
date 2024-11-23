package com.vehicle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CustomerLoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter pw=response.getWriter();
		
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");  
			//String query = "select * from customer where email="+request.getParameter("uname")+";"; 
			PreparedStatement ps=con.prepareStatement(  
					"select * from customer where email=?");
			ps.setString(1, request.getParameter("uname"));
	        ResultSet rs = ps.executeQuery();
			 
			if(rs.next()) {
				if(rs.getString(4).equals(request.getParameter("psw"))) {
					request.setAttribute("name", rs.getString(1));
					RequestDispatcher rd=request.getRequestDispatcher("/CustomerHomePage.jsp");
			        rd.include(request, response); 
				}else {
					pw.println("<html><body>"); 
					pw.println("<div style=\"color:red;font-size:20px;text-align:center;\">");
					pw.println("Passsword is incorrect, Please relogin!!");
					pw.println("</div>");
					pw.println("</body></html>");
						 
					RequestDispatcher rd=request.getRequestDispatcher("/customerLogin.html");  
			        rd.include(request, response); 
				}
			}else {
				pw.println("<html><body>"); 
				pw.println("<div style=\"color:red;font-size:20px;text-align:center;\">");
				pw.println("Username is incorrect, Please relogin!!");
				pw.println("</div>");
				pw.println("</body></html>");
					 
				RequestDispatcher rd=request.getRequestDispatcher("/customerLogin.html");  
		        rd.include(request, response);
			}
						  
			 
		         
			con.close();      
			}catch (Exception e2) {System.out.println(e2);}  			   
		
		
		pw.close();//closing the stream  
	
	}

}
