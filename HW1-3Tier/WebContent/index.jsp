<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
	<h1>JDBC Connection example</h1>
	<%
		String db = "cs157a";//request.getParameter("cs157a"); //or root
		String user = "cs157a"; // assumes database name is the same as username
		try {
			java.sql.Connection con;
			Class.forName("org.gjt.mm.mysql.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, "root", "root");
			out.println(db + "database successfully opened.");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from emp");
			while (rs.next())
				out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3));
			
		} catch (SQLException e) {
			out.println("SQLExceptioncaught: " + e.getMessage());
		}
	%>
</body>
</html>
