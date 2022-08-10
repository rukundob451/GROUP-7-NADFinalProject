

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%@page import="java.sql.*"%>   
        <%@page import="com.Classes.DBConnection" %>
        <%
        String userName=request.getParameter("userName");
        String password =request.getParameter("password");
        String fname=request.getParameter("firstname");
        String lname=request.getParameter("lastname");
        String gender=get.Parameter("gender");
        String address =request.getParameter("adress");
        String email =request.getParameter("email");
         DBConnection conn = new DBConnection();
           
   try{
            Connection connection = conn.makeConnection();
            Statement st = connection.createStatement();
            ResultSet usercheck = null;
        %>
        
        
<%
        
        
        
        ResultSet usercheck = st.executeQuery("select * from customer where userName='"+userName+"'");
        if(usercheck.next()){
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert('sorry, this username is already taken');");
            out.println("location='index.jsp';");
            out.println("</script>");
            }
        
            else{
                     st.executeUpdate("insert into customer(userName, firstName, lastName, gender, Location,Status) values ('" + userName + "','" + fname + "','" + lname + "','" + gender + "','" + address + "','active')");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert('you have been registered successfully!');");
            out.println("location='login.jsp';");
            out.println("</script>");
            
            }
        
     
            } catch(SQLException e){
            
              out.println(e);
            }
 
        %>
        
