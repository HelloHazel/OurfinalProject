package com.example.finalproject.model.community.dto;

import java.util.Date;

public class CommCmtDTO {
	
	private int cmt_no; //댓글번호
	private String name;
	private String cmt_content;
	private Date cmt_regdate; 
	private int comm_no; //게시물번호
	//getter, setter, toString()
	public int getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Date getCmt_regdate() {
		return cmt_regdate;
	}
	public void setCmt_regdate(Date cmt_regdate) {
		this.cmt_regdate = cmt_regdate;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	@Override
	public String toString() {
		return "CommCmtDTO [cmt_no=" + cmt_no + ", name=" + name + ", cmt_content=" + cmt_content + ", cmt_regdate="
				+ cmt_regdate + ", comm_no=" + comm_no + "]";
	}
	
	

}
