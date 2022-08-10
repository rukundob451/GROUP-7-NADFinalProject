/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Classes;

/**
 *
 * @author BENJAMIN RUKUNDO
 */
public class Employee {
    private int employeeId;
    private String name;
    private int productLineId;

    public int getEmployeeId() {
        return employeeId;
    }

    public Employee(int employeeId, String name, int productLineId) {
        this.employeeId = employeeId;
        this.name = name;
        this.productLineId = productLineId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getProductLineId() {
        return productLineId;
    }

    public void setProductLineId(int productLineId) {
        this.productLineId = productLineId;
    }
}
