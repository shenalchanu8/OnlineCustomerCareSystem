package com.feedback;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBconnect;

@WebServlet("/UpdateFeedbackServlet")
public class UpdateFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int fID = Integer.parseInt(request.getParameter("fid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String feedback = request.getParameter("feedback");
		int review = Integer.parseInt(request.getParameter("review"));
		
		

}
}