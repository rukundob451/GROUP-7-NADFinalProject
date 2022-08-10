package com.Classes;

public class ProductCategory {
	private int categoryId;
	private String categoryName;
	private int dailyOutput;
	private int employees;
	
	public ProductCategory(int id, String name, int output, int employees) {
		this.categoryId = id;
		this.categoryName = name;
		this.dailyOutput = output;
		this.employees = employees;
	}
	
	public int getCategoryId() {
		return this.categoryId;
	}
	
	public void setCategoryId(int id) {
		this.categoryId = id;
	}
	
	public String getCategoryName() {
		return this.categoryName;
	}
	
	public void setCategoryName(int name) {
		this.categoryId = name;
	}
	
	public int getDailyOutput() {
		return this.dailyOutput;
	}
	
	public void setDailyOutput(int output) {
		this.dailyOutput = output;
	}
	
	public int getEmployees() {
		return this.employees;
	}
	
	public void setEmployees(int employees) {
		this.employees = employees;
	}

}