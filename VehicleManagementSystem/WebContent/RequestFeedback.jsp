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

<span style="float: right" ><a href="CustomerHomePage.jsp">Home</a> <a href="index.html">Logout</a></span>
<form action="FeedbackSubmitServlet" method="post">
  <div class="container">
    <p>Kindly provide your valuable feedback</p>
    <hr>
    <input type="hidden" name="requestid" value="<%=request.getParameter("requestid")%>">
    <input type="hidden" name="name" value="<%=request.getParameter("name")%>">
    <label for="feedbacktext"><b>Comments</b></label><br>
    <textarea id="feedbacktext" name="feedbacktext" rows="4" cols="50"></textarea>
	<br><br>
    <label for="rating"><b>Rating</b></label><br>
    <label for="rating1"><b>(1-Lowest, 5-Highest)</b></label>
    <br>
    <select name="rating" id="rating" >
		<option value=" ">Select</option>
  		<option value="1">1</option>
  		<option value="2">2</option>
  		<option value="3">3</option>
  		<option value="4">4</option>
  		<option value="5">5</option>
	</select>
	<br>
    <hr>
    <button type="submit" class="submitbtn">Submit Feedback</button>
  </div>
  
</form>

</body>
</html>