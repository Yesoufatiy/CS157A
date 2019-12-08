

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
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
		
		String name = request.getParameter("name");
		String testname = request.getParameter("username");
		String testpass = request.getParameter("password");
		String mail = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
	 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/search4Houses", "root","newpassword");
	 		Statement stmt = con.createStatement();
	 	    ResultSet rs = stmt.executeQuery("select accID from accounts order by accID desc limit 1;");
	 	    String accID = "";
	 	    if (rs.next()){
	 	    	accID = Integer.toString(Integer.parseInt(rs.getString("accID"))+1);
	 	   	}
	 		int created = stmt.executeUpdate("insert into accounts (accID, username, password, fullName, email, phoneNum) values ('"+accID+"', '"+testname+"', '"+testpass+"', '"+name+"', '"+mail+"', '"+phone+"');");
	 		if (created == 1) {
	 			HttpSession session = request.getSession();
				session.setAttribute("username", testname);
				session.setAttribute("userID", name);
				response.sendRedirect("index.jsp?name="+testname+"");
			}
		} catch (SQLIntegrityConstraintViolationException e) {
			out.println("This username is already taken! Please try another one.");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
