package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feedback.FeedbackInsertDMUtil;
import com.Db.DBconnect;


@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteFeedbackServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer fid = Integer.parseInt(request.getParameter("fid"));
			System.out.println(fid);

			FeedbackInsertDMUtil dao = new FeedbackInsertDMUtil(DBconnect.getConn());
			boolean f = dao.DeleteFeedback(fid);
			HttpSession session = null;
			
			if(f) {
				session = request.getSession();
				session.setAttribute("deletemsg", "Inquiry deleted succesfully");
				response.sendRedirect("Feedback_show_to_user.jsp");
			}
			else {
				session= request.getSession(); 
				session.setAttribute("wrongmsg", "Something went wrong...");
				response.sendRedirect("Feedback_show_to_user.jsp");
				
			}
			
		}catch(Exception e ) {
			e.printStackTrace();
			
		}
		
	

}
}
