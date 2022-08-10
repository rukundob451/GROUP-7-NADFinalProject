
import com.mysql.cj.protocol.Resultset;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Classes.DBConnection;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // work on dopost method
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    
    //accept username and password from the login.jsp
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    
    DBConnection conn = new DBConnection();
    try {
        Connection connection = conn.makeConnection();
        Statement stm = connection.createStatement();
        
        String query = "select * from customer where userName ='"
                +userName+"' and password = '"+password+"'";
        
        ResultSet result = stm.executeQuery(query);
        
        if(result.next()){
            response.sendRedirect("index.jsp");
            
            HttpSession session = request.getSession();
            session.setAttribute("userName", userName);
            session.setAttribute("status", "customer");
            session.setAttribute("name", result.getString("firstName"));
            session.setAttribute("customerId", result.getString("customerId"));
        } else {
            response.sendRedirect("Login.jsp");
        }
        
    } catch(SQLException e) {
    System.out.println(e.getMessage());
    }
    }
}
