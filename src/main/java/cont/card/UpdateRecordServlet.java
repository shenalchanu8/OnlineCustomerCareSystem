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


@WebServlet("/UpdateRecordServlet")
public class UpdateRecordServlet extends HttpServlet {
	private final static String query = "update card_details set holder_name=?,cvv=?,card_number=?,exp_month=?,exp_year=? where cid=?   ;";
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//get PrintWriter
		PrintWriter pw = res.getWriter();
		// set content type
		res.setContentType("text/html");
		//get id
		Integer cid  = Integer.parseInt(req.getParameter("cid"));
		String holder_name = req.getParameter("holder_name");
		int cvv = Integer.parseInt(req.getParameter("cvv"));
		int card_number = Integer.parseInt(req.getParameter("card_number"));
		String exp_month = req.getParameter("exp_month");
		String exp_year = req.getParameter("exp_year");
		
		//load jdbc driver 
		try { 
			Class.forName("com.mysql.jdbc.Driver");//link sql server driver
	} catch(Exception e) {
		e.printStackTrace();
	}
		
		//generates the connection
		try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_customercare","root","dev123");
				PreparedStatement ps = con.prepareStatement(query);){
		ps.setString(1, holder_name);
		ps.setInt(2, cvv);
		ps.setInt(3, card_number);
		ps.setString(4, exp_month);
		ps.setString(5, exp_year);
		ps.setInt(6, cid);
			int count = ps.executeUpdate();
			//execute the query
			if(count==1) {
				pw.println("<h2> card updated successfully</h2>");
			}else {
				pw.println("<h2> card not updated successfully</h2>");
			}
			
			
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
				doGet(req, res);
	}

}
