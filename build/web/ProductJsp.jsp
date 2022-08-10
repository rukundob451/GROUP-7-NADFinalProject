<%-- 
    Document   : ProductJsp
    Created on : Aug 10, 2022, 3:21:57 PM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <%@include file="AdminNav/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="AdminNav/AdminNavbar.jsp" %>
        <h4 class="text-center">Enter the long term products!!</h4>
        
        <form action ="/NADFinalProject/CalculateProducts" class="text-center" method="post">
            <input type="text" name="products" placeholder="Number of long term products"/>
            <input type="submit" name="btn btn-primary custom-bg border-1" value="Go"/>
        </form>
    </body>
</html>
