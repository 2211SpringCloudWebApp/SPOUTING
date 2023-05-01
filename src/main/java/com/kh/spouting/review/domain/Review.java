package com.kh.spouting.review.domain;

import java.sql.Date;

public class Review {

	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private String reviewFilename;
	private String reviewFilepath;
	private int reviewGrade;
	private String userId;
	private int productNo;
	
	public Review() {}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewTitle() {
	    return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
	    this.reviewTitle = reviewTitle;
	}
	
	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewFilename() {
		return reviewFilename;
	}

	public void setReviewFilename(String reviewFilename) {
		this.reviewFilename = reviewFilename;
	}

	public String getReviewFilepath() {
		return reviewFilepath;
	}

	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", reviewFilename=" + reviewFilename + ", reviewFilepath="
				+ reviewFilepath + ", reviewGrade=" + reviewGrade + ", userId=" + userId + ", productNo=" + productNo
				+ "]";
	}


	

	
	

	
}
