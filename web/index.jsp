 <%-- 
    Document   : index
    Created on : Jul 30, 2022, 11:45:39 AM
    Author     : Rukundo Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Classes.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Business</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row">
            <!--show categories-->
            <div class="col-md-2 my-3">
                
                <div class="list-group mt-4">
  <a href="#" class="list-group-item list-group-item-action active">
    All products
  </a>
                    <a href="#" class="list-group-item list-group-item-action">Bread</a>
                    <a href="#" class="list-group-item list-group-item-action">Doughnuts</a>
                    <a href="#" class="list-group-item list-group-item-action">Cakes</a>
                </div>
                
                
            </div>
            
            <!--show products-->
            <div class="col md-8">
                
                <!--row-->
                <div class="row mt-4">
                    
                    <!--col:12-->
                   <div class="col-md-11">
                        
                     <div class="card-columns">
                           
                           <%--traversing products--%>
                           
                           
                          <%
            int numberOfProducts = 0, productsCounter = 0, likes = 0;
	    String query = null, query1 = null;
	    ResultSet result = null;
	    Connection connection = null;
	    Statement st = null;
		
            DBConnection conn = new DBConnection();
            
            String customerId = (String)session.getAttribute("customerId");
            
            try {
                connection = conn.makeConnection();
                st = connection.createStatement();
                query = "select count(*) from productLine";
                query1 = "select * from productline";
                
                result = st.executeQuery(query);
                result.next();
                numberOfProducts = result.getInt(1);
                
                Product product = null;
                ArrayList<Product> products = new ArrayList<Product>();
                
                result = st.executeQuery(query1);
                
                while(result.next()) {
                    product = new Product(result.getString(1), result.getString(2), result.getInt(3), result.getString(5));
                    products.add(product);
                }
                
                productsCounter = 0;
                while(productsCounter < products.size()) {
                          %>
                          <div class="card w-100" style="width: 18rem;">
                              <img src="img/products/<%=products.get(productsCounter).getProductImage()%>" class="card-img-top" style="max-height: 270px; max-width: 100%; width: auto;" alt="...">
                              <div class="card-body">
                                  
                                  <h5 class="card-title"><%=products.get(productsCounter).getProductName()%></h5>
                                  <p class="card-text">
                                      
                                  </p>
                                  
                              </div>
                              <div class="card-footer">
                               <form action="/NADFinalProject/AddToCart" method="post">
                 		<input type="hidden" name="id" value="<%=products.get(productsCounter).getProductId()%>"/>
                 		<input type="hidden" name="pname" value="<%=products.get(productsCounter).getProductName()%>"/>
                 		<input type="hidden" name="price" value="<%=products.get(productsCounter).getPrice()%>"/>
                                
                                <div class="container text-evenly"> 
                 		<input type="submit" name="btn" value="Add To Cart"/>
                                
                                <button class="btn btn-primary">&#36 <%=products.get(productsCounter).getPrice()%></button>
                                
                                 <div class="container">
                                     <a href="LikeServlet?customerId=<%=customerId%>&productLineId=<%=products.get(productsCounter).getProductId()%>">
                                         <img style="max-width: 45px" src="img/like.png" class="float-right" alt="user_icon"></a>
                            <%
                                result = st.executeQuery("select count(*) from liketable where "
                                        + "productLineId = " +products.get(productsCounter).getProductId());
                                
                                if(result.next()){
                                    likes = result.getInt(1);
                                }
                            %>
                            <%=likes%>
                        </div>
                                </div>
                 	</form>
                                  </div>
                           
                      </div>
                         <%
                             productsCounter++;
                            }
                %>                 
                   </div> 
                     
                  </div>   
                   
                </div>
                
            </div>
        </div>
    </body>
    <%
            }catch(SQLException e) {
                out.println(e);
            }
         %>
</html>
