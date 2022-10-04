package com.example.finalproject.model.inquery.dto;

import java.util.Date;

public class InqueryDTO {
		private int no;
		private String title;
		private String content;
		private String userid;
		private String name;
		private Date writeDate;
		private int hit;
		private int refNo;
		private int ordNo;
		private int levNo;
		private int parentNo;
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
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
		public int getRefNo() {
			return refNo;
		}
		public void setRefNo(int refNo) {
			this.refNo = refNo;
		}
		public int getOrdNo() {
			return ordNo;
		}
		public void setOrdNo(int ordNo) {
			this.ordNo = ordNo;
		}
		public int getLevNo() {
			return levNo;
		}
		public void setLevNo(int levNo) {
			this.levNo = levNo;
		}
		public int getParentNo() {
			return parentNo;
		}
		public void setParentNo(int parentNo) {
			this.parentNo = parentNo;
		}
		@Override
		public String toString() {
			return "InqueryDTO [no=" + no + ", title=" + title + ", content=" + content + ", userid=" + userid
					+ ", name=" + name + ", writeDate=" + writeDate + ", hit=" + hit + ", refNo=" + refNo + ", ordNo="
					+ ordNo + ", levNo=" + levNo + ", parentNo=" + parentNo + "]";
		}
}
