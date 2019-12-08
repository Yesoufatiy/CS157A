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

<script>

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


<style>









</style>

</head>
<body>

<jsp:include page="navBar.jsp" />



 
  <ul class="sideNavBar">
  <h3 align=center>
Listings for: <% 
 String theZip = request.getParameter("zipcode");
 out.println(theZip); 
 

 String db = "search4houses";
 String user;
 String addressID;
 %>
 </h3>
	<li><a href = "#apartments" class = "link"> Apartments</a></li> 
	<li><a href = "#duplex" class = "link" > Duplex</a></li>
	<li><a href = "#sharedRoom" class = "link" > Shared Room </a></li> 
	<li><a href = "#singleRoom" class = "link" > Single Room </a></li> 
	<li><a href = "#studio" class = "link" > Studio</a> <br></li>
	<li><a href = "#top" class = "link" style="bottom: 0; position: fixed; padding-bottom: 3%;" > Back To Top</a> <br></li>
	

	</ul>
	<div style = "margin-left:17%;">
 <h3 id = "apartments" class="listTitle" >Apartments</h3>
 <%
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     
     Statement stmt = con.createStatement();
     Statement stmt1 = con.createStatement();
     Statement stmt2 = con.createStatement();
     Statement stmt3 = con.createStatement();
     Statement stmt4 = con.createStatement();

		%> 
		<table border="0" style = "border-spacing: 50px"><tr><%

     ResultSet rs = stmt.executeQuery("SELECT Listings_Photos.listing_id,photo_id, addr_id FROM search4houses.Listings_Photos, search4houses.Listings,search4houses.Photos,search4houses.Addresses,search4houses.Listing_Address WHERE roomType='Apartment' AND Listings_Photos.listing_id=Listings.listingID AND Listing_Address.listing_id=Listings.listingID AND photo_id=photoID AND addr_id=addrID AND zipCode="+theZip+" ORDER BY Listing_Address.listing_id ASC, Listings_Photos.photo_id DESC;");

		
		
		int count = 0;
		String prevListID = "";
     while(rs.next()){
 		String listID = rs.getString("listing_id");
 		String photoID = rs.getString("photo_id");
 		String addrID = rs.getString("addr_id");
 		
 		//out.println("listID: "+listID+" photoID: "+photoID+" addrID: "+addrID);
        ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Addresses WHERE addrID="+addrID+";");
   		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM Listings WHERE listingID="+listID+";");
  		ResultSet rs3 = stmt4.executeQuery("SELECT * FROM Photos WHERE photoID="+photoID+";");

  		if (!listID.equals(prevListID)) {
  		
        while (rs2.next()){
           // out.println(rs1.getString("streetAddress"));

        	
        	 %><td><% 
          	

             //rs1.first();
             if (rs3.next()==true){
                 	String URL = rs3.getString("photoURL")+".jpg";
               //  	out.println(URL);
                 	%><div class = "container"><a href = Listing.jsp?<%out.println("listing="+listID); %>> 
                 	<img src="img/<%out.println(URL);%>" height="200" width="300"></a>  
                 	<button class="btn" id ="button" onclick="addToFav()">♡</button>
                 	 <div class="shadow" style="position: absolute; bottom: 8px;right: 2%;">
							<% String price = rs2.getString("price");
          				out.println("$" + price+"/month");%> <br>
							</div>
                 	
                 	
                 	
                 	
                 	
                 	</div>
                 	
                 	
                 	
                 	
                 	
                 	
                 	
                 	<%


             	
             } %> <br><a class="streetText"><%
          	while (rs1.next()){
      		String street = rs1.getString("streetAddress");
      		String city = rs1.getString("city");
      		String state = rs1.getString("state");

      		out.println(street + " " + city+ ", "+ state);
          	
          	
          	
          	
          	%></a> <br> <div class= "bedBathText"><% 
          	String roomNo = rs2.getString("roomNum");
          	out.println("| "+roomNo + " bd | ");
          	String bathNo = rs2.getString("bathroomNum");
          	out.println("| "+bathNo + " ba | ");%></div><br></td><% 
          	count++;
          	}
          	if (count == 3){
          		%> </tr> <%
          		count=0;
          	}
          	
          	prevListID = listID;
        }}}
     stmt.close();
     con.close();
     
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
 %> </tr><%%></table><%
     
    %>
 
 
 <br><hr> <h3 id = "duplex" class="listTitle" >Duplex</h3>
 
 <%
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     
     Statement stmt = con.createStatement();
     Statement stmt1 = con.createStatement();
     Statement stmt2 = con.createStatement();
     Statement stmt3 = con.createStatement();
     Statement stmt4 = con.createStatement();

		%> 
		<table border="0" style = "border-spacing: 50px"><tr><%

     ResultSet rs = stmt.executeQuery("SELECT Listings_Photos.listing_id,photo_id, addr_id FROM search4houses.Listings_Photos, search4houses.Listings,search4houses.Photos,search4houses.Addresses,search4houses.Listing_Address WHERE roomType='Duplex' AND Listings_Photos.listing_id=Listings.listingID AND Listing_Address.listing_id=Listings.listingID AND photo_id=photoID AND addr_id=addrID AND zipCode="+theZip+" ORDER BY Listing_Address.listing_id ASC, Listings_Photos.photo_id DESC;");

		
		
		int count = 0;
		String prevListID = "";
     while(rs.next()){
 		String listID = rs.getString("listing_id");
 		String photoID = rs.getString("photo_id");
 		String addrID = rs.getString("addr_id");
 		
 		//out.println("listID: "+listID+" photoID: "+photoID+" addrID: "+addrID);
        ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Addresses WHERE addrID="+addrID+";");
   		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM Listings WHERE listingID="+listID+";");
  		ResultSet rs3 = stmt4.executeQuery("SELECT * FROM Photos WHERE photoID="+photoID+";");

  		if (!listID.equals(prevListID)) {
  		
        while (rs2.next()){
           // out.println(rs1.getString("streetAddress"));

        	
        	 %><td><% 
          	

             //rs1.first();
             if (rs3.next()==true){
                 	String URL = rs3.getString("photoURL")+".jpg";
               //  	out.println(URL);
                 	%><div class = "container"><a href = Listing.jsp?<%out.println("listing="+listID); %>> 
                 	<img src="img/<%out.println(URL);%>" height="200" width="300"></a>  
                 	<button class="btn" id ="button" onclick="addToFav()">♡</button>
                 	 <div class="shadow" style="position: absolute; bottom: 8px;right: 2%;">
							<% String price = rs2.getString("price");
          				out.println("$" + price+"/month");%> <br>
							</div>
                 	
                 	
                 	
                 	
                 	
                 	</div>
                 	
                 	
                 	
                 	
                 	
                 	
                 	
                 	<%


             	
             } %> <br><a class="streetText"><%
          	while (rs1.next()){
      		String street = rs1.getString("streetAddress");
      		String city = rs1.getString("city");
      		String state = rs1.getString("state");

      		out.println(street + " " + city+ ", "+ state);
          	
          	
          	
          	
          	%></a> <br> <div class= "bedBathText"><% 
          	String roomNo = rs2.getString("roomNum");
          	out.println("| "+roomNo + " bd | ");
          	String bathNo = rs2.getString("bathroomNum");
          	out.println("| "+bathNo + " ba | ");%></div><br></td><% 
          	count++;
          	}
          	if (count == 3){
          		%> </tr> <%
          		count=0;
          	}
          	
          	prevListID = listID;
        }}}
     stmt.close();
     con.close();
     
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
 %> </tr><%%></table><%
     
    %>
 


 <br><hr> <h3 id = "sharedRoom" class="listTitle" >Shared Room</h3>
 
 <%
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     
     Statement stmt = con.createStatement();
     Statement stmt1 = con.createStatement();
     Statement stmt2 = con.createStatement();
     Statement stmt3 = con.createStatement();
     Statement stmt4 = con.createStatement();

		%> 
		<table border="0" style = "border-spacing: 50px"><tr><%

     ResultSet rs = stmt.executeQuery("SELECT Listings_Photos.listing_id,photo_id, addr_id FROM search4houses.Listings_Photos, search4houses.Listings,search4houses.Photos,search4houses.Addresses,search4houses.Listing_Address WHERE roomType='Shared Room' AND Listings_Photos.listing_id=Listings.listingID AND Listing_Address.listing_id=Listings.listingID AND photo_id=photoID AND addr_id=addrID AND zipCode="+theZip+" ORDER BY Listing_Address.listing_id ASC, Listings_Photos.photo_id DESC;");

		
		
		int count = 0;
		String prevListID = "";
     while(rs.next()){
 		String listID = rs.getString("listing_id");
 		String photoID = rs.getString("photo_id");
 		String addrID = rs.getString("addr_id");
 		
 		//out.println("listID: "+listID+" photoID: "+photoID+" addrID: "+addrID);
        ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Addresses WHERE addrID="+addrID+";");
   		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM Listings WHERE listingID="+listID+";");
  		ResultSet rs3 = stmt4.executeQuery("SELECT * FROM Photos WHERE photoID="+photoID+";");

  		if (!listID.equals(prevListID)) {
  		
        while (rs2.next()){
           // out.println(rs1.getString("streetAddress"));

        	
        	 %><td><% 
          	

             //rs1.first();
             if (rs3.next()==true){
                 	String URL = rs3.getString("photoURL")+".jpg";
               //  	out.println(URL);
                 	%><div class = "container"><a href = Listing.jsp?<%out.println("listing="+listID); %>> 
                 	<img src="img/<%out.println(URL);%>" height="200" width="300"></a>  
                 	<button class="btn" id ="button" onclick="addToFav()">♡</button>
                 	 <div class="shadow" style="position: absolute; bottom: 8px;right: 2%;">
							<% String price = rs2.getString("price");
          				out.println("$" + price+"/month");%> <br>
							</div>
                 	
                 	
                 	
                 	
                 	
                 	</div>
                 	
                 	
                 	
                 	
                 	
                 	
                 	
                 	<%


             	
             } %> <br><a class="streetText"><%
          	while (rs1.next()){
      		String street = rs1.getString("streetAddress");
      		String city = rs1.getString("city");
      		String state = rs1.getString("state");

      		out.println(street + " " + city+ ", "+ state);
          	
          	
          	
          	
          	%></a> <br> <div class= "bedBathText"><% 
          	String roomNo = rs2.getString("roomNum");
          	out.println("| "+roomNo + " bd | ");
          	String bathNo = rs2.getString("bathroomNum");
          	out.println("| "+bathNo + " ba | ");%></div><br></td><% 
          	count++;
          	}
          	if (count == 3){
          		%> </tr> <%
          		count=0;
          	}
          	
          	prevListID = listID;
        }}}
     stmt.close();
     con.close();
     
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
 %> </tr><%%></table><%
     
    %>
 



 <br><hr> <h3 id = "singleRoom" class="listTitle" >Single Room</h3>

 <%
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     
     Statement stmt = con.createStatement();
     Statement stmt1 = con.createStatement();
     Statement stmt2 = con.createStatement();
     Statement stmt3 = con.createStatement();
     Statement stmt4 = con.createStatement();

		%> 
		<table border="0" style = "border-spacing: 50px"><tr><%

     ResultSet rs = stmt.executeQuery("SELECT Listings_Photos.listing_id,photo_id, addr_id FROM search4houses.Listings_Photos, search4houses.Listings,search4houses.Photos,search4houses.Addresses,search4houses.Listing_Address WHERE roomType='Single Room' AND Listings_Photos.listing_id=Listings.listingID AND Listing_Address.listing_id=Listings.listingID AND photo_id=photoID AND addr_id=addrID AND zipCode="+theZip+" ORDER BY Listing_Address.listing_id ASC, Listings_Photos.photo_id DESC;");

		
		
		int count = 0;
		String prevListID = "";
     while(rs.next()){
 		String listID = rs.getString("listing_id");
 		String photoID = rs.getString("photo_id");
 		String addrID = rs.getString("addr_id");
 		
 		//out.println("listID: "+listID+" photoID: "+photoID+" addrID: "+addrID);
        ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Addresses WHERE addrID="+addrID+";");
   		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM Listings WHERE listingID="+listID+";");
  		ResultSet rs3 = stmt4.executeQuery("SELECT * FROM Photos WHERE photoID="+photoID+";");

  		if (!listID.equals(prevListID)) {
  		
        while (rs2.next()){
           // out.println(rs1.getString("streetAddress"));

        	
        	 %><td><% 
          	

             //rs1.first();
             if (rs3.next()==true){
                 	String URL = rs3.getString("photoURL")+".jpg";
               //  	out.println(URL);
                 	%><div class = "container"><a href = Listing.jsp?<%out.println("listing="+listID); %>> 
                 	<img src="img/<%out.println(URL);%>" height="200" width="300"></a>  
                 	<button class="btn" id ="button" onclick="addToFav()">♡</button>
                 	 <div class="shadow" style="position: absolute; bottom: 8px;right: 2%;">
							<% String price = rs2.getString("price");
          				out.println("$" + price+"/month");%> <br>
							</div>
                 	
                 	
                 	
                 	
                 	
                 	</div>
                 	
                 	
                 	
                 	
                 	
                 	
                 	
                 	<%


             	
             } %> <br><a class="streetText"><%
          	while (rs1.next()){
      		String street = rs1.getString("streetAddress");
      		String city = rs1.getString("city");
      		String state = rs1.getString("state");

      		out.println(street + " " + city+ ", "+ state);
          	
          	
          	
          	
          	%></a> <br> <div class= "bedBathText"><% 
          	String roomNo = rs2.getString("roomNum");
          	out.println("| "+roomNo + " bd | ");
          	String bathNo = rs2.getString("bathroomNum");
          	out.println("| "+bathNo + " ba | ");%></div><br></td><% 
          	count++;
          	}
          	if (count == 3){
          		%> </tr> <%
          		count=0;
          	}
          	
          	prevListID = listID;
        }}}
     stmt.close();
     con.close();
     
 } catch(SQLException e) { 
     out.println("SQLException caught: " + e.getMessage()); 
 }
 %> </tr><%%></table><%
     
    %>

 <br><hr> <h3 id = "studio" class="listTitle" >Studio</h3>

  <%
  try {
	     
	     java.sql.Connection con; 
	 		Class.forName("com.mysql.jdbc.Driver"); 

	 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
	     
	     Statement stmt = con.createStatement();
	     Statement stmt1 = con.createStatement();
	     Statement stmt2 = con.createStatement();
	     Statement stmt3 = con.createStatement();
	     Statement stmt4 = con.createStatement();

			%> 
			<table border="0" style = "border-spacing: 50px"><tr><%

	     ResultSet rs = stmt.executeQuery("SELECT Listings_Photos.listing_id,photo_id, addr_id FROM search4houses.Listings_Photos, search4houses.Listings,search4houses.Photos,search4houses.Addresses,search4houses.Listing_Address WHERE roomType='Studio' AND Listings_Photos.listing_id=Listings.listingID AND Listing_Address.listing_id=Listings.listingID AND photo_id=photoID AND addr_id=addrID AND zipCode="+theZip+" ORDER BY Listing_Address.listing_id ASC, Listings_Photos.photo_id DESC;");

			
			
			int count = 0;
			String prevListID = "";
	     while(rs.next()){
	 		String listID = rs.getString("listing_id");
	 		String photoID = rs.getString("photo_id");
	 		String addrID = rs.getString("addr_id");
	 		
	 		//out.println("listID: "+listID+" photoID: "+photoID+" addrID: "+addrID);
	        ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Addresses WHERE addrID="+addrID+";");
	   		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM Listings WHERE listingID="+listID+";");
	  		ResultSet rs3 = stmt4.executeQuery("SELECT * FROM Photos WHERE photoID="+photoID+";");

	  		if (!listID.equals(prevListID)) {
	  		
	        while (rs2.next()){
	           // out.println(rs1.getString("streetAddress"));

	        	
	        	 %><td><% 
	          	

	             //rs1.first();
	             if (rs3.next()==true){
	                 	String URL = rs3.getString("photoURL")+".jpg";
	               //  	out.println(URL);
	                 	%><div class = "container"><a href = Listing.jsp?<%out.println("listing="+listID); %>> 
	                 	<img src="img/<%out.println(URL);%>" height="200" width="300"></a>  
	                 	<button class="btn" id ="button" onclick="addToFav()">♡</button>
	                 	 <div class="shadow" style="position: absolute; bottom: 8px;right: 2%;">
								<% String price = rs2.getString("price");
	          				out.println("$" + price+"/month");%> <br>
								</div>
	                 	
	                 	
	                 	
	                 	
	                 	
	                 	</div>
	                 	
	                 	
	                 	
	                 	
	                 	
	                 	
	                 	
	                 	<%


	             	
	             } %> <br><a class="streetText"><%
	          	while (rs1.next()){
	      		String street = rs1.getString("streetAddress");
	      		String city = rs1.getString("city");
	      		String state = rs1.getString("state");

	      		out.println(street + " " + city+ ", "+ state);
	          	
	          	
	          	
	          	
	          	%></a> <br> <div class= "bedBathText"><% 
	          	String roomNo = rs2.getString("roomNum");
	          	out.println("| "+roomNo + " bd | ");
	          	String bathNo = rs2.getString("bathroomNum");
	          	out.println("| "+bathNo + " ba | ");%></div><br></td><% 
	          	count++;
	          	}
	          	if (count == 3){
	          		%> </tr> <%
	          		count=0;
	          	}
	          	
	          	prevListID = listID;
	        }}}
	     stmt.close();
	     con.close();
	     
	 } catch(SQLException e) { 
	     out.println("SQLException caught: " + e.getMessage()); 
	 } %> </tr><%%></table><%
     
    %>
 
 <%
 
 %>

<% 



%>
</body>
</html>