<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="">
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
	background: url(image/cu.jpg);
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
<title>Insert title here</title>
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




<div class="create">
<div  class="container" >
	<div class="form-box">
<table>
	<c:forEach var="cus" items="${cusDetails}">
	
	<c:set var="id" value="${cus.id}"/>
	<c:set var="name" value="${cus.name}"/>
	<c:set var="email" value="${cus.email}"/>
	<c:set var="phone" value="${cus.phone}"/>
	<c:set var="username" value="${cus.userName}"/>
	<c:set var="password" value="${cus.password}"/>
	
	<tr>
		<td>Customer ID</td>
		<td>${cus.id}</td>
		
	</tr>
	<tr>
		<td>Customer Name</td>
		<td>${cus.name}</td>
	</tr>
	<tr>
		<td>Customer Email</td>
		<td>${cus.email}</td>
	</tr>
	<tr>
		<td>Customer Phone</td>
		<td>${cus.phone}</td>
	</tr>
	<tr>
		<td>Customer User Name</td>
		<td>${cus.userName}</td>
	</tr>

	</c:forEach>
	</table>
	</div>
	</div>
	
	
	
	
	<c:url value="updatecustomer.jsp" var="cusupdate" >
	<c:param name="id" value="${id}"/>
	<c:param name="name" value="${name}"/>
	<c:param name="email" value="${email}"/>
	<c:param name="phone" value="${phone}"/>
	<c:param name="uname" value="${username}"/>
	<c:param name="pass" value="${password}"/>
	
	</c:url>
	<div class="button">
	<a href="${cusupdate}">
	<input type="submit" name="update" class="btn" value="Update My Data">
	</a>
	</div>
	
	<br>
	
	
	
	<c:url value="deletecustomer.jsp" var="cusdelete" >
	<c:param name="id" value="${id}"/>
	<c:param name="name" value="${name}"/>
	<c:param name="email" value="${email}"/>
	<c:param name="phone" value="${phone}"/>
	<c:param name="uname" value="${username}"/>
	<c:param name="pass" value="${password}"/>
	
	</c:url>
	<div class="button">
	<a href="${cusdelete}">
	<input type ="button "  name="delete" class="btn" value="Delete My Account">
	</a>
	</div>
	
	
	
	</div>

</body>
</html>