<%-- 
    Document   : AdminLogin
    Created on : Aug 6, 2022, 4:29:11 PM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
       <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card mt-3">
                        
                        <div class="card-header custom-bg text-white">
                            <h3>Admin Login</h3>
                        </div>
                        <div class="card-body">
                            
                            <form action="/NADFinalProject/AdminServlet" method="post">
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
  
</form>
                            
                        </div>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>
