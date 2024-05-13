<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
    <%@ page import="com.customer.Customer" %>
    <%@ page import="com.feedback.FeedbackInsertDMUtil" %>
      <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.feedback.Feedback" %>
    
    <%
    	Integer fid = Integer.parseInt(request.getParameter("fid"));
    FeedbackInsertDMUtil dao = new FeedbackInsertDMUtil(DBconnect.getConn());
    	
    	
      %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title> Edit </title>
</head>

<style>

/* Reset default margin and padding for all elements */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Define styles for the body */
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}

/* Style the container */
.container {
  width: 80%;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Style the title */
.title {
  text-align: center;
  margin-bottom: 20px;
}

/* Style the input boxes and labels */
.inputbox {
  margin-bottom: 15px;
}

#deets {
  display: inline-block;
  width: 100px; /* Adjust the width as needed */
  font-weight: bold;
}

#in {
  width: 100%; /* Make the input boxes take the full width */
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

/* Style the button */
.button {
  text-align: center;
  margin-top: 20px;
}

#sub {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

#sub:hover {
  background-color: #0056b3;
}


</style>


<body>  
	<div class = "container">
		<div class = "title" id = "ti"><b>Edit Feedback</b>
		<form action = "UpdateFeedbackServlet" method = "post">
			<input type = "text" value = "<%=fid %>" name = "fid">
			<div class = "details">
			<%
			List<Customer> cusDetails = (List<Customer>) session.getAttribute("cusDetails");
			System.out.println(session.getAttribute("cusDetails"));
			   if (cusDetails != null && !cusDetails.isEmpty()){
				   for(Customer customer: cusDetails){
						int cusID = customer.getId();
				
			%>
					<input type="hidden" value="<%=cusID%>" name = "fid">
					<%
			
				   }}
			    List<Feedback> feed = dao.getData2(fid);
				for(Feedback fd: feed){
			%>
				<div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Name</span>
				<input type = "text" id = "in" name = "fullname" required = "required" value = "<%=fd.getName() %>">
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Email</span>
				<input type = "text" id = "in" name = "email" required = "required" value = "<%=fd.getEmail() %>">
				 </div>
				 <div class = "inputbox" id = box>
				<span class = "d" id = "deets">Feedback</span>
				<input name = "feedback" id = "in" required = "required" value = "<%=fd.getFeedback() %>">
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