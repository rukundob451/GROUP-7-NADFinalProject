<%-- 
    Document   : Register
    Created on : Jul 30, 2022, 12:41:59 PM
    Author     : Rukundo Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <%
        
        %>
        <div class="container-fluid">
            <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                
                <div class="card">
                    <div class="card-body px-5">
                        <div class="container text-center">
                            <img src="img/add-friend.png" style="max-height: 100px" class="img-fluid" alt="user_icon">
                        </div>
                         <h3 class="text-center my-3">Sign up here!!</h3>

<form action="insert.jsp" method="">
  <div class="form-group">
    <label for="name">First Name</label>
    <input type="type" name="firstName" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter user name here">
    
  </div>
           
   <div class="form-group">
    <label for="name">Last Name</label>
    <input type="type" name="lastName" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter user name here">
    
  </div> 
           
        <div class="form-group">
    <label for="userName">User Name</label>
    <input type="type" name="userName" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter user name here">
    
  </div>    
   
  <div class="form-group">
    <label for="email">User Email</label>
    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email here">
  </div>
           
   <div class="form-group">
    <label for="password">User password</label>
    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password here">
  </div>
           
  
    <div class="form-group">
    <label for="user_address">User Address</label>
    <input name="address" class="form-control" placeholder="Enter your address">
  </div>
           
           <div class="form-group">
    <label for="password">Gender</label>
    <Br>
    <input type="radio" id="html" name="gender" value="male">
<label for="html">Male</label><br>
<input type="radio" id="css" name="gender" value="female">
<label for="css">Female</label><br>
      </div>
           

           
  <div class="container text-center">
  <button class="btn btn-outline-success">Register</button>
  <button class="btn btn-outline-warning">Reset</button>
  </div>
</form>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
