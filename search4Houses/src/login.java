

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String testname = request.getParameter("username");
		String testpass = request.getParameter("password");
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
	 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/search4Houses", "root","newpassword");
	 		Statement stmt = con.createStatement();
	 		ResultSet rs = stmt.executeQuery("select username, password, fullName from accounts where username = '"+testname+"' and password = '"+testpass+"'");
	 		if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("username", testname);
				String userID = rs.getString("fullName");
				session.setAttribute("userID", userID);
				response.sendRedirect("index.jsp?name="+testname+"");
			} else {
				out.println("Incorrect Username or Password. Please try again with correct credentials or Sign Up for a new account.");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
