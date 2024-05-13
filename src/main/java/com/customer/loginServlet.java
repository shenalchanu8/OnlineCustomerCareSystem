  

package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


 
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("uid");
		String password = request.getParameter("pass");
		
	
		
		try {
		
		List<Customer> cusDetails = CustomerDBUtil.validate(username, password);
		
		HttpSession session = request.getSession(true);
		session.setAttribute("cusDetails",cusDetails);
		
		request.setAttribute("cusDetails",cusDetails);
		
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
		dis.forward(request,response);
		
		 RequestDispatcher dis2 = request.getRequestDispatcher("customer_inquiry.jsp");
		dis2.forward(request,response);
		
		 RequestDispatcher dis3 = request.getRequestDispatcher("show_solution_to _user.jsp");
			dis3.forward(request,response);
		
	}

}