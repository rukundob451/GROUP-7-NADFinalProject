<%-- 
    Document   : admin
    Created on : Jul 31, 2022, 9:12:35 AM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.Classes.DBConnection" %>

<%
    DBConnection conn = new DBConnection();
    try {
        Connection connection = conn.makeConnection();
        Statement st = connection.createStatement();
        ResultSet result = null;
        
        int products = 0, employees = 0, customers = 0;
        %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        
    <%@include file="AdminNav/common_css_js.jsp" %>
        
    </head>
    <body>       
        <%@include file="AdminNav/AdminNavbar.jsp" %>
      
        
        <div class="container admin">
            
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">
                    
                    <%
                        result = st.executeQuery("select count(*) from worker");
                        result.next();
                        
                        employees = result.getInt(1);  
                    %>
                    
                    <!--first box-->
                    <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                        </div>
                        
                        <h1><%=employees%></h1>
                        <h1 class="text-uppercase"><a href="HumanResource.jsp">Employees</a></h1>
                    </div>
                    </div>
                </div>
                
                <!--second col-->
                <div class="col-md-4">
                    
                    <%
                        result = st.executeQuery("select count(*) from customer");
                        result.next();
                        
                        customers = result.getInt(1);  
                    %>
                    
                    <div class="card">
                   <div class="card-body text-center">
                       <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                        </div>
                       <h1><%=customers%></h1>
                        <h1 class="text-uppercase">Customers</h1>
                    </div> 
                    </div>
                </div>

                <!--third col-->
                <div class="col-md-4">
                    
                    <%
                        result = st.executeQuery("select count(*) from productline");
                        result.next();
                        
                        products = result.getInt(1);
                    %>
                    
                    <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon">
                        </div>
                        <h1><%=products%></h1>
                        <h1 class="text-uppercase"><a href="/NADFinalProject/ProductJsp.jsp">Products</a></h1>
                    </div>
                    </div>
                    
                </div>

            </div>
            
            <!--second row -->
            <div class="row mt-3">
                
                <!--second :row first col-->
                <div class="col-md-6">
                    
                    
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/categories (1).png" alt="user_icon">
                        </div>
                     
                        <h1 class="text-uppercase"><a href="CustomerBase.jsp">Customer Base</a></h1>
                    </div>
                    </div>
                    
                </div>
                
                 <!--second :row second col-->
                <div class="col-md-6">
                    
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
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
        
        
        
        <!--add employee modal -->
        
        
        <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
          
          <form>
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height: 180px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
              </div>
              
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
              
          </form>
          
          
      </div>
    </div>
  </div>
</div>
        
        
        <!-- End add category modal -->
        
        
        
        <!--product modal -->
        
        
<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!--form-->
          <form action="/NADFinalProject/AddProducts" method="post">
              
              <!--product title -->
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/>
              </div>
                  
              <!--product price -->
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
              </div>
           
              
              <!--product quantity -->
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product Quantity" name="productQuantity" required/>
              </div>
              
              <!--product category -->
              <div class="form-group">
                  <select name="category_id" class="form-group" id="">
                      <option value="4">Short term</option>
                      <option value="2">Mid term</option>
                      <option value="1">Long term</option>
                  </select>
              </div>
              
              <!--product file -->
              <div class="form-group">
                  <label for="productPicture">Select Picture of the product</label>
                  <br/>
                  <input type="file" name="productPicture" required />
                  
              </div>
             
              <!--submit button-->
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add Product</button>
                  
              </div>
              
          </form>
          
          <!--end form-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        
        
        <!--End add product modal -->
        
    </body>
</html>

<%
    }catch(SQLException e) {
        out.println(e);
    }
%>