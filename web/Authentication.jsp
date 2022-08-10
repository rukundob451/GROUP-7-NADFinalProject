<%@page import="java.sql.*" %>
<%@page import="com.Classes.DBConnection" %>
        
        <%
            
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            
            DBConnection conn = new DBConnection();
            Connection connection = conn.makeConnection();
            Statement st = connection.createStatement();
            ResultSet result = null;
            
            result = st.executeQuery("SELECT password FROM customer WHERE userName = '"+userName+"'");
        
            if(result.next()){
                String storedPassword = result.getString("Password");
                session.setAttribute("userName",userName);
                     session.setAttribute("password",password);
                      response.sendRedirect("index.jsp");
            }else{
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert('Check your password/username and try again!');");
            out.println("location='Login.jsp';");
            out.println("</script>");
            %>
        
            <%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Welcome</h1>
        <form action="authentication.jsp" method="post">
            <table>
                <tr>
                    <td>
                        username:
                    </td>
                    <td>
                        <input type="text" name="username"/>
                    </td>
                </tr>
                <tr>
                     <td>
                        Password:
                    </td>
                    <td>
                        <input type="password" name="Password"/>
                    </td>
                </tr>
                <tr>
                    <td>
                       <a href="/NADFinalProject/Product.jsp"><input type="submit" name="login" value="Login"/> </a>
                    </td>
                    <td>
                        <a href="/NADFinalProject/Register.jsp"><input type="button" value="Register"></a>
                    </td>
                </tr>
            </table>
            
    </body>
        </form>
        
       
        
</html>

<%
        
            }
                     
        %>