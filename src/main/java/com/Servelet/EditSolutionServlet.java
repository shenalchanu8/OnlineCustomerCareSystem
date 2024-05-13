package com.Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.SolutionDAO;
import com.DAO.inquiryDao;
import com.Db.DBconnect;


@WebServlet("/EditSolutionServlet")
public class EditSolutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditSolutionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			Integer solutionid = Integer.parseInt(request.getParameter("solutionid"));
			String category = request.getParameter("category");
			
			String summary = request.getParameter("summary");
			String description = request.getParameter("description"); 
			String solution = request.getParameter("solution"); 
			
			SolutionDAO dao = new SolutionDAO(DBconnect.getConn());
			
			boolean f = dao.SolutionUpdate(solutionid, category, summary, description, solution);
			if (f) {
				System.out.println("Data updated succesfully");
				HttpSession session = request.getSession();
				session.setAttribute("Updatemessage", "Solution updated successfully");
				response.sendRedirect("show_solution_to_admin.jsp");
				
				
			}
			else {
				System.out.println("Data not updated");
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}


	}


