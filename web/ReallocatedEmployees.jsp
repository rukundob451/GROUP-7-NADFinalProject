<%-- 
    Document   : ReallocatedEmployees
    Created on : Aug 9, 2022, 8:31:10 PM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Classes.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reallocated Employees</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h4 class="text-center">Allocated Employees</h4>
        <table class="table table-bordered" border="1">
            <tr>
                <td>Name</td> 
                <td>Product Line</td>
            </tr>
            <%
              DBConnection  conn = new DBConnection();
              
        try {
              Connection connection = conn.makeConnection();
              Statement stm = connection.createStatement();
              
              String productLineName = null;
              ArrayList<Employee> employees = new ArrayList<Employee>();
              
              ResultSet result = stm.executeQuery("select * from worker");
              
              while(result.next()){
                    Employee employee = new Employee(result.getInt("empId"), result.getString("firstName")
                    +" "+result.getString("lastName"), result.getInt("productLineId"));
                    employees.add(employee);
                }
            int employeeCounter = 0;
            while(employeeCounter < employees.size()) {
                    result = stm.executeQuery("select * from "
                    + "productline where productLineId = "
                    + employees.get(employeeCounter).getProductLineId());
                    
                    result.next();
                    productLineName = result.getString(2);
                    %>
                 <tr>
                     
                     
                     <td><%=employees.get(employeeCounter).getName()%></td> 
                    <td><%=productLineName%></td>
                </tr>   
            <%
                employeeCounter++;
                }
            }catch(SQLException e) {
                out.println(e);
}
            %>
        </table>
    </body>
</html>
