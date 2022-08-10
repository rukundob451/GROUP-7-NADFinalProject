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

public class QuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession sess = request.getSession();
		
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		out.println(action);
		out.println(id);
		
		ArrayList<Cart> cart = new ArrayList<Cart>();
		
		cart = (ArrayList<Cart>)sess.getAttribute("cart");
		
		if(action != null && id >= 1) {
			if(action.equals("dec")) {
				for(Cart c: cart) {
					if(Integer.parseInt(c.getProductId()) == id) {
						c.decreaseQuantity();
						response.sendRedirect("CheckOut.jsp");
					}
				}
			} else if(action.equals("inc")){
				for(Cart c: cart) {
					if(Integer.parseInt(c.getProductId()) == id) {
						c.increaseQuantity();
						response.sendRedirect("CheckOut.jsp");
					}
				}
			}
		}
	}

}