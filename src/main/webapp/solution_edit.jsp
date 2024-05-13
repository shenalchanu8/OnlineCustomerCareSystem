<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
    <%@ page import="com.Admin.Admin" %>
    <%@ page import="com.DAO.*" %>
      <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.User.Solution" %>
      <%@ page import="com.customer.Customer" %>
     <%@ page import="com.DAO.inquiryDao" %>
    <%
    	Integer solutionid = Integer.parseInt(request.getParameter("sol_id"));
          SolutionDAO dao = new SolutionDAO(DBconnect.getConn());
    	
    	
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
		<div class = "title" id = "ti"><b>Provide Solution</b>
		<input type = "text" value = "<%=solutionid %>">
		 <%
		 List<Solution> sol = dao.getData2(solutionid);
			for(Solution in: sol){
		%>        	
        	
    
		<form action = "EditSolutionServlet" method = "post">
		
			<div class = "details">
			
			
						<div class = "inputbox" id = "box">
				<span class = "d" id = "deets">User iD</span>
				<input type = "text" id = "in" name = "uid" required = "required" value = <%=in.getUid() %> readonly >
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Inquiry ID</span>
				<input type = "text" id = "in" name = "inquiryid" required = "required" value = "<%=in.getInquiryid() %>" readonly  >
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
				<input rows = "9" cols = " " id = "in2"name = "solution" required = "required" value = "<%=in.getSolution() %>" >
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