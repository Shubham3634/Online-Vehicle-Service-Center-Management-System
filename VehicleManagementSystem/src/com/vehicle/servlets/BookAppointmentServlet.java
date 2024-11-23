package com.vehicle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//c+s+o

public class BookAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookAppointmentServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");//setting the content type  
		PrintWriter pw=response.getWriter();//get the stream to write the data  

		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");  
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(requestid) as MAX_NUM from servicerequest;");
			int maxRequestId = 0;
			if(rs.next())
				maxRequestId = rs.getInt("MAX_NUM");
			
			PreparedStatement ps=con.prepareStatement(  
			"insert into servicerequest values(?,?,?,?,?,?,?,?,?,?,?)");  
			 
			ps.setInt(1,maxRequestId+1);  
			ps.setString(2,request.getParameter("name")); 
			ps.setString(3,request.getParameter("date"));  
			ps.setString(4,request.getParameter("vehicletype"));
			ps.setString(5,request.getParameter("vehiclename"));
			ps.setString(6,"New");
			ps.setString(7, "No");
			ps.setString(8, "");
			ps.setString(9, "");
			ps.setString(10, "");
			ps.setString(11, request.getParameter("vehicleno"));
			          
			int i=ps.executeUpdate();  
			if(i>0) 
			{  
			    pw.println("<html><body>"); 
				pw.println("<div style=\"color:MediumSeaGreen;font-size:20px;text-align:center;\">");
				pw.println("Request successfully sent!... You can track the status of your request from VIEW REQUEST STATUS menu");
				pw.println("</div>");
				pw.println("</body></html>");
					 
				request.setAttribute("name", request.getParameter("name"));
				RequestDispatcher rd=request.getRequestDispatcher("/CustomerHomePage.jsp");  
		        rd.include(request, response);      
				con.close();
			}else {
				pw.println("<html><body>"); 
				pw.println("<div style=\"color:Red;font-size:20px;text-align:center;\">");
				pw.println("Request not sent... Please try again!");
				pw.println("</div>");
				pw.println("</body></html>");
					 
				request.setAttribute("name", request.getParameter("name"));
				RequestDispatcher rd=request.getRequestDispatcher("/CustomerHomePage.jsp");  
		        rd.include(request, response);      
				con.close();
			}
			}catch (Exception e2) {System.out.println(e2);}  			   
		
		
		pw.close();//closing the stream  

	}

}
