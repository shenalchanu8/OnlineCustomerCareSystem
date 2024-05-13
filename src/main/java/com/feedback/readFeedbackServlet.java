package com.feedback;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FeedbackInsert")
public class readFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Feedback> feedbackList=FeedbackInsertDMUtil.getAllFeedback();
		request.setAttribute("feedbackList", feedbackList);
		request.getRequestDispatcher("feedbackList.jsp").forward(request, response);
		
		
	}

}
