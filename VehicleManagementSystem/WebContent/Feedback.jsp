<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
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
				<td><h2 style="text-align: center;">Feedback</h2></td>
				<td><span style="float: right" ><a href="index.html">Logout</a></span></td>
			</tr>
		</table>
  <hr>
  <table>
  <tr>
  	<th>Request ID</th>
    <th>Requested By</th>
    <th>Requested For Date</th>
    <th>Vehicle Type</th>
    <th>Vehicle Name</th>
    <th>Vehicle Number</th>
    <th>Status</th>
    <th>Rating</th>
  </tr>
  <%!
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null;
  %>
  <%
  try{
  	Class.forName("com.mysql.cj.jdbc.Driver");  
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicledb","root","root");  
	stmt = con.createStatement();
	rs = stmt.executeQuery("select * from servicerequest where isfeedbackgiven=\"No\" and status in (\"Delivered\");");
	while(rs.next()){
  %>
  <tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(11)%></td>
    <td><%=rs.getString(6)%></td>
    <td><a href="RequestFeedback.jsp?requestid=<%=rs.getInt(1)%>&name=<%=rs.getString(2)%>">Give Rating</a></td>
  </tr>
 <%
        }
     } 
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
     finally {
         try {
            if (con != null) {
                con.close();
            }
         } 
         catch (SQLException e) { }
     }
  %>
</table>
</div>


   
</body>
</html> 
