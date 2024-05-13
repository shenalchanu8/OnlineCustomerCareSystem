<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
    <%@ page import="com.customer.Customer" %>
    <%@ page import="com.DAO.inquiryDao" %>
      <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.User.Inquiry" %>
    
    <%
    	Integer inquiryid = Integer.parseInt(request.getParameter("inquiry_id"));
    	inquiryDao dao = new inquiryDao(DBconnect.getConn());
    	
    	
      %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title> Edit</title>
</head>
<link rel = "stylesheet" type = "text/css" href =" cus_inquiry.css" />
</head>
<body>  
	<div class = "container">
		<div class = "title" id = "ti"><b>Edit Inquiry</b>
		<form action = "EditInquiryServlet" method = "post">
			<input type = "text" value = "<%=inquiryid %>" name = "inquiryid">
			<div class = "details">
			<%
				List<Customer> cusDetails = (List<Customer>) session.getAttribute("cusDetails");
			System.out.println(session.getAttribute("cusDetails"));
			   if (cusDetails != null && !cusDetails.isEmpty()){
				   for(Customer customer: cusDetails){
						int cusID = customer.getId();
				
			%>
					<input type="hidden" value="<%=cusID%>" name = "uid">
					<%
			
				   }}
			    List<Inquiry> inq = dao.getData2(inquiryid);
				for(Inquiry in: inq){
			%>
				<div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Full Name</span>
				<input type = "text" id = "in" name = "fullname" required = "required" value = "<%=in.getFull_name() %>">
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Email address</span>
				<input type = "text" id = "in" name = "email" required = "required" value = "<%=in.getEmail_address() %>">
				 </div>
				 <div class = "inputbox" id = box>
				<span class = "d" id = "deets">Category</span>
				<input name = "category" id = "in" required = "required" value = "<%=in.getCategory() %>">
				
				 </div>
				
				<div class = "inquiry" id = "box2">
				<span class = "no">Summary of the inquiry</span>
				<input type = "text" id ="in1" name = "summary" required = "required" value = "<%=in.getSummary() %>">
				</div>
				<div class = "inquiry" id = "box1">
				<span class = "no">Description</span>
				<input rows = "9" cols = " " id = "in2"name = "description" required = "required" value = "<%=in.getDescription() %>">
				</div>
				<div class = "button">
					<button id = "sub" >Proceed</button>
					
					<%
				
				}
						
					%>
					
				
				</div>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>