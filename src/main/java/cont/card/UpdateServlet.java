package cont.card;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateurl")
public class UpdateServlet extends HttpServlet {
	private final static String query = "select cid,holder_name,cvv,card_number,exp_month,exp_year from card_details where cid = ? ;";
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
		PrintWriter pw = res.getWriter();
		// set content type
		res.setContentType("text/html");
		Integer cid  = Integer.parseInt(req.getParameter("cid"));
		
		
		//load jdbc driver 
		try { 
			Class.forName("com.mysql.jdbc.Driver");//link sql server driver
	} catch(Exception e) {
		e.printStackTrace();
	}
		
		//generates the connection
		try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_customercare","root","dev123");
				PreparedStatement ps = con.prepareStatement(query);){
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			rs.next();
			pw.println("<form action='UpdateRecordServlet?cid="+rs.getString(1)+"' method='post'>");
			pw.println("<table>");
			pw.println("<tr>");
			pw.println("<td>card payment id</td>");
			pw.println("<td><input type ='text' name = 'cid' value='"+rs.getInt(1)+"' readonly></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Holder Name</td>");
			pw.println("<td><input type ='text' name = 'holder_name' value='"+rs.getString(2)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>cvv</td>");
			pw.println("<td><input type ='text' name = 'cvv' value='"+rs.getInt(3)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Card Number</td>");
			pw.println("<td><input type ='text' name = 'card_number' value='"+rs.getInt(4)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Exp Month</td>");
			pw.println("<td><input type ='text' name = 'exp_month' value='"+rs.getString(5)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Exp Year</td>");
			pw.println("<td><input type ='text' name = 'exp_year' value='"+rs.getString(6)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td><button type='submit'>update</button></td>");
			pw.println("<td><button type='reset'>Cancel</button></td>");
			pw.println("</tr>");
			pw.println("</table>");
			pw.println("</form>");
	
			
			
		}catch(SQLException se) {
			pw.println("<h2>"+se.getMessage()+"<h2>");//usual DB util is done in servlet file
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		pw.println("<a href ='card.jsp'><button class='btn' >card upload portal</button></a>");
		pw.println("&nbsp;&nbsp;");
		pw.println("<a href ='showdata'><button class='btn' >show user</button></a>");
		pw.close(); 

			
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
