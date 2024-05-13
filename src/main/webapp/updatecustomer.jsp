<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "popins,san-serif";
}
body{
	background: url(image/cus.jpg);
	background-position: center;
	background-size: cover;
	min-height: 100vh;
	width: 100%;
}

.container{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}
.form-box{
	position: relative;
	width: 400px;
	height: 550px;
	border: 2px solid rgba(255,255,2550.5);
	border-radius: 20px;
	backdrop-filter: blur(15px);
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-box h2{
	color: #fff;
	text-align: center;
	font-size: 32px;
}
.form-box .input-box{
	position: relative;
	margin: 30px 0;
	width: 310px;
	border-bottom: 2px solid #fff;
}

.form-box .input-box input{
	width: 100%;
	height: 45px;
	background: transparent;
	border: none;
	outline: none;
	padding: 0 20px 0 5px;
	color: #fff;
	font-size: 16px;
}

input::placeholder{
	color: #fff;
}
.btn{
	color: #fff;
	background: blue;
	width: 100%;
	height: 50px;
	border-radius: 5px;
	outline: none;
	border: none;
	font-size: 17px;
	cursor: pointer;
	box-shadow: 3px 0 10px rgb(0,0,0,0.5);
}
.group{
	display: flex;
	justify-content: space-between;
}
.group span a{
	color: #fff;
	position: relative;
	top: 10px;
	text-decoration: none;
	font-weight: 500;
}
.group a:focus{
	text-decoration: underline;
	
}</style>
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
	
	%>
	
	<div  class="container" >
	<div class="form-box">

<form action="UpdateCustomerServlet" method ="post">
<h1>Customer Update Account</h1>
	<div class="input-box">
	Customer id<input type="text" placeholder="Customer ID"  name="cusid" value="<%= id%>" readonly><br>
	</div>
	<div class="input-box">
	Name<input type="text"  name="name" placeholder="Name" value="<%= name%>"><br>
	</div>
	<div class="input-box">
	Email<input type="text"  name="email" placeholder="Email" value="<%= email%>"><br>
	</div>
	<div class="input-box">
	Phone<input type="text"  name="phone" placeholder="Phone" value="<%= phone%>"><br>
	</div>
	<div class="input-box">
	UserName<input type="text"  name="uname" placeholder="Username" value="<%= username%>"><br>
	</div>
	<div class="input-box">
	Password<input type="password"  name="pass" placeholder="Password" value="<%= password%>"><br>
	</div>
	<div class="button">
	<input type="submit"  class="btn" name="pass" value="Update My Account"><br>
	</div>
	
	</form>
	</div>
	</div>

</body>
</html>