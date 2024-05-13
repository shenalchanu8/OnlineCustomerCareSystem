package com.Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.inquiryDao;
import com.Db.DBconnect;


@WebServlet("/DeleteInquiryServlet")
public class DeleteInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteInquiryServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer inquiryid = Integer.parseInt(request.getParameter("inquiry_id"));
			System.out.println(inquiryid);

			inquiryDao dao = new inquiryDao(DBconnect.getConn());
			boolean f = dao.DeleteInquiry(inquiryid);
			HttpSession session = null;
			
			if(f) {
				session = request.getSession();
				session.setAttribute("deletemsg", "Inquiry deleted succesfully");
				response.sendRedirect("show_inquiry_to_user.jsp");
			}
			else {
				session= request.getSession(); 
				session.setAttribute("wrongmsg", "Something went wrong...");
				response.sendRedirect("show_inquiry_to_user.jsp");
				
			}
			
		}catch(Exception e ) {
			e.printStackTrace();
			
		}
		
	

}
}
