package com.example.finalproject.model.notice.dto;

import java.util.Date;

public class NoticeDTO {

		private int no;
		private String title;
		private String content;
		private String userid;
		private Date writeDate;
		private int hit;
		private int pin;
		
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public Date getWriteDate() {
			return writeDate;
		}
		public void setWriteDate(Date writeDate) {
			this.writeDate = writeDate;
		}
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public int getPin() {
			return pin;
		}
		public void setPin(int pin) {
			this.pin = pin;
		}
		@Override
		public String toString() {
			return "NoticeDTO [no=" + no + ", title=" + title + ", content=" + content + ", userid=" + userid
					+ ", writeDate=" + writeDate + ", hit=" + hit + ", pin=" + pin + "]";
		}
}
