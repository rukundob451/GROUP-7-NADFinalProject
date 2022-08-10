/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
Connection connection = null;
    
    public Connection makeConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
                try {
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "");
                } catch(SQLException e) {
                    System.out.println(e);
                }
        } catch(ClassNotFoundException e) {
            System.out.println(e);
        }
        return connection;
    }
}
