<%-- 
    Document   : Register
    Created on : Jul 30, 2022, 12:41:59 PM
    Author     : MARVIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <h1>Register Here</h1>
        <form>
            <table>
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                        <input type="text" name="name"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Username:
                    </td>
                    <td>
                        <input type="text" name="username"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Gender:
                    </td>
                    <td>
                        <select>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Location:
                    </td>
                    <td>
                        <input type="text" name="location"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <input type="password" name="password"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Confirm Password:
                    </td>
                    <td>
                        <input type="password" name="cpassword"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="save" value="Register"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
