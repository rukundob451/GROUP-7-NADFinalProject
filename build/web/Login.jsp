<%-- 
    Document   : Login
    Created on : Jul 30, 2022, 12:13:43 PM
    Author     : MARVIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="com.Classes.DBConnection" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card mt-3">
                        
                        <div class="card-header custom-bg text-white">
                            <h3>Login here</h3>
                        </div>
                        <div class="card-body">
                            
<form action="/NADFinalProject/Authentication.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputUserName">User Name</label>
    <input name="userName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="userHelp" placeholder="Enter username">
    <small id="userName" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <a href="Register.jsp" class="text-center d-block mb-2">If not registered click here </a>
  <div class="container text-center"> 
      <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
      <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
  </div>
  <a href="AdminLogin.jsp" class="text-center d-block mb-2">Login as admin</a>
  
</form>
        
                            
                        </div>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>

