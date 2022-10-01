package com.example.finalproject.model.community.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CommunityDTO {
	
	private int comm_no;
	private String comm_title;
	private String comm_content;
	private String userid; //작성자 id
	private Date comm_regdate;
	private String comm_url;
	private int comm_viewcnt;
	private String name; //작성자 이름
	private int cnt; //댓글 갯수
	private MultipartFile file1; //첨부파일(db에는 없다)
	//getter, setter, toString()
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getComm_title() {
		return comm_title;
	}
	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getComm_regdate() {
		return comm_regdate;
	}
	public void setComm_regdate(Date comm_regdate) {
		this.comm_regdate = comm_regdate;
	}
	public String getComm_url() {
		return comm_url;
	}
	public void setComm_url(String comm_url) {
		this.comm_url = comm_url;
	}
	public int getComm_viewcnt() {
		return comm_viewcnt;
	}
	public void setComm_viewcnt(int comm_viewcnt) {
		this.comm_viewcnt = comm_viewcnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "CommunityDTO [comm_no=" + comm_no + ", comm_title=" + comm_title + ", comm_content=" + comm_content
				+ ", userid=" + userid + ", comm_regdate=" + comm_regdate + ", comm_url=" + comm_url + ", comm_viewcnt="
				+ comm_viewcnt + ", name=" + name + ", cnt=" + cnt + ", file1=" + file1 + "]";
	}
	
	
}
