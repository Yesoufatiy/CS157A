<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="javax.servlet.http.*,javax.servlet.*"%>
        
    
<!DOCTYPE html>
<html>
<script src="basics.js"> </script>

  <link rel="stylesheet" href="style.css">
  <style>
  #buttonColor {
background-color: #ff6363;
  color: white;
    width: 300px;
    height: 40px;
    font-size:16px;
} 
  </style>
  
  <script>

  </script>
<head>
<meta charset="UTF-8">
<title>search4House</title>


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
     
     
     
     
     %> 


      <form name = "returningUser" action="" style="margin-left:5%; margin-right:5%" method="POST" onSubmit="" autocomplete="on">
  <div class="form-group"  style="padding-right:30%; padding-left:30%;">
    <label for="usernameTitle">Email address</label>
    <input type="username" class="form-control" id="username" name="username"  placeholder="Username" required>
    <small class="text-muted">Enter your username</small>
    <br><br>
    <label for="passwordTitle">Password</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
    <small id="passwordHint" class="text-muted">Do not share your password with anyone else</small>
    
    <br><br>
  </div>
           <button   class="btn btn-primary" id="buttonColor" style="margin-left:30%; width: 15%;" onclick="location.href='Register.jsp';">Register</button>
  
         <button type="submit"  class="btn btn-primary" id="buttonColor" style=" margin-left:5%; width: 15%;" onclick="">Log In</button>
  






  <%
  if (request.getParameter("username") != null && request.getParameter("password")!=null){
  String aUsername = request.getParameter("username");
 // System.out.println(aUsername);

  String aPassword = request.getParameter("password");  
 // System.out.println(aPassword);
  ResultSet rs = stmt.executeQuery("SELECT * FROM search4houses.Accounts WHERE username='"+aUsername+"' AND password='"+aPassword+"';"); 
  
  if (rs.next()==true){
	  String userID = rs.getString("accID");
 // System.out.println(userID);
  //System.out.println(rs.getString("email"));

  //System.out.println("hi");
  
  
  
  
  
  response.sendRedirect("Profile.jsp");

  session.setAttribute("userID",userID); 
  session.setAttribute("username",aUsername); 

  

  
  }
  


   else{
%><br>
<span id="passwordHint" class="error text-danger" style="margin-left:30%; margin-right:5%" ><small>Username and/or password is incorrect</small></span>

<%
  }
 
  
  
 

  }

  
  
  
     
     
     stmt.close();
     con.close();
     } catch(SQLException e) {
     out.println("SQLException caught: " + e.getMessage()); 
 }
 %>
 
</form>

</body>
</html>