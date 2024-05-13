<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
    <%@ page import="com.customer.Customer" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback and Reviews</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">



</head>

<style>

body {
	background:url("image/back.jpg");
    margin: 0;
    padding: 0;
    height: 100vh; 
    display: flex;
    justify-content: center;
    align-items: center;
    background-size:cover;
}

.container {
    text-align: center;
}

form {
    
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    max-width: 400px; 
}



.center h1 {
	text-align: center;
	padding: 0 0 20px 0;
	border-bottom: 1px solid silver;
	
}

.center form {

	padding: 10px 40px;
	box-sizing:auto;
	background-color:mediumaquamarine;
	width:750px;
	height:700px;

}

form .text_field {
	position: content;
	border-bottom: 2px solid #adadad;
	margin: 30px 0;
	width:250px;
	
	

}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  float: right;
  font-family:sans-serif;
}

textarea {
  width: 400px;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
  font-family:sans-serif;
  margin: 30px 0;
}

input[type=text] {
  width:400px;
  padding: 12px 20px;
  margin: 2px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  
}

.rating-group {
    display: inline-flex;
  }
  
  .rating__icon {
    pointer-events: none;
  }
  
  .rating__input {
   position: absolute !important;
   left: -9999px !important;
  }

  .rating__label {
    cursor: pointer;
    padding: 0 0.1em;
    font-size: 3rem;
  }
  

  .rating__icon--star {
    color: orange;
  }
  
 

  
  .rating__input:checked ~ .rating__label .rating__icon--star {
    color: #ddd;
  }

  .rating-group:hover .rating__label .rating__icon--star {
    color: orange;
  }

  
  .rating__input:hover ~ .rating__label .rating__icon--star {
    color: #ddd;
  }
  
  

  
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

<body>



<div class="center">



<form action ="FeedbackInsertServlet" method="post">

<h2>Leave us your feedback</h2>
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


    
    <div class="text_field">
    <h3><label>User Name</label></h3>
         <input type ="text" name="name" placeholder="Your Name" required> 
         
          </div>
          
          <div class="text_field">
          <h3><label>Email</label></h3>
          <input type="text" name="email" placeholder="Enter your email" required>
         
          </div>
          
          <div class="text_field">
          <h3><label for="feedback">Enter your feedback</label></h3>
          
         <textarea id="feedback" name="feedback" rows="4" cols="50"></textarea>
         
         <h3><label>Rate us now!!!</label></h3>
         
         
  <div id="star rating">
    <div class="rating-group">
        
        
        <label aria-label="1 star" class="rating__label" for="rating-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating" id="rating-1" value="1" type="radio">
        <label aria-label="2 stars" class="rating__label" for="rating-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating" id="rating-2" value="2" type="radio">
        <label aria-label="3 stars" class="rating__label" for="rating-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating" id="rating-3" value="3" type="radio" checked>
        <label aria-label="4 stars" class="rating__label" for="rating-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating" id="rating-4" value="4" type="radio">
        <label aria-label="5 stars" class="rating__label" for="rating-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating" id="rating-5" value="5" type="radio">
    </div>
  
</div><br>

         <center>  <input type="submit" name="submit" value="submit" ></center>
         
         
          </div>
          
          
          
          

          
    </form>
</div>







</body>
</html>