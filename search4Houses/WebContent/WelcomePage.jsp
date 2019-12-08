<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<script src="basics.js"> </script>

  <link rel="stylesheet" href="style.css">
<head>
<meta charset="UTF-8">
<title>search4House</title>
</head>
<body>
	
	<fieldset>
		<legend>Welcome</legend>
		<p>This is Search4Housing, where we match you to our best listing
			to find you a place to stay.</p>
	</fieldset>
	
	
	<fieldset>
		<legend>Sign In</legend>
		<form action="login" method="post">
		<pre>
		Username: <input type="text" name="username">
		Password: <input type="text" name="password">
		 <input type="submit" value="Submit">
		</pre>
		</form>
	</fieldset>
	<fieldset>
		<legend>Sign Up</legend>
		<form action="signup" method="post">
		<pre>
		Full Name: <input type="text" name="name">
		Username: <input type="text" name="username">
		Password: <input type="text" name="password">
		Email Address: <input type="text" name="email">
		Phone Number: <input type="text" name="phone">
		 <input type="submit" value="Submit">
		</pre>
		</form>
	</fieldset>
	<button type="button" onclick="window.location.href = 'logoff.jsp'">Log Off</button>
</body>
</html>