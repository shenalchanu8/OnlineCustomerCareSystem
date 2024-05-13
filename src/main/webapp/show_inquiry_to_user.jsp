<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
     <%@ page import="com.customer.Customer" %>
     <%@ page import="com.DAO.inquiryDao" %>
      <%@ page import="com.Db.DBconnect" %>
      <%@ page import="com.User.Inquiry" %>
     
    
    <%
    
    
    List<Customer> cusDetails2 = (List<Customer>) session.getAttribute("cusDetails");
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style >
:root{
    --main-color: #8e44ad;
    --black:#222;
    --white:#fff;
    --light-black:#777;
    --light-white:#fff9;
    --dark-dg:rgba(0,0,0, .7);
    --light-dg:#eee;
    --border: .1rem solid var(var(--black));
    --box-shadow: 0 .5rem 1rem rgba(0,0,0, .1);
    --text-shadow:0 .5rem 3rem rgba(0,0,0, .3);
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
	background: lightblue;
	background-position: center;
	background-size: cover;
	min-height: 100vh;
	width: 100%;
}
.center{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	background: white;
	border-radius: 10px;
}

  

 .container {
    width: 80%; /* Adjust the width as needed */
    margin: 0 auto; /* Center the container horizontally */
    text-align: center; /* Center the contents inside the container */
    padding: 20px; /* Add some padding for spacing */
  }

  .container h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
  }

  .container input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
  }

  .container h5 {
    font-size: 18px;
    font-weight: bold;
  }

  .container p {
    font-size: 16px;
    margin: 5px 0;
  }
 
  .baba{
  
   width: 80%; /* Adjust the width as needed */
    margin: 0 auto; /* Center the container horizontally */
    text-align: center; /* Center the contents inside the container */
    padding: 20px; 
  }
.baba h5{
 font-size: 18px;
    font-weight: bold;
}
.baba p{
 font-size: 16px;
    margin: 5px 0;
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

 

</style>

<title>Show Inquiry</title>
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

	<%
		String updatemsg = (String)session.getAttribute("Updatemessage");
		if (updatemsg != null){
			%>
			<div class = "alert alert-success" role = "alert"><%=updatemsg %></div>
		<%
		session.removeAttribute("updatemsg");
		}
	
	%>
	
	<%
		String wrongmsg = (String)session.getAttribute("wrongmsg");
		if (wrongmsg  != null){
			%>
			<div class = "alert alert-success" role = "alert"><%=wrongmsg  %></div>
		<%
		session.removeAttribute("wrongmsg");
		}
	
	%>
	<%
		String deletemsg = (String)session.getAttribute("deletemsg");
		if (deletemsg  != null){
			%>
			<div class = "alert alert-success" role = "alert"><%=deletemsg %></div>
		<%
		session.removeAttribute("deletemsg");
		}
	
	%>

	<div class = "container">
		<h2>All inquiries</h2>
		
		<div>
			<div>
				<%
					if(cusDetails2  != null){
						inquiryDao dao = new inquiryDao(DBconnect.getConn());
						
						for(Customer customer: cusDetails2){
							int cusID = customer.getId();
							List<Inquiry> inq = dao.getData(cusID);
							for(Inquiry in: inq){
							
							
							
				%>	
				
			<div class="baba">
					
					<h5>category:  <%= in.getCategory() %></h5>
					
					<h5>Summary: <%= in.getSummary() %></h5>
					<p>Description : <%= in.getDescription() %>.</p>
					
						<div class="but">
							<a href = "DeleteInquiryServlet?inquiry_id=<%=in.getId() %> ">Delete</a>
							
							<a href = "inquiry_edit.jsp?inquiry_id=<%=in.getId() %> ">Edit</a>
						
						</div>
						
						
						
						</div>		
				</div>
			
			</div>
		
		</div>
	
	</div>
					<% 	
					
							}		
						}
					}
					
					%>


</body>
</html>