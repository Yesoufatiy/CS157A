<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nav Bar Code</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>




		<!-- links to other parts of website. These are not final until we can get all the parts together -->
	<div class="topStyle" style="padding-bottom:10px;"><table border="0" style = "position: absolute; border-spacing: 50px; z-index: 1;">
<h1 align  = "center" style = "	color: #ff6363;">Search4House</h1>
 <div id = "menuTop" align  = "center" style="white-space: normal;">
	<a href  = "index.jsp" style="text-decoration: none; color: #4B4B4B"><strong>Home</strong></a> |
	<a href  = "Profile.jsp" style="text-decoration: none; color: #4B4B4B"><strong>Profile</strong></a> |
	<a href = "FavoriteList.jsp" style="text-decoration: none; color: #4B4B4B"><strong>Favorites List</strong></a> |
	<a href  = "AddListing.jsp" style="text-decoration: none; color: #4B4B4B"><strong>Add Listing</strong></a>
	 <form name = "zipSearch" action="Listings.jsp" method="GET" onSubmit="return checkSearch()">
    <input type="number" placeholder="Search by zipcode.." name="zipcode" required/>
    <input type="submit" style="border-radius: 2px; " value="Search" />
    
</form>
	</div>
	<hr>
	
</table>
 </div>
 <!--  copy this whole thing ^^^^ -->

</body>
</html>



