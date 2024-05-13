package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Db.*;
@WebServlet("/FeedbackInsertServlet")
public class FeedbackInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FeedbackInsertServlet() {
        super();
            }

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String feedback = request.getParameter("feedback");
		Integer uid = Integer.parseInt(request.getParameter("uid"));
		//int rating = Integer.parseInt("rating");
		
		
		
		 FeedbackInsertDMUtil db = new  FeedbackInsertDMUtil(DBconnect.getConn());
		
		boolean f = db.Addinquiry(name,email,feedback,uid);
	
	if (f) {
		System.out.println("data inserted succesfully");
		response.sendRedirect("Feedback_show_to_user.jsp");
		
	}
	else {
		System.out.println("Data not inserted");
	}
		
	}

}