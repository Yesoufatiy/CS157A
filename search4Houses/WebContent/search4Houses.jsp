<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Search4House</title>
    </head>
  <body>
    <h1>Search4House</h1>
    

    <% 
     String db = "search4houses";
        String user; // assumes database name is the same as username
         // user = "root";
        //String password = "newpassword";
        try {
            
            java.sql.Connection con; 
           // Class.forName("com.mysql.cj.jdbc.Driver");
     		Class.forName("com.mysql.jdbc.Driver"); 

     		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");

           // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/search4houses?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("List of Accounts: \"Accounts\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Accounts");
            %>     <table border="1">
			<tr> <td> <u>accID</u> </td> <td> username </td> <td> password </td> <td> fullName </td> <td> profilePicURL </td> <td> email </td> <td> phoneNum </td> 
			</tr> <%
            while(rs.next())
			{	%><tr><% for (int x = 1; x<=7; x++)
            	{ %>
            	
              		<td><%out.println(rs.getObject(x)); }}%> </td>
              		</tr> </table><%
			
            
              		
              		
            out.println("List of all Listings: \"Listings\": <br/>");
              		rs = stmt.executeQuery("SELECT * FROM Listings");
            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
            %> <table border="1"> <tr> <td> <u>listingID</u> </td> <td> roomType </td> <td> price </td> <td> leaseTimeframe </td> <td> roomNum </td> <td> bathroomNum </td> <td> description </td> <td> photosID </td></tr> 
			<%
            while(rs.next())
            {	%><tr><% for (int x = 1; x<= 8; x++)
            	{ %>
              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
            
            
            
                    
                    
                    out.println("List of all Photos: \"Photos\": <br/>");
                            rs = stmt.executeQuery("SELECT * FROM Photos");
                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                            %> <table border="1"> <tr> <td> <u>photoID</u> </td> <td> <u>listingID</u> </td>  <td> photoURL </td> </tr>  <% 
                            while(rs.next())
                            {	              		
                            	%><tr><% for (int x = 1; x<= 3; x++)
                            	{ %>
                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
                			
                    
                            out.println("List of all Favorite Lists: \"Favorites\": <br/>");
                              		rs = stmt.executeQuery("SELECT * FROM Favorites");
                                    //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                    
                                    
 %> <table border="1"> <tr> <td> <u>listID</u> </td> <td> <u>accID</u> </td> <td> listing1ID </td> <td> listing2ID </td> <td> listing3ID </td> <td> listing4ID </td> <td> listing5ID </td> </tr> <%
                            while(rs.next())
                                    {	
                                    %><tr><% for (int x = 1; x<= 7; x++)
                                    	{ %>
                                      		<td><%out.println(rs.getObject(x));}}%> </td></tr></table><% 

                    
                    
                    
                                    out.println("List of all Addition Contacts: \"AdditionalContacts\": <br/>");
                                      		rs = stmt.executeQuery("SELECT * FROM AdditionalContacts");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            
                                            
         %> <table border="1"> <tr> <td> <u>contactAccID</u> </td> <td><u> listingID</u> </td> <td> phoneNum </td> <td> email </td> <td>name</td></tr> <%
                                    while(rs.next())
                                            {	
                                            %><tr><% for (int x = 1; x<= 5; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x));}}%> </td></tr></table><% 
                                            
                                            out.println("List of all Addresses \"Addresses\": <br/>");
                                              		rs = stmt.executeQuery("SELECT * FROM Addresses");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            %> <table border="1"> <tr> <td><u> addrID</u> </td><td> <u>listingingID</u> </td>  <td> streetAddress </td> <td> city </td>  <td> state </td> <td> zipCode </td></tr> 
                                			<%
                                            while(rs.next())
                                            {	%><tr><% for (int x = 1; x<= 5; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%


                                            
                                            
                                            out.println("List of all Account's Listings: \"Accounts_Listings\": <br/>");
                                              		rs = stmt.executeQuery("SELECT * FROM Accounts_Listings");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            %> <table border="1"> <tr> <td> user_id </td> <td> listing_id </td> </tr> 
                                			<%
                                            while(rs.next())
                                            {	%><tr><% for (int x = 1; x<= 2; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
                                            out.println("List of all Listings' Addresses: \"Listing_Address\": <br/>");
                                              		rs = stmt.executeQuery("SELECT * FROM Listing_Address");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            %> <table border="1"> <tr> <td> listing_id </td> <td> addr_id </td> </tr> 
                                			<%
                                            while(rs.next())
                                            {	%><tr><% for (int x = 1; x<= 2; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
                                            out.println("List of all Listings' Addition Contact: \"Listings_AdditionalContact\": <br/>");
                                              		rs = stmt.executeQuery("SELECT * FROM Listings_AdditionalContact");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            %> <table border="1"> <tr> <td> listing_id </td> <td> addContact_id </td> </tr> 
                                			<%
                                            while(rs.next())
                                            {	%><tr><% for (int x = 1; x<= 2; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
                                            out.println("List of all Listings' Photos: \"Listings_Photos\": <br/>");
                                              		rs = stmt.executeQuery("SELECT * FROM Listings_Photos");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            %> <table border="1"> <tr> <td> photo_id </td> <td> listing_id </td> </tr> 
                                			<%
                                            while(rs.next())
                                            {	%><tr><% for (int x = 1; x<= 2; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
                                            out.println("List of all Users' Favorite Lists: \"User_Favorites\": <br/>");
                                              		rs = stmt.executeQuery("SELECT * FROM User_Favorites");
                                            //stmt.executeUpdate("INSERT INTO Listings (listingID, userID, location, roomType, price, leaseTimeframe, roomNum, bathroomNum, description, photosID) " +"VALUES ('2', '10', 22)");    	
                                            %> <table border="1"> <tr> <td> user_id </td> <td> list_id </td> </tr> 
                                			<%
                                            while(rs.next())
                                            {	%><tr><% for (int x = 1; x<= 2; x++)
                                            	{ %>
                                              		<td><%out.println(rs.getObject(x)); }}%> </td></tr> </table><%
                            
                            
                    
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
