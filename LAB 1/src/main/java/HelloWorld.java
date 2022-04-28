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
		"<html>" +
				
		"<style>" +
		"table {" +
		  "border-collapse: collapse;" +
		  "border-spacing: 40px;" +
		  "width:80%;" +
		"}" +
		"th, td {" +
			  "text-align:center;" +
			  "padding: 10px;" +
		"}" +
		"tbody tr:nth-child(odd) {" +
		  "background-color: #8BA6E9;" +
		"}" +

		"tbody tr:nth-child(even) {" +
		  "background-color: #BED0F4;" +
		"}" +
		 "th {" +
		 	"font-size: 130%;" +
		 	"color: white;" +
		 	"background-color: #0000A0;" +
		 "}" +
		"</style>" +
				 
		"<head>\n"+
		"<title> Hello World! </title>\n"+
		"</head>\n"+
		"<body>\n" +
		"<h1> Hello World! </h1>\n" +
		"</body>" +
		
		"<table border=\"1\">" +
		  "<tr>" +
		    "<th>Nom</th>" +
		    "<th>Descripció</th>" +
		    "<th>ID</th>" +
		    "<th>Telèfon</th>" +
		 "</tr>");
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
		        ResultSetMetaData rsmd = rs.getMetaData();
		        int number_of_columns = rsmd.getColumnCount();
		        while (rs.next()) {
		        	out.print("<tr>");
		        	for(int i = 1; i<=number_of_columns; i++) {
		        		String nom = rs.getString(rsmd.getColumnName(i));
		        		out.println("<td>" + nom + "</td>");
		        	}
		        	out.print("</tr>");
		        }
		        out.println("</table></html>");
		        db.disconnectBD();
		        
	    } catch (Exception e) {

	        System.err.println("Got an exception! ");
	        System.err.println(e.getMessage());
	    }
	}

}
