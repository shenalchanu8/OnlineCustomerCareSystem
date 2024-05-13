<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
    <%@ page import="com.Admin.Admin" %>
    <%@ page import="com.DAO.*" %>
      <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.User.Inquiry" %>
      <%@ page import="com.customer.Customer" %>
     <%@ page import="com.DAO.inquiryDao" %>
    
  
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
		<div class = "title" id = "ti"><b>Provide Solution</b>
		 <%
            Integer inquiryid = Integer.parseInt(request.getParameter("inquiry_id"));
             Integer uid = Integer.parseInt(request.getParameter("uid"));
        	inquiryDao dao = new inquiryDao(DBconnect.getConn()); 
        	Inquiry in = dao.getDatabyid(inquiryid);
        	
        	
    %>
    
		<form action = "SolutionServlet" method = "post">
		
			<div class = "details">
			<%--
				List<Admin> adminDetails = (List<Admin>) session.getAttribute("adminDetails");
			System.out.println(session.getAttribute("adminDetails"));
			   if (adminDetails != null && adminDetails.isEmpty()){
				   for(Admin admin: adminDetails){
						int adminID = admin.getId();
				
			%>
						<input type="text" value="<%=adminID%>" name = "uid">
					<%}
			}else{
				System.out.println("Admin id  is null");
			}
				
			--%>
			
						<div class = "inputbox" id = "box">
				<span class = "d" id = "deets">User iD</span>
				<input type = "text" id = "in" name = "uid" required = "required" value = <%=uid %> readonly >
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Inquiry ID</span>
				<input type = "text" id = "in" name = "inquiryid" required = "required" value = "<%=in.getId() %>" readonly  >
				 </div>
				 <div class = "inputbox" id = box>
				<span class = "d" id = "deets">Category</span>
				<input name = "category" id = "in" required = "required" value = "<%=in.getCategory() %>" readonly >
				
				 </div>
				 
					
					
				
				<div class = "inquiry" id = "box2">
				<span class = "no">Summary of the inquiry</span>
				<input type = "text" id ="in1" name = "summary" required = "required" value = "<%=in.getSummary() %>"readonly  >
				</div>
				<div class = "inquiry" id = "box1">
				<span class = "no">Description of the inquiry</span>
				<input rows = "9" cols = " " id = "in2"name = "description" required = "required" value = "<%=in.getDescription() %>" readonly >
				</div>
				<div class = "inquiry" id = "box1">
				<span class = "no">Solution</span>
				<input rows = "9" cols = " " id = "in2"name = "solution" required = "required" >
				</div>
				<div class = "button">
					<button id = "sub" >Proceed</button>
				
				
				</div>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>