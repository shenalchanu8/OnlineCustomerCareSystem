<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file = "adminNave.jsp" %>
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


</style>

<body>

<div class="center">
<h1>Admin Login</h1>
<form action ="adminloginServlet" method="post">
    
    <div class="text_field">
         <input type ="text" name="uid" required> 
         <span></span>
         <label>Admin Name</label>
          </div>
          
          <div class="text_field">
          <input type="password" name="pass" required>
           <span></span>
         <label>password</label>
          </div>
          
          <div class="pass"> Forget Password</div>
          
          <input type="submit" name="submit" value="login">
    
          <div class="sing_link">Not a Member?<a href="AdminRegister.jsp">Register</a>
          </div>
          
    </form>
</div>
</body>
</html>