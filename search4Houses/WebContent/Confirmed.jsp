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


</script>


<style>
#buttonColor {
background-color: #ff6363;
  color: white;
    width: 300px;
    height: 40px;
    font-size:16px;
}






</style>

</head>
<body>

<jsp:include page="navBar.jsp" />


 
	<%
 


	 
 
 
 
 
 String db = "search4houses";
 String user;
 String addressID;
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     

 
    Statement stmt = con.createStatement();
	
    
   
    if (request.getParameter("newGeneratedID") != null || request.getParameter("contactName") != null || request.getParameter("email") != null ||  
    		request.getParameter("phoneNum") != null  || request.getParameter("street") != null ||  request.getParameter("city") != null || 
    		request.getParameter("state") != null || request.getParameter("zipcode") != null || request.getParameter("price") != null || 
    		request.getParameter("bedrooms") != null || request.getParameter("bathrooms") != null || request.getParameter("lease") != null || 
    		request.getParameter("roomType") != null || request.getParameter("image1") != null){
    	
    
    	String newGeneratedID = request.getParameter("newGeneratedID");
	   // out.println(newGeneratedID);
	    
	    String contactName = request.getParameter("contactName");
	    String email = request.getParameter("email");
	    String phoneNum = request.getParameter("phoneNum");
	    

	    
 	   // out.println(contactName);
 	    %><br><%
	   // out.println(email);
	    %><br><%
 	   // out.println(phoneNum);
	    
	    String  street = request.getParameter("street");
	    //out.println(street);
	    
	   String  city = request.getParameter("city");
    //out.println(city);
	  String  state = request.getParameter("state");
	   // out.println(state);
		  String  zipcode = request.getParameter("zipcode");
	    //out.println(zipcode);
	    
		  String price = request.getParameter("price");
		   // out.println("$"+price +"/month");
		String bedrooms = request.getParameter("bedrooms");
		  //  out.println(bedrooms+" bedroom(s)");
		String bathrooms = request.getParameter("bathrooms");
		   // out.println(bathrooms+" bathroom(s)");
		    String lease = request.getParameter("lease");
		   // out.println(lease+" month(s)");

			String roomType = request.getParameter("roomType");
		    //out.println(roomType);
		    			String info = request.getParameter("info");

		   // out.println(info);
		    String image1 = request.getParameter("image1");
		     image1 = image1.replace(".jpg","");
			  // out.println(image1);

		    
		    //Listings
		    
		    
		   stmt.executeUpdate("INSERT INTO search4houses.Listings (listingID, roomType, price, leaseTimeFrame, roomNum, bathroomNum, description) VALUES ("+newGeneratedID+", '"+roomType+"', "+price+", "+lease+", "+bedrooms+", "+bathrooms+", "+info+");"); 
		  
		   String userID = (String)session.getAttribute("userID");
		   Statement stmt1 = con.createStatement();

		   stmt1.executeUpdate("INSERT INTO search4houses.Accounts_Listings (user_id, listing_id) VALUES ("+userID+", "+newGeneratedID+");");
		    
		   //Photo image1   
		   Statement stmt2 = con.createStatement();
		    ResultSet rs2 = stmt2.executeQuery("SELECT photoID FROM search4houses.PHotos ORDER BY photoID DESC LIMIT 1;"); 		   
		    if (rs2.next()==true){

		    	 int photoID = Integer.parseInt(rs2.getString("photoID"));
		        int newGeneratedPhotoID = photoID+1;
		        
		        Statement stmt3 = con.createStatement();
				   stmt3.executeUpdate("INSERT INTO search4houses.Photos (photoID, photoURL) VALUES ("+newGeneratedPhotoID+", '"+image1+"');");
				   Statement stmt4 = con.createStatement();
				   stmt4.executeUpdate("INSERT INTO search4houses.Listings_Photos (photo_id, listing_id) VALUES ("+newGeneratedPhotoID+", "+newGeneratedID+");");
				    
				   
				   stmt3.close();
				    stmt4.close();


		    }
		    
		    //Address
Statement stmt3 = con.createStatement();
			
		    ResultSet rs3 = stmt3.executeQuery("SELECT addrID FROM search4houses.Addresses ORDER BY addrID DESC LIMIT 1;"); 		   
		    if (rs3.next()==true){

		    	 int addrID = Integer.parseInt(rs3.getString("addrID"));
		        int newGeneratedAddrID = addrID+1;
		        
		        Statement stmt4 = con.createStatement();
				   stmt4.executeUpdate("INSERT INTO search4houses.Addresses (addrID, streetAddress, city, state, zipCode) VALUES ("+newGeneratedAddrID+", '"+street+"', '"+city+"', '"+state+"', '"+zipcode+"');");
				   Statement stmt5 = con.createStatement();
				   stmt5.executeUpdate("INSERT INTO search4houses.Listing_Address (listing_id, addr_id) VALUES ("+newGeneratedID+", "+newGeneratedAddrID+");");
				    
				   
				   stmt4.close();
				    stmt5.close();


		    }
			  
		    
		    
		  //Additional Contact
		    Statement stmt4 = con.createStatement();
		    			
		    		    ResultSet rs4 = stmt4.executeQuery("SELECT contactAccID FROM search4houses.AdditionalContacts ORDER BY contactAccID DESC LIMIT 1;"); 		   
		    		    if (rs4.next()==true){

		    		    	 int contactID = Integer.parseInt(rs4.getString("contactAccID"));
		    		        int newGeneratedContactID = contactID+1;
		    		        Statement stmt7 = con.createStatement();
			    			
			    		    ResultSet rs7 = stmt7.executeQuery("SELECT contactAccID FROM search4houses.AdditionalContacts WHERE email='"+email+"' AND phoneNum='"+phoneNum+"' AND name='"+contactName+"';"); 		   
			    		    if (rs7.next()!=true){
			    		    	Statement stmt5 = con.createStatement();
			    				   stmt5.executeUpdate("INSERT INTO search4houses.AdditionalContacts (contactAccID, phoneNum, email, name) VALUES ("+newGeneratedContactID+", '"+phoneNum+"', '"+email+"', '"+contactName+"');");
			    				   stmt5.close();

			    		    }
		    		        Statement stmt6= con.createStatement();
		    				   stmt6.executeUpdate("INSERT INTO search4houses.Listings_AdditionalContact (listing_id, addContact_id) VALUES ("+newGeneratedID+", "+newGeneratedContactID+");");
		    				    
		    				   
		    				    stmt6.close();
		    				    stmt7.close();


		    		    }
		    		    
		    
		    
		    if (request.getParameter("image2") != null){
			    String image2 = request.getParameter("image2");
			    image2 = image2.replace(".jpg","");

			  //Photo image2  
				   Statement stmt5 = con.createStatement();
				    ResultSet rs5 = stmt5.executeQuery("SELECT photoID FROM search4houses.PHotos ORDER BY photoID DESC LIMIT 1;"); 		   
				    if (rs5.next()==true){

				    	 int photoID = Integer.parseInt(rs2.getString("photoID"));
				        int newGeneratedPhotoID = photoID+2;
				        
				        Statement stmt6 = con.createStatement();
						   stmt6.executeUpdate("INSERT INTO search4houses.Photos (photoID, photoURL) VALUES ("+newGeneratedPhotoID+", '"+image2+"');");
						   Statement stmt7 = con.createStatement();
						   stmt7.executeUpdate("INSERT INTO search4houses.Listings_Photos (photo_id, listing_id) VALUES ("+newGeneratedPhotoID+", "+newGeneratedID+");");
						    
						   
						   stmt6.close();
						    stmt7.close();


				    }
				    stmt5.close();

		    }
		    if (request.getParameter("image3") != null){
			    String image2 = request.getParameter("image3");
			    image2 = image2.replace(".jpg","");

			  //Photo image3   
				   Statement stmt5 = con.createStatement();
				    ResultSet rs5 = stmt5.executeQuery("SELECT photoID FROM search4houses.PHotos ORDER BY photoID DESC LIMIT 1;"); 		   
				    if (rs5.next()==true){

				    	 int photoID = Integer.parseInt(rs2.getString("photoID"));
				        int newGeneratedPhotoID = photoID+3;
				        
				        Statement stmt6 = con.createStatement();
						   stmt6.executeUpdate("INSERT INTO search4houses.Photos (photoID, photoURL) VALUES ("+newGeneratedPhotoID+", '"+image2+"');");
						   Statement stmt7 = con.createStatement();
						   stmt7.executeUpdate("INSERT INTO search4houses.Listings_Photos (photo_id, listing_id) VALUES ("+newGeneratedPhotoID+", "+newGeneratedID+");");
						    
						   
						   stmt6.close();
						    stmt7.close();


				    }
				    stmt5.close();
		    }
		    if (request.getParameter("image4") != null){
			    String image2 = request.getParameter("image4");
			    image2 = image2.replace(".jpg","");

			  //Photo image4   
				   Statement stmt5 = con.createStatement();
				    ResultSet rs5 = stmt5.executeQuery("SELECT photoID FROM search4houses.PHotos ORDER BY photoID DESC LIMIT 1;"); 		   
				    if (rs5.next()==true){

				    	 int photoID = Integer.parseInt(rs2.getString("photoID"));
				        int newGeneratedPhotoID = photoID+4;
				        
				        Statement stmt6 = con.createStatement();
						   stmt6.executeUpdate("INSERT INTO search4houses.Photos (photoID, photoURL) VALUES ("+newGeneratedPhotoID+", '"+image2+"');");
						   Statement stmt7 = con.createStatement();
						   stmt7.executeUpdate("INSERT INTO search4houses.Listings_Photos (photo_id, listing_id) VALUES ("+newGeneratedPhotoID+", "+newGeneratedID+");");
						    
						   
						   stmt6.close();
						    stmt7.close();


				    }
				    stmt5.close();
		    }
		    if (request.getParameter("image5") != null){
			    String image2 = request.getParameter("image5");
			    image2 = image2.replace(".jpg","");
			  //Photo image5   
				   Statement stmt5 = con.createStatement();
				    ResultSet rs5 = stmt5.executeQuery("SELECT photoID FROM search4houses.PHotos ORDER BY photoID DESC LIMIT 1;"); 		   
				    if (rs5.next()==true){

				    	 int photoID = Integer.parseInt(rs2.getString("photoID"));
				        int newGeneratedPhotoID = photoID+5;
				        
				        Statement stmt6 = con.createStatement();
						   stmt6.executeUpdate("INSERT INTO search4houses.Photos (photoID, photoURL) VALUES ("+newGeneratedPhotoID+", '"+image2+"');");
						   Statement stmt7 = con.createStatement();
						   stmt7.executeUpdate("INSERT INTO search4houses.Listings_Photos (photo_id, listing_id) VALUES ("+newGeneratedPhotoID+", "+newGeneratedID+");");
						    
						   
						   stmt6.close();
						    stmt7.close();


				    }
				    stmt5.close();
		    }

		    stmt.close();
		    stmt1.close();
		    stmt2.close();
		    stmt3.close();
		    stmt4.close();
		    
		    String redirectURL = "Listing.jsp?listing="+newGeneratedID;
			  
			 %>
			  <div class="addListTitle"  style="position: absolute; align: center; padding-right:30%; padding-left:30%;">
			  Listing successfully added!<br>
			  <small>You will be redirected in 3 seconds...</small>
			  </div>
			          <meta http-equiv="refresh" content="3;url=<%out.println(redirectURL);%>" />
			          
			          <%   
    }


 
 stmt.close();



 con.close();
 
 
 //String confirmed = "window.location.href = 'Listing.jsp?listing="+newGeneratedID+"'";

 
//  <br><br><input type="button" name="submitBtn" id="buttonColor" onclick="<%out.println(confirmed);" value="Confirm">


} catch(SQLException e) {
	     out.println("SQLException caught: " + e.getMessage()); 
	 } %>
	 


	  



	
</body>
</html>