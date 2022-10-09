package com.example.finalproject.model.shop.dto;

import java.util.Date;

public class ReviewDTO {
	   private int review_no; //댓글번호
	   private String review_content; //댓글내용
	   private Date review_date; //작성일자
	   private String userid; //아이디
	   private int product_id; //상품 번호
	   
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "ReviewDTO [review_no=" + review_no + ", review_content=" + review_content + ", review_date="
				+ review_date + ", userid=" + userid + ", product_id=" + product_id + "]";
	}
	   
}
