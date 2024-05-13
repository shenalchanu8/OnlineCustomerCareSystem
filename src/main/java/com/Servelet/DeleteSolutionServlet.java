package com.Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.inquiryDao;
import com.Db.DBconnect;
import com.DAO.SolutionDAO;



@WebServlet("/DeleteSolutionServlet")
public class DeleteSolutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteSolutionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer solutionid = Integer.parseInt(request.getParameter("sol_id"));
			System.out.println(solutionid);

			SolutionDAO dao = new SolutionDAO(DBconnect.getConn());
			boolean f = dao.DeleteSolution(solutionid);
			HttpSession session = null;
			
			if(f) {
				session = request.getSession();
				session.setAttribute("deletemsg", "Solution deleted succesfully");
				response.sendRedirect("show_solution_to_admin.jsp");
			}
			else {
				session= request.getSession(); 
				session.setAttribute("wrongmsg", "Something went wrong...");
				response.sendRedirect("show_solution_to_admin.jsp");
				
			}
			
		}catch(Exception e ) {
			e.printStackTrace();
			
		}
		
	

}
	}

	


