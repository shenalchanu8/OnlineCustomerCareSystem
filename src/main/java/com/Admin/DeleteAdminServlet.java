package com.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.Customer;
import com.customer.CustomerDBUtil;


@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("cusid");
		boolean isTrue;
		
		isTrue = CustomerDBUtil.deletecustomer(id);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("AdminRegister.jsp");
			dis.forward(request, response);
		}
		else {
			List<Admin> adminDetails = AdminDBUtil.getAdminDetails(id);
			request.setAttribute("adminDetails", adminDetails);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("adminaccount.jsp");
			dis1.forward(request, response);
		}
		
		
	}
  

}
