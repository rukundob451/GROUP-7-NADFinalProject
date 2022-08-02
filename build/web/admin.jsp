<%-- 
    Document   : admin
    Created on : Jul 31, 2022, 9:12:35 AM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        
    <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>       
        <%@include file="components/navbar.jsp" %>
      
        
        <div class="container">
            
            <div class="row">
                <!--first col-->
                <div class="col-md-4">
                    
                    <!--first box-->
                    <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                        </div>
                        
                        <h1>356</h1>
                        <h1 class="text-uppercase">Users</h1>
                    </div>
                    </div>
                </div>
                
                <!--second col-->
                <div class="col-md-4">
                    
                    <div class="card">
                   <div class="card-body text-center">
                       <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                        </div>
                       <h1>3</h1>
                        <h1 class="text-uppercase">Categories</h1>
                    </div> 
                    </div>
                </div>

                <!--third col-->
                <div class="col-md-4">
                    
                    <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon">
                        </div>
                        <h1>4</h1>
                        <h1 class="text-uppercase">Products</h1>
                    </div>
                    </div>
                    
                </div>

            </div>
            
            <!--second row -->
            <div class="row mt-3">
                
                <!--second :row first col-->
                <div class="col-md-6">
                    
                    
                    <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/categories (1).png" alt="user_icon">
                        </div>
                        <p>Click here to add new category</p>
                        <h1 class="text-uppercase">Add Category</h1>
                    </div>
                    </div>
                    
                </div>
                
                 <!--second :row second col-->
                <div class="col-md-6">
                    
                    <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                        </div>
                        <p>Click here to add new product</p>
                        <h1 class="text-uppercase">Add Products</h1>
                    </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>
