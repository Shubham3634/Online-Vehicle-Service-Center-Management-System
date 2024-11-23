<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: white;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
	border: 3px solid #f1f1f1;
  padding: 16px;
  background-color: white;
  margin-left: 300px;
  margin-right: 300px;
}

/* Full-width input fields */
input[type=text], input[type=password], select {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus, select:focus,textarea {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.submitbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>

</head>
<body>
<span style="float: right" ><a href="ServiceProviderHome.jsp">Home</a> <a href="index.html">Logout</a></span>
<form action="UpdateStatusServlet" method="post">
  <div class="container">
    <p>Update Request Status</p>
    <hr>
    <input type="hidden" name="requestid" value="<%=request.getParameter("requestid")%>">
    
    <label for="servicedetails"><b>Service Details</b></label><br>
    <textarea id="servicedetails" name="servicedetails" rows="4" cols="50"></textarea>
	<br><br>
    <label for="status"><b>Status</b></label><br>
    <br>
    <select name="status" id="status" >
		<option value=" ">Select</option>
  		<option value="Vehicle Received">Vehicle Received</option>
  		<option value="In Progress">Work in Progress</option>
  		<option value="Done">Done</option>
  		<option value="Delivered">Vehicle Delivered</option>
	</select>
	<br>
    <hr>
    <button type="submit" class="submitbtn">Update Status</button>
  </div>
  
</form>

</body>
</html>