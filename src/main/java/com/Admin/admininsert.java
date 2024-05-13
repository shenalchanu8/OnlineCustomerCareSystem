package com.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.CustomerDBUtil;


@WebServlet("/admininsert")
public class admininsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("Name");
		String email =request.getParameter("Email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("ui");
		String password = request.getParameter("ps");
		  
		boolean isTrue;
		
		isTrue = AdminDBUtil.insertadmin(name, email, phone, username, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("adminlogin.jsp");
			dis.forward(request, response);
		}
		
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}
	

}
       



