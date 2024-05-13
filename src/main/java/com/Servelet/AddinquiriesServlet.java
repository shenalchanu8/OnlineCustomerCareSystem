package com.Servelet;       
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.*;
import com.User.*;
import com.Db.*;
import com.customer.*;

/**
 * Servlet implementation class AddinquiriesServlet
 */
@WebServlet("/AddinquiriesServlet")

//insert//
public class AddinquiriesServlet extends HttpServlet {
	
	 
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = -1;
		String uidParameter = request.getParameter("uid");
		if (uidParameter != null && !uidParameter.isEmpty()) {
		    uid = Integer.parseInt(uidParameter);
		    
		} else {
			System.out.println("id is empty");
		   
		}
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String category = request.getParameter("category");
	
		String summary = request.getParameter("summary");
		String description = request.getParameter("description"); 
		
		
		inquiryDao dao = new inquiryDao(DBconnect.getConn());
		
		boolean f = dao.Addinquiry(fullname,email,category,summary,description,uid);
		
		
		
	
		
	  
	
	if (f) {
		System.out.println("data inserted succesfully");
		response.sendRedirect("show_inquiry_to_user.jsp");
		
	}
	else {
		System.out.println("Data not inserted");
	}
		
	}
	

	

}
