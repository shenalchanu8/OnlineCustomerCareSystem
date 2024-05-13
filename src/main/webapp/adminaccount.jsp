<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file = "adminNave.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>




		body{
		background: lightblue;
	
			font-family: Hind SemiBold;
		}


	
		table, th, td {
  			border: 1px solid #fff;
		}

		

		
	</style>
<title>Insert title here</title>
</head>
<body>

<div  class="container" >
	<div class="form-box">
<table>
	<c:forEach var="cus" items="${adminDetails}">
	
	<c:set var="id" value="${cus.id}"/>
	<c:set var="name" value="${cus.name}"/>
	<c:set var="email" value="${cus.email}"/>
	<c:set var="phone" value="${cus.phone}"/>
	<c:set var="username" value="${cus.userName}"/>
	<c:set var="password" value="${cus.password}"/>
	
	<tr>
		<td>Admin ID</td>
		<td>${cus.id}</td>
	</tr>
	<tr>
		<td>Admin Name</td>
		<td>${cus.name}</td>
	</tr>
	<tr>
		<td>Admin Email</td>
		<td>${cus.email}</td>
	</tr>
	<tr>
		<td>Admin Phone</td>
		<td>${cus.phone}</td>
	</tr>
	<tr>
		<td> User Name</td>
		<td>${cus.userName}</td>
	</tr>

	</c:forEach>
	</table>
	</div>
	</div>
	
	
	
	
	<c:url value="updateadmin.jsp" var="cusupdate" >
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
	
	
	
	<c:url value="deleteadmin.jsp" var="cusdelete" >
	<c:param name="id" value="${id}"/>
	<c:param name="name" value="${name}"/>
	<c:param name="email" value="${email}"/>
	<c:param name="phone" value="${phone}"/>
	<c:param name="uname" value="${username}"/>
	<c:param name="pass" value="${password}"/>
	
	</c:url>
	<div class="button">
	<a href="${cusdelete}">
	<input type ="button" name="delete" class="btn" value="Delete My Account">
	</a>
	</div>
	
	
	

</body>
</html>