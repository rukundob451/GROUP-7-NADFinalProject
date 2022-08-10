<%-- 
    Document   : CheckOut
    Created on : Aug 6, 2022, 6:14:21 PM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Classes.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>CheckOut Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <style type="text/css">
            .table tbody td {
                vertical-align: middle;
            }
            
            .btn-incre, .btn-decre {
                box-shadow: none;
                font-size: 25px;
            }
            
        </style>
	</head>
	<body>
            <%@include file="components/navbar.jsp" %>
               
	<% 
		int numberOfProducts = 0, quantity = 1;
		String id = null, name = null;
		double price = 0.0, total = 0.0;
 	%>		
	<div class="container my-3">
	<table class="table table-bordered" border="1">
		<thead>
		<tr>
			<th scope="col">Name</th>
			<th scope="col">Price</th>
			<th class="float-center" scope="col">Quantity</th>
			<th scope="col">Remove product</th>
		</tr>
		</thead>
		<tbody>
	<%
		HttpSession sess = request.getSession();
		ArrayList<Cart> cart = (ArrayList<Cart>)sess.getAttribute("cart");
		if(cart != null) {
			for(Cart c: cart){
				id = c.getProductId();
				name = c.getProductName();
				price = c.getPrice();
				quantity = c.getQuantity();
	%>
					<tr>
						<td><%=name%></td>
						<td><%=price%></td>
						<td>
							<form action="" method="post">
								<input type="hidden" name="pname" value="<% %>"/>
								<input type="hidden" name="price" value="<% %>"/>
								<a class="btn btn-sm btn-decre" href="QuantityServlet?action=dec&id=<%=id%>">&#45</a>
								<input type="text" name="qty" value="<%=quantity%>"/>
								<a class="btn btn-sm btn-incre" href="QuantityServlet?action=inc&id=<%=id%>">&#43</a>
							</form>
						</td>
						<td><a href=""><button class="btn btn-sm btn-danger">Remove</button></a></td>
					</tr>
	<%
			}
		}
	%>
				</tbody>
			</table>
                                
            <div class="container">
                
               
                   
		<h2 class="float-right"><a href="SaleServlet">Check out</a></h2>
	</div>
                </div>                     
	
		</div>
                                </div>
	</body>
</html>
