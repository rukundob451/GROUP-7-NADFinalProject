/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Servlets;

import com.Classes.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author BENJAMIN RUKUNDO
 */
public class LikeServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            DBConnection conn = new DBConnection();
            try {
                Connection connection = conn.makeConnection();
                Statement st = connection.createStatement();
                
               ResultSet result = st.executeQuery("select count(*) from liketable "
                       + "where customerId = "+request.getParameter("customerId")+
                       " and productLineId = " + request.getParameter("productLineId"));
               
               result.next();
               int likes = result.getInt(1);
               
               if(likes == 0) {
                    st.executeUpdate("insert into liketable (customerId, productLineId)"
                        + "values (" + request.getParameter("customerId") +", "+
                        request.getParameter("productLineId")+")");
               }
                response.sendRedirect("index.jsp");
            }catch (SQLException e) {
                out.println(e);
            }
           
        }
    }

}
