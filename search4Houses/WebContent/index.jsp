<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html lang="en">
<script src="basics.js"> </script>

  <link rel="stylesheet" href="style.css">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>search4House</title>
<style>
.link { 
text-decoration:none;
color: #4B4B4B; }
.link:hover { color: #FF94D5; }
</style>
</head>
<body>
<jsp:include page="navBar.jsp" />
<div align="center" style="padding-left=50px; padding-right=50px;padding-top=50px;padding-bottom=50px;">
<button type="button" onclick="window.location.href = 'login.jsp'">Log In</button>
<button type="button" onclick="window.location.href = 'resgister.jsp'">Register</button>
<button type="button" onclick="window.location.href = 'logout.jsp'">Log Out</button>
</div>
	<fieldset>
		<center><legend><h2 align="center">Welcome</h2></legend>
		<p>This is Search4Housing, where we match you to our best listing
			to find you a place to stay. Check out some of our top listings below! </p> </center>
	</fieldset>
	<% 
String userID=(String)session.getAttribute("userID"); 
	if (userID != null) {
		out.print("Hello, "+ userID + "! Feel free to scroll through our catalog and enjoy your time with us here."); 
	}
%>
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="img/apartinside.jpg" alt="Inside Apartment">
    </div>

    <div class="item">
      <img src="img/coolbathroom.jpg" alt="Cool Bathroom">
    </div>

    <div class="item">
      <img src="img/studio.jpg" alt="Studio">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>