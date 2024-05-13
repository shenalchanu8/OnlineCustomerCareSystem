  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.customer.Customer" %>
   
<!DOCTYPE html>
<html>
<head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 100%;
        max-width: 800px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    #bo{
    	font-size:25px;
    	color:
    }
     #ti{
    	color:#021691;
    	font-size:20px;
    }

    .title {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        font-color:red;
    }
   

    .inputbox {
        margin: 10px 0;
    }

    #box {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
    }

    #in, #in1, #in2 {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    select#in {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .no {
        font-weight: bold;
    }

    #box2, #box1 {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
    }

    button#sub {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button#sub:hover {
        background-color: #0056b3;
    }
</style>





</head>
<body>


<div class = "container">
		<div class = "title" id = "bo">How can we help?</div>
		<div id="ti">
		<form action = "AddinquiriesServlet" method = "post">
			<div class = "details">
			<%
				List<Customer> cusDetails = (List<Customer>) session.getAttribute("cusDetails");
			System.out.println(session.getAttribute("cusDetails"));
			   if (cusDetails != null && !cusDetails.isEmpty()){
				   for(Customer customer: cusDetails){
						int cusID = customer.getId();
				
			%>
					<input type="hidden" value="<%=cusID%>" name = "uid">
					<%}
			}else{
				System.out.println("User id  is null");
			}
				
			%>
				<div class = "inputbox" id = "box">
				<span class = "no" id = "deets">Full Name</span>
				<input type = "text" id = "in" name = "fullname" required = "required">
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "no" id = "deets">Email address</span>
				<input type = "text" id = "in" name = "email" required = "required">
				 </div>
				 <div class = "inputbox" id = box>
				<span class = "no" id = "deets">Category</span>
				<select name = "category" id = "in" name = "category" required = "required">
					<option>Product or Service</option>
					<option>Order and payment</option>
					<option>Technical support</option>
					<option>Account Management</option>
					<option>Shipping and Delivery</option>
					<option>Returns and warranties</option>
					<option>Accessibility and support needs</option>
					<option>Promotion and discounts</option>
					<option>General</option>
					<option>other</option>
				</select>
				 </div>
				
				
				<div class = "inquiry" id = "box2">
				<span class = "no">Summary of the inquiry</span>
				<input type = "text" id ="in1" name = "summary" required = "required">
				</div>
				<div class = "inquiry" id = "box1">
				<span class = "no">Description</span>
				<textarea rows = "9" cols = " " id = "in2"name = "description" required = "required"></textarea>
				</div>
				<div class = "button">
					<button id = "sub" >Proceed</button>
					
					
					
				
				</div>
				</div>
			
		</form>
		</div>
		</div>
	
</body>
</html>