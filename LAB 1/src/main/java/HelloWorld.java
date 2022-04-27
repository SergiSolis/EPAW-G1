import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import utils.DB;

/**
 * Servlet implementation class HelloWorld
 */
@WebServlet("/HelloWorld")
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorld() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println
		("<!DOCTYPE html>\n" +
		"<head>\n"+
		"<title> Hello World! </title>\n"+
		"</head>\n"+
		"<body>\n" +
		"<h1> Hello World! </h1>\n" +
		"</body>");
		doSQL(out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static void doSQL(PrintWriter out) {
	    try {
	        DB db = new DB();
	        ResultSet rs = db.executeSQL("SELECT * FROM user;");
	        out.println("<html><table>");
	        while (rs.next()) {
	            // you only select one field, but you can easily adapt
	            // this code to have more fields (i.e. table columns)
	            String nom = rs.getString("nom");
	            out.println("<tr><td>" + nom + "</td></tr>");
	        }
	        out.println("</table></html>");
	        db.disconnectBD();
	    } catch (Exception e) {

	        System.err.println("Got an exception! ");
	        System.err.println(e.getMessage());
	    }
	}

}
