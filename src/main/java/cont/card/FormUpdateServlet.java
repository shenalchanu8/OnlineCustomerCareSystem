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


@WebServlet("/updateurll")
public class FormUpdateServlet extends HttpServlet {
	private final static String query = "select pay_id,fullname,id,email,priority,date from payment_proceed where pay_id=?;";
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
				PrintWriter pw = res.getWriter();
				// set content type
				res.setContentType("text/html");
				Integer pay_id  = Integer.parseInt(req.getParameter("pay_id"));
				
				
				//load jdbc driver 
				try { 
					Class.forName("com.mysql.jdbc.Driver");//link sql server driver
			} catch(Exception e) {
				e.printStackTrace();
			}
				
				//generates the connection
				try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_customercare","root","dev123");
						PreparedStatement ps = con.prepareStatement(query);){
					ps.setInt(1, pay_id);
					ResultSet rs = ps.executeQuery();
					rs.next();
					pw.println("<form action='FormUpdateRecordServlet?pay_id="+rs.getInt(1)+"' method='post'>");
					pw.println("<table>");
					pw.println("<tr>");
					pw.println("<td>Payment ID</td>");
					pw.println("<td><input type ='text' name = 'pay_id' value='"+rs.getInt(1)+"' readonly></td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td>Fullname</td>");
					pw.println("<td><input type ='text' name = 'fullname' value='"+rs.getString(2)+"'readonly></td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td>ID</td>");
					pw.println("<td><input type ='text' name = 'id' value='"+rs.getInt(3)+"'readonly></td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td>Email</td>");
					pw.println("<td><input type ='text' name = 'email' value='"+rs.getString(4)+"'readonly></td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td>Priority</td>");
					pw.println("<td><input type ='text' name = 'priority' value='"+rs.getString(5)+"'></td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<tr>");
					pw.println("<td>Date</td>");
					pw.println("<td><input type ='text' name = 'date' value='"+rs.getString(6)+"'></td>");
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
				pw.println("<a href ='paymentForm.jsp'><button class='btn' >Form upload portal</button></a>");
				pw.println("&nbsp;&nbsp;");
				pw.println("<a href ='showpayment'><button class='btn' >show user</button></a>");
				pw.close(); 

					
			}

			

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
