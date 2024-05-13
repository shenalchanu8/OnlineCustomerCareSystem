package cont.card;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/showdata")
public class showServlet extends HttpServlet {
	private final static String query = "select cid,holder_name,cvv,card_number,exp_month,exp_year from card_details;";
	private static final long serialVersionUID = 1L;
       
    
    

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//get PrintWriter
				PrintWriter pw = res.getWriter();
				// set content type
				res.setContentType("text/html");
				
				
				try { 
					Class.forName("com.mysql.jdbc.Driver");//link sql server driver
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
			//generates the connection
			try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_customercare","root","dev123");
					PreparedStatement ps = con.prepareStatement(query);){
				//result set
				ResultSet rs = ps.executeQuery();
				pw.println("<div style='margin:auto;width:1000px:margin-top:1000px'>");
				pw.println("<table style=\"width: 100%; border: 1px solid #ccc; border-collapse: collapse;\">");
				pw.println("<tr style=\"background-color: #eee;\">");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">Card Payment Id</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">holder_name</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">cvv</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">card_number</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">exp_month</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">exp_year</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">UPDATE</th>");
				pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">DELETE</th>");
				pw.println("</tr>");
				while(rs.next()) {
					pw.println("<tr>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">"+rs.getInt(1)+"</td>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">"+rs.getString(2)+"</td>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">"+rs.getInt(3)+"</td>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">"+rs.getInt(4)+"</td>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">"+rs.getString(5)+"</td>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">"+rs.getString(6)+"</td>"); 
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\"><a href='updateurl?cid="+rs.getInt(1)+"'>Update</a></td>");
					pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\"><a href='deleteurl?cid="+rs.getInt(1)+"'>Delete</a></td>");
					pw.println("</tr>");
				}
				
				pw.println("</table>");
				
			
				
				
			}catch(SQLException se) {
				pw.println("<h2>"+se.getMessage()+"<h2>");//usual DB util is done in servlet file
				se.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			pw.println("<a href ='card.jsp'><button class='btn'  style=\"background-color: #eee;width: 100%\" >card upload portal</button></a>");
			pw.println("</div>");
			pw.close(); 
				
			}
	

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				doGet(req, res);
	}

}
