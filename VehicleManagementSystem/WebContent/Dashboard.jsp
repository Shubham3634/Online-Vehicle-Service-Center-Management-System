<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #4CAF50;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #111;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
</head>
<body>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Dashboard.jsp">Dashboard</a>
  <a href="BookAppointment.jsp">Book Appointment</a>
  <a href="ViewStatus.jsp">View Request Status</a>
  <a href="Feedback.jsp">Feedback</a>
</div>

<div id="main">
  <table style="width: 100%;">
			<tr>
				<td><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></td>
				<td><h2 style="text-align: center;">Book Service Appointment</h2></td>
				<td><span style="float: right" ><a href="index.html">Logout</a></span></td>
			</tr>
		</table>
  <hr>
</div>

<%
		String sqlQuery = "select vehicletype as category, count(vehicletype) as value from servicerequest group by vehicletype;";
		//String sql1 = "select rating, count(rating) as count from servicerequest group by rating order by rating;";
		String sql1 = "select rating, count(rating) as count from servicerequest where isfeedbackgiven=\"yes\" group by rating order by rating ;";
		String sql2 = "select status, count(status) as count from servicerequest group by status order by status;";
		
		 List<String> categoryList = new ArrayList();
         List<Integer> valueList = new ArrayList();
         List<Integer> ratingList = new ArrayList();
         List<String> requestStatusList = new ArrayList();
         List<Integer> vahicleCountList = new ArrayList();
        try {
            // Establish a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");
            Statement stmt = conn.createStatement();
            
            // Execute the SQL query
            ResultSet rs = stmt.executeQuery(sqlQuery);

            while (rs.next()) {
            	categoryList.add(rs.getString(1));
            	valueList.add(rs.getInt(2));
            }
            rs.close();
            stmt.close();
            
            Statement stmt1 = conn.createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            
            while (rs1.next()) {
            	ratingList.add(rs1.getInt(2));
            }
            
            rs1.close();
            stmt1.close();
            
            Statement stmt2 = conn.createStatement();
            ResultSet rs2 = stmt2.executeQuery(sql2);
            
            while (rs2.next()) {
            	requestStatusList.add(rs2.getString(1));
            	vahicleCountList.add(rs2.getInt(2));
            }
            
            rs2.close();
            stmt2.close();
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <table>
    	<tr>
    		<td><div id="myPlot" style="width:100%;max-width:700px"></div></td>
    		<td><div id="myPlot1" style="width:100%;max-width:700px"></div></td>
    	</tr>
    	<tr>
    		<td><div id="myPlot2" style="width:100%;max-width:700px"></div></td>
    	</tr>
    </table>
    <!-- Bar Graph -->
 	

	<script>
		
	var xArray = [];
    var yArray = [];
    
    <%
    for (int i= 0; i < categoryList.size(); i++) {
	%>
		xArray.push("<%= categoryList.get(i) %> wheel"); 
	<%
    	}
	%>
    
	<%
    for (int i= 0; i < valueList.size(); i++) {
	%>
		yArray.push("<%= valueList.get(i) %>"); 
	<%
    	}
	%>
	
	
	const data = [{
	  x:xArray,
	  y:yArray,
	  type:"bar",
	  orientation:"v",
	  marker: {color:"rgba(0,0,255,0.6)"}
	}];
	
	const layout = {title:"Vehicle Type vs Repaired Vehicle Count"};
	
	Plotly.newPlot("myPlot", data, layout);
	</script>

	<!-- Pie Chart -->
	
	<script>
		var ratingArray = ["One", "Two", "Three", "Four", "Five"];
		var countArray = [];
	    
		<%
	    for (int i= 0; i < ratingList.size(); i++) {
		%>
		countArray.push("<%= ratingList.get(i) %>"); 
		<%
	    	}
		%>
		
		const layout1 = {title:"Ratings given by customer(1-Lowest, 5-Highest)"};
		const data1 = [{labels:ratingArray, values:countArray, type:"pie"}];
		
		Plotly.newPlot("myPlot1", data1, layout1);
	</script>
	
	<!-- Horizontal Graph -->
	
	<script>
		const xArray1 = [];
		const yArray1 = [];
		
		<%
	    for (int i= 0; i < requestStatusList.size(); i++) {
		%>
		yArray1.push("<%= requestStatusList.get(i) %> "); 
		<%
	    	}
		%>
		
		<%
	    for (int i= 0; i < vahicleCountList.size(); i++) {
		%>
		xArray1.push("<%= vahicleCountList.get(i) %>"); 
		<%
	    	}
		%>
		const data2 = [{
		  x:xArray1,
		  y:yArray1,
		  type:"bar",
		  orientation:"h",
		  marker: {color:"rgba(255,0,0,0.6)"}
		}];
		
		const layout2 = {title:"Request Status"};
		
		Plotly.newPlot("myPlot2", data2, layout2);
	</script>
	
       
</body>
</html> 
