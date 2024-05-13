package cont.card;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import com.customer.Customer;
import com.Db.DBconnect;
import com.User.Inquiry;


@WebServlet("/showpayment")
public class FormShowServlet extends HttpServlet {
	private final static String query = "select pay_id,fullname,id,email,priority,date from payment_proceed  ;";
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
				
				)
		
		{
			//result set
			
			PreparedStatement ps = con.prepareStatement(query);
		
			
			ResultSet rs = ps.executeQuery();
			pw.println("<div style='margin:auto;width:1000px:margin-top:1000px'>");
			pw.println("<table style=\"width: 100%; border: 1px solid #ccc; border-collapse: collapse;\">");

			pw.println("<tr style=\"background-color: #eee;\">");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">payment id</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">fullname</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">id</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">email</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">priority</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">date</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">UPDATE</th>");
			pw.println("<th style=\"padding: 8px; border: 1px solid #ccc;\">DELETE</th>");
			pw.println("</tr>");
			while (rs.next()) {
			    pw.println("<tr>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">" + rs.getInt(1) + "</td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">" + rs.getString(2) + "</td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">" + rs.getInt(3) + "</td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">" + rs.getString(4) + "</td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">" + rs.getString(5) + "</td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\">" + rs.getString(6) + "</td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\"><a href='updateurll?pay_id=" + rs.getInt(1) + "'>Update</a></td>");
			    pw.println("<td style=\"padding: 8px; border: 1px solid #ccc;\"><a href='deleteurll?pay_id=" + rs.getInt(1) + "'>Delete</a></td>");
			    pw.println("</tr>");
			}
			pw.println("</table>");
		}catch(SQLException se) {
			pw.println("<h2>"+se.getMessage()+"<h2>");//usual DB util is done in servlet file
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		pw.println("<a href ='paymentForm.jsp'><button class='btn' style=\"background-color: #eee;width: 100%\" >Form upload portal</button></a>");
		pw.println("</div>");
		pw.close(); 
			
		RequestDispatcher dis = req.getRequestDispatcher("adminNave.jsp");
		dis.forward(req,res);
		}
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doGet(request, response);
	}

}
