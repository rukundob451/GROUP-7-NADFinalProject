<%-- 
    Document   : Allocated
    Created on : Aug 9, 2022, 7:56:37 PM
    Author     : BENJAMIN RUKUNDO
--%>
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
        <title>Allocated Employees</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h4 class="text-center">Employee Distribution</h1>
        <table class="table table-bordered">
            <tr>
                <td>Category Name</td> 
                <td>Number of Employees</td>
            </tr>
            <%
              DBConnection  conn = new DBConnection();
              Connection connection = conn.makeConnection();
              Statement stm = connection.createStatement();
              
              ResultSet result = stm.executeQuery("select categoryName, employees from productCategory");
              
              while(result.next()){
                    %>
                 <tr>
                     <td><%=result.getString("categoryName")%></td> 
                <td><%=result.getInt("employees")%></td>
            </tr>   
            <%
                }
            %>
        </table>
    </body>
</html>
