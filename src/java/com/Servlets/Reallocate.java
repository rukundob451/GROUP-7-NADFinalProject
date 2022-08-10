package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.Classes.DBConnection;
import com.Classes.*;

public class Reallocate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		DBConnection conn = new DBConnection();
		Connection connection = null;
		Statement st = null;
		ResultSet outerResult = null, result;
		
		int start = 0, end = 0, products, employees;
		String query = null;
		
		ArrayList<ProductCategory> categories = new ArrayList<ProductCategory>();
		ArrayList<Product> productsList = new ArrayList<Product>();
		
		ProductCategory category = null;
		Product product = null;
		int showerGelSales, lotionSales;
		
		try {
			connection = conn.makeConnection();
			st = connection.createStatement();
			outerResult = st.executeQuery("select * from productcategory");
			
			while(outerResult.next()) {
				category = new ProductCategory(outerResult.getInt(1), outerResult.getString(2),
						outerResult.getInt(3), outerResult.getInt(4));
				categories.add(category);
			}
			
			int ctr = 0;
			while(ctr < categories.size()) {
				query = "select count(*) from productLine where categoryId = "
						+categories.get(ctr).getCategoryId();
				result = st.executeQuery(query);
				result.next();
				products = result.getInt(1);
				employees = categories.get(ctr).getEmployees();
				
				if(products == 1) {	out.println(query);	
					start = end;
					end = start + employees;
					query = "update worker set productLineId = " +
							 "(select productLineId from productLine where categoryId = "+
							 		categories.get(ctr).getCategoryId()+ " limit 1) where empId > "+start+
							 		" and empId <= "+end;
					st.executeUpdate(query);
					out.println(query);
				} else if(products > 1) {
					result = st.executeQuery("select * from productline where categoryId = "
							+categories.get(ctr).getCategoryId());	
					
					while(result.next()) {
						product = new Product(result.getString(1), result.getString(2),
								result.getInt(3), result.getString(5));
						productsList.add(product);
					}
					
					int innerCounter = 0;
					while(innerCounter < productsList.size()) {
						result = st.executeQuery("SELECT SUM(quantity) from sale WHERE productLineId = (SELECT productLineId from productline WHERE productLineName = '"
								+productsList.get(innerCounter).getProductName()+"')");
						result.next();
						productsList.get(innerCounter).setQuantity(result.getInt(1));
						out.println(result.getInt(1));
						innerCounter++;
					}
					
					showerGelSales = productsList.get(0).getQuantity();
					lotionSales = productsList.get(1).getQuantity();
					out.println(showerGelSales);out.println(lotionSales);
					int totalSales = showerGelSales + lotionSales;
					
					double showerGelEmployees = Math.round((double)showerGelSales/(double)totalSales*employees);
					double lotionEmployees = Math.round((double)lotionSales/(double)totalSales*employees);
					out.println((double)showerGelSales/(double)totalSales*employees);
					out.println((double)lotionSales/(double)totalSales*employees);
					
					
					if(showerGelEmployees < 1) {
						showerGelEmployees++;
						lotionEmployees--;
					} else if(lotionEmployees < 1) {
						lotionEmployees++;
						showerGelEmployees--;
					}
					
					start = end;
					end = start + (int)(showerGelEmployees);
					query = "update worker set productLineId = " +
							 "(select productLineId from productLine where categoryId = "+
							 		categories.get(ctr).getCategoryId()+ " limit 1) where empId > "+start+
							 		" and empId <= "+end;
					st.executeUpdate(query);
					out.println(query);
					
					start = end;
					end = start + (int)lotionEmployees;
					query = "update worker set productLineId = " +
							 "(select productLineId from productLine where categoryId = "+
							 		categories.get(ctr).getCategoryId()+ " limit 1 offset 1) where empId > "+start+
							 		" and empId <= "+end;
					st.executeUpdate(query);
					out.println(query);
				}
				ctr++;
			}
			
			
		}catch (SQLException e) {
			out.println(e);
		}
                response.sendRedirect("ReallocatedEmployees.jsp");
	}

}