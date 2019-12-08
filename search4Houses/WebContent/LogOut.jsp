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
     
     
     
     
     
session.invalidate();

%> 
  <div class="addListTitle"  style="position: absolute; align: center; padding-right:30%; padding-left:30%;">
  Successfully logged out!<br>
  <small>You will be redirected in 3 seconds...</small>
  </div>
          <meta http-equiv="refresh" content="3;url=LogIn.jsp" />
  



<%

     
     
     stmt.close();
     con.close();
     } catch(SQLException e) {
     out.println("SQLException caught: " + e.getMessage()); 
 }
 %>
 
</form>
</body>
</html>