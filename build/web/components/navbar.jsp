<%-- 
    Document   : navbar
    Created on : Jul 31, 2022, 2:38:16 PM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   
        <nav class="navbar navbar-expand-lg navbar-dark custom-bg">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Terra</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Short-term</a>
          <a class="dropdown-item" href="#">Mid-term</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Long-term</a>
        </div>
      </li>
    
    </ul>
    
    <ul class="navbar-nav ml-auto">
       
      <li class="nav-item active">
          <a class="nav-link" href="CheckOut.jsp">Cart<span class="badge badge-danger">${ cart.size() }</span></a>
      </li>
     
        <li class="nav-item active">
        <a class="nav-link" href="Login.jsp"><%=session.getAttribute("userName")%></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="/NADFinalProject/Logout">Logout</a>
      </li>
      
    </ul>
  </div>
            </div>
</nav>
    </body>
</html>
