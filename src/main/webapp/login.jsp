<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
</head>

<style>
body{
	background: url(image/cus.jpg);
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
.center h1{
	text-align: center;
	padding: 0 0 20px 0;
	border-bottom: 1px solid silver;
}

.center form{
	
	padding: 0 40px;
	box-sizing: border-box;
	
	}
	
form .text_field{
	position: relative;
	border-bottom: 2px solid #adadad;
	margin: 30px 0;

}

.text_field input{
	width: 100%;
	padding: 0 5px;
	height: 40px;
	font-size: 16px;
	border:none;
	background: none;
	outline: none;
}
.text_field label{
	
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	font-size: 16px;
	pointer-events: none;
	transition: .5s;
	
}
.text_field span::before{
	
	content: '';
	position: absolute;
	top: 40px;
	left: 0;
	width: 0%;
	height: 2px;
	transition: .5s;
	
}

.text_field input:focus ~ label,
.text_field input:valid ~ label{
	top: -5px;
	color: #2691d9;
}
.text_field input:focus~samp::before,
.text_field input:focus~samp::before{
	width: 100%;
}
.pass{
	margin: -5px 0 20px 5px;
	color: #a6a6a6;
	cursor: pointer;
	
}
.pass:hover{
	text-decoration: underline;
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
.signup_link{
	margin: 30px 0;
	text-align: center;
	font-size: 16px;
	color: #666666;
}

.signup_link a{
	color: #2691d9;
	text-decoration: none;
}
.signup_link a:hover{
	text-decoration: underline;
}


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



<div class="center">
<h1>User Login</h1>
<form action ="loginServlet" method="post">
    
    <div class="text_field">
         <input type ="text" name="uid" required> 
         <span></span>
         <label>User Name</label>
          </div>
          
          <div class="text_field">
          <input type="password" name="pass" required>
           <span></span>
         <label>password</label>
          </div>
          
          <div class="pass"> Forget Password</div>
          
          <input type="submit" name="submit" value="login">
    
          <div class="sing_link">Not a Member?<a href="Registerinterface.jsp">Register</a>
          </div>
          
    </form>
</div>
</body>
</html>