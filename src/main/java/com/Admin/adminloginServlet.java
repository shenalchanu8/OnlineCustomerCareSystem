package com.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.Customer;
import com.customer.CustomerDBUtil;


@WebServlet("/adminloginServlet")
public class adminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public adminloginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uid");
		String password = request.getParameter("pass");
		
		System.out.println("hello");
	
		
		try {
		
		List<Admin> adminDetails = AdminDBUtil.validate(username, password);
		
		HttpSession session = request.getSession(true);
		session.setAttribute("adminDetails",adminDetails);
		
		request.setAttribute("adminDetails",adminDetails);
		
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		RequestDispatcher dis3 = request.getRequestDispatcher("adminaccount.jsp");
		dis3.forward(request,response);
		
		RequestDispatcher dis4 = request.getRequestDispatcher("adminSolution.jsp");
		dis4.forward(request,response);
		 
		
	}

	}


