<!DOCTYPE html>
<html>
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

form {
	border: 3px solid #f1f1f1;
	margin-left: 300px;
	margin-right: 300px;
}

input[type=text], input[type=password], input[type=date], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.imgcontainer {
  text-align: center;
  margin: 12px 0 12px 0;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
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
	<div>
  		<table style="width: 100%;">
			<tr>
				<td><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></td>
				<td><h2 style="text-align: center;">Book Service Appointment</h2></td>
				<td><span style="float: right" ><a href="index.html">Logout</a></span><br></td>
			</tr>
		</table>
  		
	</div>
  
  <hr>
  <form action="BookAppointmentServlet" method="post">
	  <div class="container">
	  	<input type="hidden" name="name" value="<%=session.getAttribute("name1")%>">
	    <label for="date"><b>Select the Appointment date: </b></label>
	    <input type="date" placeholder="Select Date" name="date" required>
		<br>
		<label for="vehicletype"><b>Vehicle Type</b></label>
	    <br>
	    <select name="vehicletype" id="vehicletype" >
			<option value=" ">Select</option>
	  		<option value="two">Two Wheel</option>
	  		<option value="four">Four Wheel</option>
	  		<option value="three">Three Wheel</option>
	  		<option value="multi">Multi Axle</option>
		</select>
		
	    <label for="vehiclename"><b>Vehicle Name</b></label>
	    <input type="text" placeholder="Enter Vehicle Name" name="vehiclename" required>
	        
	    <label for="vehicleno"><b>Vehicle Number</b></label>
    	<input type="text" placeholder="Vehicle Number" name="vehicleno" id="vehicleno" required>
    
	    <button type="submit">Submit</button>
	  
	  </div>
	</form>
</div>


   
</body>
</html> 
