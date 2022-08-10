
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="com.Classes.*" %>
 <%@page import="java.util.ArrayList"%>
 
       
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Base Page</title>
        <%@include file="AdminNav/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="AdminNav/AdminNavbar.jsp" %>
      
       <div class="container">
     <div class="card-header my-3">All Customers</div> 
     
    <%   
    
      try{
          DBConnection conn = new DBConnection();
            Connection connection = conn.makeConnection();
            Statement st = connection.createStatement();
            ResultSet result = null;
            Customer customer = null;
            
            ArrayList<Customer> customers = new ArrayList<Customer>();
              // myresult    = st.executeQuery("select * from products");
              out.println("Number of customers:");
              
              result =  st.executeQuery("select COUNT(*) from customer");
              
              result.next();
              out.println(result.getInt(1));
             
              result  = st.executeQuery("select * from customer");
            while (result.next()) {
                customer = new Customer(result.getString(3)+" "+result.getString(4), result.getString(5),
                result.getString(6));
                
                customers.add(customer);
        }
     int customerCounter = 0;   
while(customerCounter < customers.size()) {
                %>
             
                
                   <div class="container">
		<div class="row">
			
                           <div class="col-md-3 my-3">
				<div class="card w-100">
				
					<div class="card-body">
						<h5 class="card-title">Customer_Name: <%=customers.get(customerCounter).getName()%></h5>
                                                <h5 class="card-title">Gender: <%=customers.get(customerCounter).getGender()%></h5>
						<h6 class="price">Location: <%=customers.get(customerCounter).getLocation()%></h6>
						<h6 class="ProductLine">Products_Liked:</h6>
                                                <h6 class="ProductBought">Products_Bought:</h6>
						<div class="mt-3 d-flex justify-content-between">
                                                    
                                                    
						</div>
					</div>
				</div>
                           </div>      
		</div>
 </body>
 <br><br><br>
</html>
             
           <%   
               customerCounter++;
               }
            }
           catch(Exception e){
            out.print(e);
            }
        %>
             <a	href="admin.jsp" ></a>
   </div>