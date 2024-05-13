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

/**
 * Servlet implementation class EditInquiryServlet
 */
@WebServlet("/EditInquiryServlet")
public class EditInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditInquiryServlet() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			Integer inquiryid = Integer.parseInt(request.getParameter("inquiryid"));
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String category = request.getParameter("category");
			
			String summary = request.getParameter("summary");
			String description = request.getParameter("description");
			
			inquiryDao dao = new inquiryDao(DBconnect.getConn());
			
			boolean f = dao.inquiryUpdate(inquiryid,fullname,email,category,summary,description);
			if (f) {
				System.out.println("Data updated succesfully");
				HttpSession session = request.getSession();
				session.setAttribute("Updatemessage", "Inquiry updated successfully");
				response.sendRedirect("show_inquiry_to_user.jsp");
				
				
			}
			else {
				System.out.println("Data not updated");
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
