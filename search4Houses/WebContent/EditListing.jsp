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




function disableAddContact(){

	if (document.getElementById("userContactInfo").checked = true){
		
		document.getElementById("contactName").disabled = true;
		document.getElementById("contactName").value = "";
		document.getElementById("email").disabled = true;
		document.getElementById("email").value = "";
		document.getElementById("phoneNum").disabled = true;
		document.getElementById("phoneNum").value = "";


	} 
	}
function enableAddContact(){
if (document.getElementById("aDiffContact").checked = true){
		
		document.getElementById("contactName").disabled = false;
		document.getElementById("email").disabled = false;
		document.getElementById("phoneNum").disabled = false;

	}
}


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
 if (session == null || session.getAttribute("userID") == null) {
	 
	 %> 
	 
	  <div class="addListTitle"  style="position: absolute; align: center; padding-right:30%; padding-left:30%;">
	  Log in required to access this page<br>
	  <small>You will be redirected in 3 seconds...</small>
	  </div>
	          <meta http-equiv="refresh" content="3;url=Register.jsp" />
	  



	<%

 } else {
 


	 
 //need to get the listingID from profile selection
 
 
 
 String db = "search4houses";
 String user;
 String addressID;
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     
//listings
 	    Statement stmt = con.createStatement();
		   ResultSet rs = stmt.executeQuery("SELECT * FROM search4houses.Listings WHERE listingID=3"); //insert listingID here
			//(listingID, roomType, price, leaseTimeFrame, roomNum, bathroomNum, description)
	
//photos
			 Statement stmt1 = con.createStatement();
				   ResultSet rs1 = stmt1.executeQuery("SELECT * FROM search4houses.Photos, search4houses.Listings_Photos WHERE photoID=photo_id AND listing_id=3;");  //insert listingID here
			
//Address	   
			Statement stmt2 = con.createStatement();
				   ResultSet rs2 = stmt2.executeQuery("SELECT * FROM search4houses.Addresses, search4houses.Listing_Address WHERE addrID=addr_ID AND listing_id=3;");  //insert listingID here
//Contact	   
			Statement stmt3 = con.createStatement();
					ResultSet rs3 = stmt3.executeQuery("SELECT * FROM search4houses.AdditionalContacts, search4houses.Listings_AdditionalContact WHERE contactAccID=addContact_ID AND listing_id=3;");  //insert listingID here
						   
			if (rs.next()==true && rs1.next()==true && rs2.next()==true && rs3.next()==true){
			String listingID = rs.getString("listingID");
			String roomType = rs.getString("roomType");
			String price = rs.getString("price");
			//System.out.println(price);

			String leaseTimeFrame = rs.getString("leaseTimeFrame");
			String roomNum = rs.getString("roomNum");
			String bathroomNum = rs.getString("bathroomNum");
			String description = rs.getString("description");
			
			String streetAddress = rs2.getString("streetAddress");
			String city = rs2.getString("city");
			String state = rs2.getString("state");
			String zipCode = rs2.getString("zipCode");
			
			String phoneNum = rs3.getString("phoneNum");
			String email = rs3.getString("email");
			String name = rs3.getString("name");
			
			
			
			
			
			

 %>





	
	
		<label class="addListSubTitle">
	
	
	
	
	
	
	 <form name = "newListing" action="ConfirmedNewListing.jsp" style="margin-left:5%; margin-right:5%" method="POST" onSubmit="" autocomplete="on">
	<div class="form-group">
	<div  style="padding-right:20%; padding-left:20%;"><fieldset style="padding:15px;">
	
	<legend style ="font-size:24px;color: #ff6363; padding-top: 10px;">Contact Info</legend>
	  <input type="radio" class="form-check-input" name="contactInfo" value="userContact" id="userContactInfo" onclick="if(this.checked){disableAddContact()}" > Use mine<br>
	  <input type="radio" class="form-check-input" name="contactInfo" value="diffContact" id="aDiffContact" onclick="if(this.checked){enableAddContact()}">Another Contact<br>
	  <br>Contact Name: <br>
        <input type="text" class="form-control" name="contactName" id="contactName" size=50  disabled placeholder="<%out.println(name);%>" value="<%out.println(name);%>"/> <br>
      Email Address: <br>
        <input type="email" class="form-control" name="email" id="email" size=60  disabled placeholder="<%out.println(email);%>" value="<%out.println(email);%>"/> <small></small><br>  
        Phone Number: <br>
        <input type="tel" class="form-control" name="phoneNum" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" id="phoneNum" size=30  disabled placeholder="<%out.println(phoneNum);%>" value="<%out.println(phoneNum);%>"/><small></small> <br>
        
	  
	
	
	</fieldset></div><hr class="dashed">
	
	
	<div class="col-3"> 		<label class="addListTitle">Room type</label> <br>
	<small>Select the type of room</small><br>
    <select class="custom-select" name = "roomType" size = 5 style="font-size:16px;">
    	<option value="<%out.println(roomType);%>" disabled selected> <%out.println(roomType);%> </option>
    <option value = "Apartment">Apartment</option>
        <option value = "Duplex">Duplex</option>
        <option value = "Shared Room">Shared Room</option>
        <option value = "Single Room">Single Room</option>
        <option value = "Studio">Studio</option>
    </select> <br><br><hr><br>
    <label class="addListTitle">
    	Price </label><br>
    	<small>Set pricing per month</small><br>
        <input type="number" class="form-control" name="price" placeholder="$<%out.println(price);%>" value="<%out.println(price);%>" > <br>
       <label class="addListTitle"> Number of Bedrooms </label><br>
      <small> Set number of bedrooms</small><br>
        <input type="number" class="form-control" name="bedroomNum" placeholder="<%out.println(roomNum);%>" value="<%out.println(roomNum);%>"> <br>
       <label class="addListTitle"> Number of Bathrooms</label> <br>
       <small>Set number of bathrooms</small> <br>
        <input type="number" class="form-control" name="bathroomNum" placeholder="<%out.println(bathroomNum);%>" value="<%out.println(bathroomNum);%>"> <br>
       <label class="addListTitle"> Lease length</label> <br>
      <small> Set lease length for total months</small><br>
      
        <input type="number" class="form-control" name="leaseLength" id="leaseTimeFrame" placeholder="<%out.println(leaseTimeFrame);%>" value="<%out.println(leaseTimeFrame);%>">
         </div>
         
         
         
        <div class="col-5"> 
         <fieldset>
       <legend style ="font-size:24px;color: #ff6363;"> Address </legend><br>
       
        Street Address
    	<input type="text" class="form-control" name="streetAddress" id="streetAddress"  placeholder="<%out.println(streetAddress);%>" value="<%out.println(streetAddress);%>">
       <br>
	<div class=" col-5">
      City
      <input type="text" class="form-control" name="city" id="city" placeholder="<%out.println(city);%>" value="<%out.println(city);%>">
    </div>
		
		<div class="col-3">
		State
		<%//code below borrowed from https://www.freeformatter.com/usa-state-list-html-select.html
			//a website that provides free web resources%>
		<select class="form-control" name="state" style="font-size:16px; width:90px;" >
	<option value="<%out.println(state);%>" disabled selected hidden> <%out.println(state);%> </option>
	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>
</select>	</div>
<div class="col-3">
	Zip Code: 
	        <input type="number" class="form-control" name="zipcode" id="zipcode" style="margin-bottom:40px;" placeholder="<%out.println(zipCode);%>" maxlength="5"  value="<%out.println(zipCode);%>"/> <br>
	       </div> </fieldset>
	       
	        <div class="col-12">
        <label for="info" class="addListTitle">Additional Information</label>
       <textarea name="information" class="form-control" rows="10" cols="40" style="font-size:16px;" placeholder="<%out.println(description);%>" value="<%out.println(description);%>"></textarea></div><br>
    
    </div>
	        
	       
	    <div class="col-3"> 
	    <label class="addListTitle" style="margin-left: 1%;">Photo(s): </label><br>
	<small>*jpg format only, up to 5 photos per listing* </small><br>
	
	 <%
	 int image = 1;				
	 %><br><b>Image(s): </b><br><%
	        while (rs1.next()){
				String URL = rs1.getString("photoURL")+".jpg";
				out.println(URL);
				%>
				 	<img src="img/<%out.println(URL);%>" height="200" width="300">
				 	   			<input type="hidden" name="image<%out.println(image);%>" value="<%out.println(URL);%>">
				 		<input type="file" name="image<%out.println(image);%>" accept="image/jpg" /> <br><br><br>
				 	
				 	 <%
				 	image++;
	        }
				
				if(image != 5){
				for (int i = image; i<=5; i++){
					%>
				 		<input type="file" name="image<%out.println(image);%>" accept="image/jpg" /> <br>
				 	
				 	 <%
				}
				}%>
	</div>
	

	
	
        
        
        
       
    
    
    
    
    
    
    <a class="col-9">
    <button type="submit" id="buttonColor" name="submitButton" style="float: right;" onclick=""/>Submit Listing</button>
    <button type="button" id="buttonColor" name="cancelButton" style="float: right; margin-right:25px" onclick="javascript:history.back()">Cancel New Listing</button>
    </a></div>
</form></label>


 
 
	
	
	<%

		}
    
    
    
    stmt.close();
    con.close();
 
 } catch(SQLException e) {
	     out.println("SQLException caught: " + e.getMessage()); 
	 }} %>

</body>
</html>