package cont.card;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FormUpdateRecordServlet")
public class FormUpdateRecordServlet extends HttpServlet {private final static String query = "update payment_proceed set fullname=?,id=?,email=?,priority=?,date=? where pay_id = ? ;";
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
				PrintWriter pw = res.getWriter();
				// set content type
				res.setContentType("text/html");
				//get id
				Integer pay_id  = Integer.parseInt(req.getParameter("pay_id"));
				String fullname = req.getParameter("fullname");
	    		int id = Integer.parseInt(req.getParameter("id"));
	    		String email = req.getParameter("email");
	    		String priority = req.getParameter("priority");
	    		String date = req.getParameter("date");
				
				//load jdbc driver 
				try { 
					Class.forName("com.mysql.jdbc.Driver");//link sql server driver
			} catch(Exception e) {
				e.printStackTrace();
			}  
				
				//generates the connection
				try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_customercare","root","dev123");
						PreparedStatement ps = con.prepareStatement(query);){
				
				
					ps.setString(1, fullname);
					ps.setInt(2, id);
					ps.setString(3, email);
					ps.setString(4, priority);
					ps.setString(5, date);
					ps.setInt(6,pay_id);
					int count = ps.executeUpdate();
					//execute the query
					if(count==1) {
						pw.println("<h2> form updated successfully</h2>");
					}else {
						pw.println("<h2> form not updated successfully</h2>");
					}
					
					
				}catch(SQLException se) {
					pw.println("<h2>"+se.getMessage()+"<h2>");//usual DB util is done in servlet file
					se.printStackTrace();
				}catch(Exception e){
					e.printStackTrace();
				}
				pw.println("<a href ='paymentForm.jsp'><button class='btn' >form upload portal</button></a>");
				pw.println("&nbsp;&nbsp;");
				pw.println("<a href ='showpayment'><button class='btn' >show user</button></a>");
				pw.close(); 
				
		}
						

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
