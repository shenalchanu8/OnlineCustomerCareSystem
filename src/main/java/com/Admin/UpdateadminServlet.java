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


@WebServlet("/UpdateadminServlet")
public class UpdateadminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateadminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("cusid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		
		
		boolean isTrue;
		
		isTrue = AdminDBUtil.updateadmin(id, name, email, phone, username, password);
		
		if(isTrue == true) {
			
			List<Admin> adminDetails = AdminDBUtil.getAdminDetails(id);
			request.setAttribute("adminDetails",adminDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("adminaccount.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
		
	}
	

}
