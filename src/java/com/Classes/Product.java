/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Classes;

public class Product {
	private String productId;
	private String productName;
	private double price;
        private int quantity;
        private String productImage;

    public Product(String productId, String productName, double price, String productImage) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.productImage = productImage;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
	
	public String getProductId() {
		return productId;
	}
	
	public void setProductId(String id) {
		this.productId = id;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String name) {
		this.productName = name;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
        
        public int getQuantity() {
            return this.quantity;
        }
        
        public void setQuantity(int qty) {
            this.quantity = qty;
        }
}