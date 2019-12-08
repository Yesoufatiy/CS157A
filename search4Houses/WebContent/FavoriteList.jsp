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
	<style>
		
	</style>
<head>
<meta charset="UTF-8">
<title>Search4House</title>

<script>


</script>


<style>

.link { 
text-decoration:none;
color: #4B4B4B; }
.link:hover { color: #FF94D5; }


</style>

</head>
<body>

<jsp:include page="navBar.jsp" />
	
	
	<h2 align = "left">Favorites</h2>
	<button type = "button">Edit Favorites</button>
	
	<br>
	<br>
	
	<table border = "1" cellspacing = "5" cellpadding  = "5">
		<tr>
			<th>Rank</th>
			<th>Photo</th>
			<th>Listing ID</th>
			<th>Price</th>
			<th>Address</th>
		</tr>
		<tr>
			<td>1</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>2</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>		
		<tr>
			<td>3</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>	
		<tr>
			<td>4</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>	
		<tr>
			<td>5</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>	
	
	</table>
	
	<br>
	<br>
	<br>
	
	<div class = "menuBottom" align  = "center" style = "position: fixed; bottom: 10%; left: 45%; text-decoration: none; color: white">
	<a href  = "index.jsp" style="text-decoration: none; color: white"><strong>Home</strong></a> |
	<a href = "FavoriteList.jsp" style="text-decoration: none; color: white"><strong>Favorites List</strong></a>
	</div>
	
	</body>
</html>