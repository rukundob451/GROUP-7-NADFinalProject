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

import com.Classes.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		double price = 0;
		String id, pName = null;
		
		PrintWriter out = response.getWriter();
		ArrayList<Cart> cartList = new ArrayList<>();
		
		id = request.getParameter("id");
		pName = request.getParameter("pname");
		price = Double.parseDouble(request.getParameter("price"));
		
		
		Cart item = new Cart(id, pName, price, 1);
		
		HttpSession session = request.getSession();
		ArrayList<Cart> cart = (ArrayList<Cart>)session.getAttribute("cart");
		
		if(cart == null) {
			cartList.add(item);
			session.setAttribute("cart", cartList);
			response.sendRedirect("index.jsp");
		} else {
			cartList = cart;
			boolean exist = false;
			
			for(Cart c: cart) {
				if(c.getProductId().equals(id)) {
					exist = true;
//                                        Add a popup for ERROR MESSAGE-item already in cart
					out.println("Items in cart: <a href='Cart.jsp'>Go to Cart</a>");
				}
			}
			if(!exist) {
				cartList.add(item);
				response.sendRedirect("index.jsp");
			}
		}
	}
}