package com.example.finalproject.model.faq.dto;

public class FaqDTO {
	private int faq_no; 
	private String faq_title;
	private String faq_content;
	private String userid;
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "FaqDTO [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_content=" + faq_content + ", userid="
				+ userid + "]";
	}
	
	

}
