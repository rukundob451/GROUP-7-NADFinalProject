<%-- 
    Document   : Login
    Created on : Jul 30, 2022, 12:13:43 PM
    Author     : MARVIN
--%>

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
        <form action="" method="post">
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
                       <input type="submit" name="login" value="Login"/> 
                    </td>
                    <td>
                        <a href="/NADFinalProject/Register.jsp"><input type="button" value="Register"></a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
