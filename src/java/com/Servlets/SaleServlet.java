/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import com.Classes.Cart;
import com.Classes.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		DBConnection conn = new DBConnection();
		Connection connection = conn.makeConnection();
		ResultSet result = null;
		int orderId = 0, orders;
                
                
                HttpSession session = request.getSession();
                String customerId = (String)session.getAttribute("customerId");
		
		try {
			Statement st = connection.createStatement();
			
			ArrayList<Cart> cart = (ArrayList<Cart>)session.getAttribute("cart");
			
//			Inserting order into orders table	
			String query1 = "insert into orders(customerId, orderDate) values("
			+customerId+", now())";
			
			st.executeUpdate(query1);
			
//			Getting number of orders
			result = st.executeQuery("select count(*) from orders");
			result.next();
			orders = result.getInt(1);
			
//			Getting last order
			result = st.executeQuery("select * from orders");
			
			if(orders > 0) {
                            while(result.next()) {
                                orderId = result.getInt("orderId");
                            }
			} else {
				orderId = 1;
			}
                        
			for(Cart c: cart) {
				String query = "insert into sale "
						+ "(productLineId, orderId, quantity) "
						+ " values("+c.getProductId()+", "+(orderId)+", "+c.getQuantity()+")";
				st.executeUpdate(query);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
                session.removeAttribute("cart");
		response.sendRedirect("CheckOut.jsp");
	}

}
