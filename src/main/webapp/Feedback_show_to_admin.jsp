<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
     <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.feedback.Feedback" %>
       <%@ page import="com.feedback.FeedbackAdminDAO" %>
         <%@ page import="com.feedback.Feedback" %>
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


<title>Feedbacks display for admin</title>
	    <h1>Feedback</h1>
    <table>
        <tr>
            <th>Feedback ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Feedback</th>
            
            
        </tr>
        	<%
        	List<Customer> cusDetails2 = (List<Customer>) session.getAttribute("cusDetails");
			Customer cs = new Customer();
		
        	
				
						FeedbackAdminDAO dao = new FeedbackAdminDAO(DBconnect.getConn());
						
						
							List<Feedback> list = dao.getData();
							for(Feedback fd: list){
								
								
							
							
							
				%>	
        
            <tr>
            	<td><%=fd.getFid() %></td>
                <td><%=fd.getName() %></td>
                <td><%=fd.getEmail() %></td>
                <td><%=fd.getFeedback() %></td>
                
            </tr>
            <% 	
					
				}		
					
					%>
            
       
    </table>
</head>
<body>

</body>
</html>