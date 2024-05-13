<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.customer.Customer" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
	<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }

    .container-fluid {
        width: 100%;
        max-width: 800px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    marquee {
        margin-top: 20px;
    }

    h2.text-primary {
        color: #007bff;
        text-align: center;
    }

    .form {
        background-color: #f7f7f7;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    .big-danger {
        font-size: 24px;
        color: #dc3545;
    }

    .inputbox {
        margin: 10px 0;
    }

    .d {
        font-weight: bold;
    }

    #box {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 5px;
    }

    #in {
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

    button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }

    button a {
        color: #fff;
        text-decoration: none;
    }

    button:hover {
        background-color: #0056b3;
    }
    
    *{
    font-family: 'Poppins', sans-serif;
    margin: 0;
    box-sizing: border-box;
    outline: none;
    border: none;
    text-decoration: none;
    text-transform: capitalize;
    padding: 0;
    box-sizing: border-box;
}

body{
	
	background-position: center;
	background-size: cover;
	min-height: 100vh;
	width: 100%;
}

.create{
		
	width: 400px;
	background: #fff;
	border-radius: 6px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%) ;
	text-align: center;
	padding: 0 30px 30px;
	color: #333;
}

.form-box td{
	
	left: 50%;
}
input[type="submit"]{
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: rgb(0, 128, 255);
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
	
}
input[type="submit"]:hover{
	border-color:  rgb(0, 128, 255);
}

input[type="button"]{
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: rgb(0, 128, 255);
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
	
}
input[type="button"]:hover{
	border-color:  rgb(0, 0, 160);
}


html::-webkit-scrollbar
{
    width: 1rem;
}

html::-webkit-scrollbar-track
{
    background-color: #222;
}
html::-webkit-scrollbar-thumb
{
    background-color:black;
}

section
{
    padding: 6rem 10%;
}


@keyframes fadeIN{
    0%{
        transform: scale(05);
        opacity: 0;

    }
}

.btn
{
    display: inline-block;
    background: rgb(184, 184, 231);
    margin-top: 0rem;
    color: var(--white);
    font-size: 1.5rem;
    padding: 2rem 1rem;
    cursor: pointer;
}

.btn:hover
{
    background: var(--black);
}

.nav-container{
	background-color:#fff;
	display: flex;
	justify-content: space-between;
	overflow: hidden;
}

.right-side, .left-side{
	list-style-type: none;
}
.right-side li, .left-side li{
	display: inline-block;
}

.right-side li a, .left-side li a{
	text-decoration: none;
	display: block;
	width: 100%;
	height: 100%;
	font-size: 13px;
	color: #222;
	padding :14px 16px;
	font-weight: bold;
}

.right-side li a:hover, .left-side li a:hover{
	background-color: plum;
}
		table, th, td {
  			border: 1px solid #fff;
		}
    
</style>

		
</style>
</head>
<body>

<nav class="nav-container">

	<ul class="right-side">
	<li><a href="home.jsp">Home</a></li>
	<li><a href="customer_inquiry.jsp">Inquiry</a></li>
	<li><a href="show_solution_to _user.jsp">View Solution</a></li>
	<li><a href="feedback.jsp">Feedback</a></li>
	<li><a href="paymentForm.jsp">Payment</a></li>
	<li><a href="">VIew Payment Details</a></li>
	
	
	</ul>
	
	

	
	<ul class="left-side">
	<li><a href="login.jsp">User Login</a></li>
	<li><a href="logout">logout</a></li>
	<li><a href="logout"><%= session.getAttribute("name") %></a></li>
	</ul>

</nav>

<div class = "container-fluid">
		<marquee><h2 class = "text-primary">Payment</h2></marquee>
		
		<form action = "paymentFormServlet" method = "post" class ="form card" id="frm">
		<h2 class="big-danger text-black card-header ">Payment Form</h2>
		
		<%
				List<Customer> cusDetails = (List<Customer>) session.getAttribute("cusDetails");
			System.out.println(session.getAttribute("cusDetails"));
			   if (cusDetails != null && !cusDetails.isEmpty()){
				   for(Customer customer: cusDetails){
						int cusID = customer.getId();
						String name = customer.getName();
						String email = customer.getEmail();
				
			%>
			
			
			
				<div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Full Name</span>
				<input type = "text" id = "in" name = "fullname" required = "required" value = "<%=name %>" readonly>
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "d" id = "deets">ID</span>
				<input type = "text" id = "in" name = "id" required = "required" value = "<%=cusID %>" readonly>
				 </div>
				 <div class = "inputbox" id = "box">
				<span class = "d" id = "deets">Email address</span>
				<input type = "text" id = "in" name = "email" required = "required" value =<%=email %> readonly>
				 </div>
				 
				 <div class = "inputbox" id = "box">
				<span class = "d">Priority</span>
				<select name = "priority" id = "in" name = "priority" required = "required">
					<option>Within 6 hours   fee = $10.00</option>
					<option>Within 12 hours   fee = $8.00</option>
					<option>Within 24 hours   fee = $6.00</option>
					<option>Within 3 days   fee = $4.00</option>
					<option>Within a week   fee = $0.00 </option>
					<div class = "inputbox" id = "box">
				
				 </div>
					
				</select>
				
				
				
				</div>
				<div>
				<span class = "d" id = "deets">Payment date</span>
				<input type = "date" id = "in" name = "date" required = "required"  >
				</div>
				<button type="submit">Confirm</button> 
			</div>
			<button><a href = "showpayment?u_id=<%=cusID %>">show User</a></button>
			<%
				   }
			   }
			%>
		</form>
		</div>
	</div>


</body>
</html>