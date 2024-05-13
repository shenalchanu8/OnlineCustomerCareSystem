<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
     <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.User.Inquiry" %>
       <%@ page import="com.DAO.inquiryadminDAO" %>
         <%@ page import="com.customer.Customer" %>
         <%@ include file = "adminNave.jsp" %>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="ISO-8859-1">
<title>Inquiries display for admin</title>
	    <h1>Inquiries</h1>
    <table>
        <tr>
            <th>User ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Category</th>
            <th>Priority</th>
            <th>Summary</th>
            <th>Description</th>
            
            
            
        </tr>
        	<%
        	 List<Customer> cusDetails2 = (List<Customer>) session.getAttribute("cusDetails");
			Customer cs = new Customer();
		
				
						inquiryadminDAO dao = new inquiryadminDAO(DBconnect.getConn());
						
						
						
							List<Inquiry> inq = dao.getData();
							for(Inquiry in: inq){
								
								
							
							
							
				%>	
        
            <tr>
            	<td><%=in.getUid() %></td>
                <td><%=in.getFull_name() %></td>
                <td><%=in.getEmail_address() %></td>
              
                <td><%=in.getCategory() %></td>
                <td><%=in.getPriority() %></td>
                <td><%=in.getSummary() %></td>
                <td><%=in.getDescription() %></td>
                <td><a href = "adminSolution.jsp?inquiry_id=<%=in.getId() %>&uid=<%=in.getUid() %> "><button>Proceed </button></a></td>
                
            </tr>
            <% 	
					
				}		
						
					%>
            
       
    </table>
</head>
<body>

</body>
</html>