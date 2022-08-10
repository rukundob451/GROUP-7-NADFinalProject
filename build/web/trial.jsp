<%-- 
    Document   : trial
    Created on : Aug 10, 2022, 8:08:28 AM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Classes.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
            <div class="card-header my-3">All products</div>
            <div class="row">
                  <%
            int numberOfProducts = 0, productsCounter = 0;
	    String query = null, query1 = null;
	    ResultSet result = null;
	    Connection connection = null;
	    Statement st = null;
		
		DBConnection conn = new DBConnection();
            
            try {
                connection = conn.makeConnection();
                st = connection.createStatement();
                query = "select count(*) from productLine";
                query1 = "select * from productline";
                
                result = st.executeQuery(query);
                result.next();
                numberOfProducts = result.getInt(1);
                
                Product[] products = new Product[numberOfProducts];
                result = st.executeQuery(query1);
                
                while(result.next()) {
            	 products[productsCounter] = new Product(result.getString(1), result.getString(2), result.getInt(3), result.getString(5));
                          %>
                <div class="col-md-3 my-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img class="card-img-top" src="img/products/<%=result.getString("pImage")%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%=result.getString("productLineName")%></h5>
                            <img style="max-width: 45px" src="img/like.png" class="float-right" alt="user_icon">
                            <h6 class="price">Price: $<%=result.getString("price")%></h6>
                            <h6 class="category">Category: some category</h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="3" class="btn btn-dark">Add to cart</a>
                                <a href="3" class="btn btn-primary">Buy Now</a>
                            </div>
                        
                            
                        </div>
                            
                    </div>
                             <%
                             	productsCounter++;
                            }
                %>           
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
