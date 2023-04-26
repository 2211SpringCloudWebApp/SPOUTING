package com.kh.spouting.product.domain;

public class Product {

	private int productNo;
	private int categoryNo;
	private String productName;
	private String productPrice;
	private String productDescription;
	private String productFilename1;
	private String productFilename2;
	private String productFilepath1;
	private String productFilepath2;
	
	public Product() {}
	   
   // productNo를 인자로 받는 생성자
   public Product(int productNo) {
      this.productNo = productNo;
   }

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
	public String getProductFilename1() {
		return productFilename1;
	}
	public void setProductFilename1(String productFilename1) {
		this.productFilename1 = productFilename1;
	}
	public String getProductFilename2() {
		return productFilename2;
	}
	public void setProductFilename2(String productFilename2) {
		this.productFilename2 = productFilename2;
	}
	public String getProductFilepath1() {
		return productFilepath1;
	}
	public void setProductFilepath1(String productFilepath1) {
		this.productFilepath1 = productFilepath1;
	}
	public String getProductFilepath2() {
		return productFilepath2;
	}
	public void setProductFilepath2(String productFilepath2) {
		this.productFilepath2 = productFilepath2;
	}
	
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productDescription=" + productDescription
				+ ", productFilename1=" + productFilename1 + ", productFilename2=" + productFilename2
				+ ", productFilepath1=" + productFilepath1 + ", productFilepath2=" + productFilepath2 + "]";
	}
	
	
	
}
