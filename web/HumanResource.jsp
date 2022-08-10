<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Classes.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HR Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        <h4 class="text-center">Human Resource.</h4>
        
        <%
            int numberOfEmployees = 0;
            String query = null, query1 = null;
            ResultSet result = null;
            Connection connection = null;
            Statement st = null;
            
            DBConnection conn = new DBConnection();
            
            try {
                connection = conn.makeConnection();
                st = connection.createStatement();
                query = "select count(*) from Worker";
                query1 = "select * from Worker";
                
                result = st.executeQuery(query);
                result.next();
                numberOfEmployees = result.getInt(1);
                
                result = st.executeQuery(query1);
         %>
         <table class="table table-striped" border="1" width="80%">
             <tr>
                 <th>EmployeeID</th>
                 <th>First Name</th>
                 <th>Last Name</th>
             </tr>
         <%
             while(result.next()) {
         %>
            <tr>
                 <th><%=result.getInt(1)%></th>
                 <th><%=result.getString(2)%></th>
                 <th><%=result.getString(3)%></th>
             </tr>
         <%
             }
            }catch(SQLException e) {
                out.println(e);
            }
         %>
         </table>
         <br>
         <div class="container text-center">
         <form action="Allocate" method="post">
             <input type="hidden" name="employees" value="<%=numberOfEmployees%>"/>
             <input type="submit" name="submit" value="Allocate Employees"/>
         </form>
             <br>
         <a class="btn btn-primary custom-bg border-0" href="Reallocate?employees=<%=numberOfEmployees%>">Reallocate</a>
    </div>
         </body>
</html>