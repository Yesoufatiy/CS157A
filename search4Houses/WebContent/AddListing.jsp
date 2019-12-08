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
 


	 
 
 
 
 
 String db = "search4houses";
 String user;
 String addressID;
 try {
     
     java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");
     

     
 %>





	
	
		<label class="addListSubTitle">
	
	
	
	
	
	
	 <form name = "newListing" action="ConfirmedNewListing.jsp" style="margin-left:5%; margin-right:5%" method="POST" onSubmit="" autocomplete="on">
	<div class="form-group">
	<div  style="padding-right:20%; padding-left:20%;"><fieldset style="padding:15px;">
	
	<legend style ="font-size:24px;color: #ff6363; padding-top: 10px;">Contact Info</legend>
	  <input type="radio" class="form-check-input" name="contactInfo" value="userContact" id="userContactInfo" onclick="if(this.checked){disableAddContact()}" > Use mine<br>
	  <input type="radio" class="form-check-input" name="contactInfo" value="diffContact" id="aDiffContact" onclick="if(this.checked){enableAddContact()}">Another Contact<br>
	  <br>Contact Name: <br>
        <input type="text" class="form-control" name="contactName" id="contactName" size=50 required disabled placeholder="FirstName LastName"/> <br>
      Email Address: <br>
        <input type="email" class="form-control" name="email" id="email" size=60 required disabled placeholder="123@abc.com"/> <small></small><br>  
        Phone Number: <br>
        <input type="tel" class="form-control" name="phoneNum" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" id="phoneNum" size=30 required disabled placeholder="123-456-7890"/><small></small> <br>
        
	  
	
	
	</fieldset></div><hr class="dashed">
	
	
	<div class="col-3"> 		<label class="addListTitle">Room type</label> <br>
	<small>Select the type of room</small><br>
    <select class="custom-select" name = "roomType" size = 5 style="font-size:16px;"required>
    <option value = "Apartment">Apartment</option>
        <option value = "Duplex">Duplex</option>
        <option value = "Shared Room">Shared Room</option>
        <option value = "Single Room">Single Room</option>
        <option value = "Studio">Studio</option>
    </select> <br><br><hr><br>
    <label class="addListTitle">
    	Price </label><br>
    	<small>Set pricing per month</small><br>
        <input type="number" class="form-control" name="price" placeholder="price per month" size="20" required/> <br>
       <label class="addListTitle"> Number of Bedrooms </label><br>
      <small> Set number of bedrooms</small><br>
        <input type="number" class="form-control" name="bedroomNum" placeholder="# of bedrooms" size="20" required/> <br>
       <label class="addListTitle"> Number of Bathrooms</label> <br>
       <small>Set number of bathrooms</small> <br>
        <input type="number" class="form-control" name="bathroomNum" placeholder="# of bathrooms" size="20" required/> <br>
       <label class="addListTitle"> Lease length</label> <br>
      <small> Set lease length for total months</small><br>
        <input type="number" class="form-control" name="leaseLength" placeholder="# of months" size="20" required/>
         </div>
         
         
         
        <a class="col-5"> 
         <fieldset>
       <legend style ="font-size:24px;color: #ff6363;"> Address </legend><br>
       
        Street Address
    	<input type="text" class="form-control" name="streetAddress" id="streetAddress" required placeholder="123 abc st">
       <br>
	<div class=" col-5">
      City
      <input type="text" class="form-control" name="city" id="city" placeholder="City" required>
    </div>
		
		<div class="col-3">
		State
		<%//code below borrowed from https://www.freeformatter.com/usa-state-list-html-select.html
			//a website that provides free web resources%>
		<select class="form-control" name="state" style="font-size:16px; width:90px;" required>
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
	        <input type="number" class="form-control" name="zipcode" id="zipcode" style="margin-bottom:40px;" placeholder="Zip Code" maxlength="5"  required/> <br>
	       </div> </fieldset></a>
	        
	        
	    <div class="col-3"> 
	    <label class="addListTitle" style="margin-left: 1%;">Photo(s): </label><br>
	<small>*jpg format only, up to 5 photos per listing* </small><br>
	
	<input type="file" name="image1" accept="image/jpg" required /> <br>
	<input type="file" name="image2" accept="image/jpeg"  /> <br>
	<input type="file" name="image3" accept="image/jpeg"  /> <br>
	<input type="file" name="image4" accept="image/jpeg"  /> <br>
	<input type="file" name="image5" accept="image/jpeg"  /> <br><br><br>
	</div>
	

	
	
        
        
        
        <a class="col-8">
        <label for="info" class="addListTitle">Additional Information</label>
       <textarea name="information" class="form-control" rows="15" cols="100" style="font-size:16px;" placeholder="Enter additional description."></textarea></a><br>
    
    
    
    
    
    
    
    
    <a class="col-9">
    <button type="submit" id="buttonColor" name="submitButton" style="float: right;" onclick=""/>Submit Listing</button>
    <button type="button" id="buttonColor" name="cancelButton" style="float: right; margin-right:25px" onclick="javascript:history.back()">Cancel New Listing</button>
    </a></div>
</form></label>


 
 
	
	
	<%
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT listingID FROM search4houses.Listings ORDER BY listingID DESC LIMIT 1;"); 
    if (rs.next()==true){

    int listID = Integer.parseInt(rs.getString("listingID"));
    int newGeneratedID = listID+1;
    System.out.println(newGeneratedID);

    String roomType = request.getParameter("roomType");
    
    System.out.println(roomType);
    
    
    
    
    }
    
    
    
    
    stmt.close();
    con.close();
 
 } catch(SQLException e) {
	     out.println("SQLException caught: " + e.getMessage()); 
	 }} %>

</body>
</html>