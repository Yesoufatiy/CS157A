<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
	<jsp:include page="navBar.jsp" />
<script src="basics.js"> </script>

  <link rel="stylesheet" href="style.css">
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




	
 <h2>Search by Area</h2>

 <form name = "zipSearch" action="Listings.jsp" method="GET" onSubmit="return checkSearch()">
    <input type="text" placeholder="Search by zipcode.." name="zipcode" required/>
    <input type="submit" style="border-radius: 2px; " value="Search" />
</form>
 
    

    <% 
    //categories = Single Room, Shared Room, Duplex, Apartment, Studio
     String db = "search4houses";
        
            %> 
           
            

</body>
</html>