package com.example.finalproject.model.shipping.dto;

import java.util.Date;

public class OrderListDTO {
	String order_id;
	String userid;
	int price;	
	int amount;
	
	Date pay_date;	
	String receiver;	
	String address1;
	String address2;
	String phone;	
	String alert;
	String order_status;
	
	int od_no;
	int product_id;
	int od_count;
	
	String product_name;
	String product_url;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAlert() {
		return alert;
	}
	public void setAlert(String alert) {
		this.alert = alert;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getOd_no() {
		return od_no;
	}
	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getOd_count() {
		return od_count;
	}
	public void setOd_count(int od_count) {
		this.od_count = od_count;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	@Override
	public String toString() {
		return "OrderListDTO [order_id=" + order_id + ", userid=" + userid + ", price=" + price + ", amount=" + amount
				+ ", pay_date=" + pay_date + ", receiver=" + receiver + ", address1=" + address1 + ", address2="
				+ address2 + ", phone=" + phone + ", alert=" + alert + ", order_status=" + order_status + ", od_no="
				+ od_no + ", product_id=" + product_id + ", od_count=" + od_count + ", product_name=" + product_name
				+ ", product_url=" + product_url + ", getOrder_id()=" + getOrder_id() + ", getUserid()=" + getUserid()
				+ ", getPrice()=" + getPrice() + ", getAmount()=" + getAmount() + ", getPay_date()=" + getPay_date()
				+ ", getReceiver()=" + getReceiver() + ", getAddress1()=" + getAddress1() + ", getAddress2()="
				+ getAddress2() + ", getPhone()=" + getPhone() + ", getAlert()=" + getAlert() + ", getOrder_status()="
				+ getOrder_status() + ", getOd_no()=" + getOd_no() + ", getProduct_id()=" + getProduct_id()
				+ ", getOd_count()=" + getOd_count() + ", getProduct_name()=" + getProduct_name()
				+ ", getProduct_url()=" + getProduct_url() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
