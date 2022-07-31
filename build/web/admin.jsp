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
        
    <include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <h1>This is the admin panel</h1>
        
        <!<!-- first row: first col -->
        <div class="col-md-6">
            
            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded">
                    </div>
                    
                    <p class="mt-2">456</p>
                    <h1 class="text-uppercase text-muted">USERS</h1>
                </div>
            </div>
        </div>
        
        
       <div class="col-md-6">
            
            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded">
                    </div>
                    
                    <p class="mt-2">3</p>
                    <h1 class="text-uppercase text-muted">Categories</h1>
                </div>
            </div>
        </div>
        
         <div class="col-md-6">
            
            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded">
                    </div>
                    
                    <p class="mt-2">4</p>
                    <h1 class="text-uppercase text-muted">Products</h1>
                </div>
            </div>
        </div>
        
        <!--second row: second col -->
        <div class="col-md-6">
            
            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded">
                    </div>
                    
                    <p class="mt-2">Click here to add new category</p>
                    <h1 class="text-uppercase text-muted">Add Category</h1>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            
            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded">
                    </div>
                    
                    <p class="mt-2">Click here to add new product</p>
                    <h1 class="text-uppercase text-muted">Add Product</h1>
                </div>
            </div>
        </div>
        
        <!--product modal -->

<!-- Modal -->
<div class="modal fade" id="add-product-mdal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        
        <!--end product modal -->
    </body>
</html>
