package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Math;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.Classes.DBConnection;

public class Allocate extends HttpServlet {
//	Variables
	int numberOfEmployees = 0, employeeCounter = 1;
	double longTermEmployees = 0;
	double shortTermEmployees = 0;
	double midTermEmployees = 0;
	
//	Database connection variables
	DBConnection conn = null;
	Connection connection = null;
	Statement st = null;
	ResultSet result = null;
	String query = null, allocateQuery = null;
	
	private static final long serialVersionUID = 1L;
        @Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out = response.getWriter();
			numberOfEmployees = Integer.parseInt(request.getParameter("employees"));
								
			longTermEmployees = Math.round((4/7.0)*(numberOfEmployees));
			midTermEmployees = Math.round((2/7.0)*(numberOfEmployees));
			shortTermEmployees = Math.round((1/7.0)*(numberOfEmployees));
			
			try {
//				Database connection object
				conn = new DBConnection();
				connection = conn.makeConnection();
				st = connection.createStatement();
				
				query = "select * from productcategory";
				result = st.executeQuery(query);
				
				st.executeUpdate("update productcategory set employees ="+
				shortTermEmployees+"where categoryName = 'short-term'");
				
				st.executeUpdate("update productcategory set employees ="+
						midTermEmployees+"where categoryName = 'mid'");
				
				st.executeUpdate("update productcategory set employees ="+
						longTermEmployees+"where categoryName = 'long'");
				
			}catch(SQLException e) {
				out.println(e);
			}
                        response.sendRedirect("Allocated.jsp");
		}
}