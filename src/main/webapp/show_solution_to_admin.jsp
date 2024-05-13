<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
     <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.User.Solution" %>
       <%@ page import="com.DAO.solutionadminDAO" %>
         <%@ page import="com.customer.Customer" %>
         <%@ include file = "adminNave.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>body, h1 {
    margin: 0;
    padding: 0;
}



.container {
    max-width: 100%;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    text-align: center;
    margin-top: 20px; 
}



table {
    width: 100%;
    border-collapse: collapse;
}

/* Style table header (th) */
th {
    background-color: #007bff;
    color: white;
    text-align: left;
    padding: 10px;
}

/* Style table rows (tr) */
tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Style table data (td) */
td {
    padding: 10px;
}

/* Highlight table rows on hover */
tr:hover {
    background-color: #cfd6e4;
}</style>
<title>Inquiries display for admin</title>
	    <h1>Solutions for the Inquiries</h1>
    <table>
        <tr>
            <th>Solution ID</th>
            <th>User ID</th>
            <th>Inquiry ID</th>
            <th>Category</th>
            <th>Summary</th>
            <th>Description</th>
            <th>Solution<th>
            
            
            
        </tr>
        	<%
        	 List<Customer> cusDetails2 = (List<Customer>) session.getAttribute("cusDetails");
			Customer cs = new Customer();
		
				
				solutionadminDAO dao = new solutionadminDAO (DBconnect.getConn());
						
						
				List<Solution> sol = dao.getData();
					for(Solution in: sol){			
							
				%>	
        
            <tr>
            	<td><%=in.getId() %></td>
                <td><%=in.getUid() %></td>
                <td><%=in.getInquiryid() %></td>
              
                <td><%=in.getCategory() %></td>
                <td><%=in.getSummary() %></td>
                <td><%=in.getDescription() %></td>
                <td><%=in.getSolution() %></td>
                <td><a href = "DeleteSolutionServlet?sol_id=<%=in.getId() %> ">Delete</a></td>
                <td><a href = "solution_edit.jsp?sol_id=<%=in.getId() %> " >Edit</a></td>
              
                
            </tr>
            <% 	
					
				}		
						
					%>
            
       
    </table>
</head>
<body>

</body>
</html>