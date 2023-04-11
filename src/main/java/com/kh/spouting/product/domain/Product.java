package com.kh.spouting.product.domain;

public class Product {

	private int productNo;
	private int categoryNo;
	private String productName;
	private String productPrice;
	private String productDescription;
	private String productFilename;
	private String productFilerename;
	private String productFilepath;
	
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductFilename() {
		return productFilename;
	}
	public void setProductFilename(String productFilename) {
		this.productFilename = productFilename;
	}
	public String getProductFilerename() {
		return productFilerename;
	}
	public void setProductFilerename(String productFilerename) {
		this.productFilerename = productFilerename;
	}
	public String getProductFilepath() {
		return productFilepath;
	}
	public void setProductFilepath(String productFilepath) {
		this.productFilepath = productFilepath;
	}
	
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productDescription=" + productDescription + ", productFilename="
				+ productFilename + ", productFilerename=" + productFilerename + ", productFilepath=" + productFilepath
				+ "]";
	}
	
	
}
