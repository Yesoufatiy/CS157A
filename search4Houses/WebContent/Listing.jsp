<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<script src="basics.js"> 


</script>
  <link rel="stylesheet" href="style.css">

	<style>
		.carousel-inner img {
		padding-left: 2%;
		padding-right: 2%;
      width: 700px;
      height: 500px;
  }
	</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script >
function addToFav() {
	//document.getElementById(aBtn).style.backgroundColor.focus() = "#6CA2F1";
	alert("Sucessfully added to Favorites");
	
	java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
 
 Statement stmt = con.createStatement();
// ResultSet rs = stmt.executeQuery("INSERT INTO search4houses.Listings_Photos (photo_id, listing_id) VALUES()");

	
	}



</script>

<jsp:include page="navBar.jsp" />

	


	<% String db = "search4houses"; %>








</head>
<body>
<div class = "row"><div class="column">





<%
 String listing_id = request.getParameter("listing");
 //out.println(listing_id);  
 
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     
     Statement stmt = con.createStatement();
     Statement stmt1 = con.createStatement();
     Statement stmt2 = con.createStatement();
     Statement stmt3 = con.createStatement();
     Statement stmt4 = con.createStatement();

     
     

     ResultSet rs = stmt.executeQuery("SELECT * FROM search4houses.Listings WHERE listingID="+listing_id);
		//out.println("hefiewhihf");
		
		
		 ResultSet rs5 = stmt1.executeQuery("SELECT * FROM search4houses.Photos,search4houses.Listings_Photos WHERE photoID=photo_id AND listing_id ="+listing_id+" ORDER BY photoID DESC;");
	     //rs1.first();
	    // out.println(rs5);
	     		//out.println("hefiewhihf");
	     		if (rs5.next() == true){ 

	     		String photoID = rs5.getString("photoID");
	    		//out.println("hefiewhihf");

	         	String URL = rs5.getString("photoURL")+".jpg";
	         	//out.println(URL);
	         	
	         	%>
    
    
    <div id="photos" class="carousel slide" data-ride="carousel">

  
  
  <div class="carousel-inner">
    <div class="carousel-item active">
<div class = "container"> <img id="mainPhoto" src="img/<%out.println(URL);%>" height="500" width="700">
</div> 
</div>


<%
	     		}
while (rs5.next()){
	%>
	<div = class="carousel-item">
	<% 

	          	 String photoID = rs5.getString("photoID");
	    		//out.println("hefiewhihf");

	         	String URL = rs5.getString("photoURL")+".jpg";
	         	//out.println(URL);
	         	

	         	
		%>
		<div class = "container"> <img id="nextPhoto" src="img/<%out.println(URL);%>" height="350" width="500">
</div> 
		</div>
		
		<%
				}
			

    %>



   
  </div>
  
  <a class="carousel-control-prev" href="#photos" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#photos" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>


<% %>


  <br><%
    
    
    
     while(rs.next()){
      	String listingID = rs.getString("listingID");
      	//out.println(theZip + zipCode);
      	//if (listingID.equals(listing_id)) {
      		
      		
    		 %> <br><%
      		
      		
           %></div> <div class = "column"><%

      		
      		
           	 
           			 
            	//out.println("listingID: " + listingID);%> <br><h1><% 
            	String price = rs.getString("price");
            	out.println("$" + price + "/month");%></h1> <br> <h3><% 
            	
            	
               
            	
            	ResultSet rs2 = stmt3.executeQuery("SELECT * FROM search4houses.Addresses, search4houses.Listing_Address WHERE addrID=addr_id AND listing_id="+listing_id);
           	 while(rs2.next()){
           	      	//out.println(theZip + zipCode);
           	
       		String street = rs2.getString("streetAddress");
       		String city = rs2.getString("city");
       		String state = rs2.getString("state");

       		out.println(street + " " + city+ ", "+ state);
           	      	}
            	%></h3> <br><% 

            	%><b><%out.println("Bedroom(s): ");%></b><%
            	out.println(rs.getString("roomNum"));

            	%><br><b><%out.println("Bathroom(s): ");%></b><%
            	out.println(rs.getString("bathroomNum"));
            	
            	%><br><b><%out.println("Lease length: ");%></b><%
            	out.println(rs.getString("leaseTimeframe") +" months");
            	            	
            	%><br><b><%out.println("Information: ");%></b><%
            	out.println(rs.getString("description"));
            	%> <br><% 
            	
            	
            	
                //rs1.first();
                //out.println(rs5);
                 %> <br><%
                 
             	ResultSet rs3 = stmt4.executeQuery("SELECT * FROM search4houses.AdditionalContacts, search4houses.Listings_AdditionalContact WHERE contactAccID=addContact_id AND listing_id="+listing_id);
				while(rs3.next()){
					String name = rs3.getString("name");
		       		String num = rs3.getString("phoneNum");
		       		String email = rs3.getString("email");

				
					%><b><%out.println("Contact Info: ");%></b><%
		       		out.println(name + " | " + email+ " | "+ num);
					%> <br><br><% 
				}
            	
            	
            	
            	
      	}
      	


		%> 
		
		
		
		</div></div>

		<%
		stmt.close();
		con.close();
} catch(SQLException e) {
out.println("SQLException caught: " + e.getMessage()); }
 %>
</body>
</html>