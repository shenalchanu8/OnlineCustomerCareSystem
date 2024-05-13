<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style >

@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,600;0,800;1,800;1,900&display=swap');

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
	
	</ul>

</nav>


</body>
</html>