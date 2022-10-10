package com.example.finalproject.model.shipping.dto;

import java.util.Date;

public class ShippingDTO {
	private int order_id;
	private String userid;
	private int price;
	private int amount;
	private Date pay_date;
	private String receiver;
	private String address1;
	private String address2;
	private String phone;
	private String alert;
	private String order_status;

	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "ShippingDTO [order_id=" + order_id + ", userid=" + userid + ", price=" + price + ", amount=" + amount
				+ ", pay_date=" + pay_date + ", receiver=" + receiver + ", address1=" + address1 + ", address2="
				+ address2 + ", phone=" + phone + ", alert=" + alert + ", order_status=" + order_status + "]";
	}


}
