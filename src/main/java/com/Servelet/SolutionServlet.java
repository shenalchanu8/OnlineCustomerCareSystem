package com.Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SolutionDAO;
import com.DAO.inquiryDao;
import com.Db.DBconnect;

import com.DAO.*;
import com.User.*;
import com.Db.*;
import com.customer.*;


@WebServlet("/SolutionServlet")
public class SolutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SolutionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer inquiryid = Integer.parseInt(request.getParameter("inquiryid"));
		Integer uid = Integer.parseInt(request.getParameter("uid"));
		
		String category = request.getParameter("category");
		
		String summary = request.getParameter("summary");
		String description = request.getParameter("description"); 
		String solution = request.getParameter("solution"); 
		int adminid = -1;
		String adminidParameter = request.getParameter("adminid");
		if (adminidParameter != null && !adminidParameter.isEmpty()) {
		   adminid = Integer.parseInt(adminidParameter);
		    
		} else {
			System.out.println("id is empty");
		   
		}
		
		
		SolutionDAO dao = new SolutionDAO(DBconnect.getConn());
		
		boolean f = dao.Addinquiry(category,summary,description,solution,uid,inquiryid);
		
		
	
	
		
	  
	
	if (f) {
		System.out.println("data inserted succesfully");
		response.sendRedirect("show_solution_to_admin.jsp");
		
	}
	else {
		System.out.println("Data not inserted");
	}
		
	}
	

	



	}

	

	

	


