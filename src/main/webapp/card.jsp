<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    width:100%;
    height:100vh;
    display:flex;
    justify-content: center;
    align-items: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-color:lightblue;
}
.container{
    width:750px;
    height:500px;
    border:1px solid;
    display: flex;
    flex-direction: column;
    padding: 40px;
    justify-content: space-around;
    background-color: #fff; 
}
.container h1{
    text-align: center;
}
.container h3{
    color:rgb(12, 12, 12);
    size: 50px;
}
.first-row{
    display: flex;
}
.Holder{
    width: 100%;
    margin-right: 40px;
}
.input-field{
    border: 1px solid #999;
}
.input-field input{
    width: 100%;
    border: none;
    outline: none;
    padding: 10px;

}
.selection{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.selection select{
    padding: 10px 20px;
}
a{
    background-color: #000;
    color: #fff;
    text-align: center;
    text-transform: uppercase;
    text-decoration: double;
    padding: 10px;
    font-size: 18px;
    transition: 0.5s;
}
a:hover{
    background-color: dodgerblue;
}
.cards img{
    width: 100px;
    height: 60px;
}

button[type="submit"] {
  background-color: #000;
  color: #fff;
  padding: 10px;
    font-size: 18px;
}
button[type="submit"]:hover {
  background-color: dodgerblue;
  
}
</style>
</head>
<body>


<div class="container">
<form action="./paymentServlet" method="post">

            <h1>Confirm Your Payment</h1>
            <div class="first-row">
                <div class="Holder">
                    <h3>Holder</h3>
                    <div class="input-field">
                        <input type="text" placeholder="Full Name" name="holder_Name">
                    </div>
                </div>
                <div class="cvv">
                    <h3>CVV</h3>
                    <div class="input-field">
                        <input type="password" placeholder="3 Digit Number" name ="cvv">
                    </div>
                </div>
            </div>
            <div class="second-row">
                <div class="card-number">
                    <h3>Card Number</h3>
                    <div class="input-field">
                        <input type="text" placeholder="Enter Card Number" name="card_number">
                    </div>
                </div>
            </div>
            <div class="third-row">
                <div class="expire-date">
                    <h3>Expire Date</h3>
                    <div class="selection">
                        <div class="date">
                            <select name="exp_month" id="exp_month">
                                <option value="Jan">Jan</option>
                                <option value="Feb">Feb</option>
                                <option value="Mar">Mar</option>
                                <option value="Apr">Apr</option>
                                <option value="May">May</option>
                                <option value="Jun">Jun</option>
                                <option value="Jul">Jul</option>
                                <option value="Aug">Aug</option>
                                <option value="Sep">Sep</option>
                                <option value="Oct">Oct</option>
                                <option value="Nov">Nov</option>
                                <option value="Dec">Dec</option> 
                            </select>
                            <select name="exp_year" id="exp_year">
                                <option value="2030">2030</option>
                                <option value="2029">2029</option>
                                <option value="2028">2028</option>
                                <option value="2027">2027</option>
                                <option value="2026">2026</option>
                                <option value="2025">2025</option>
                            </select>
                        </div>
                        <div class="cards">
                            <img src="image/mst.jpeg" alt="">
                            <img src="image/vis.jpeg" alt="">
                            <img src="image/pp.jpeg" alt="">
                        </div>
                    </div>
                </div>
            </div>     
            <button type="submit">Confirm</button>   
        
        
         
<a href = "showdata">show User</a>
</form>
</div>

</body>
</html>