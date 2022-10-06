package com.example.finalproject.model.shipping.dto;

import java.util.Date;

public class ShippingDTO {
	private int order_id;
	private String userid;	
	private String name;	
	private int product_id;	
	private String product_name;	
	private int price;
	private int amount;
	private Date pay_date;	
	private String receiver;	
	private String address;	
	private String alert;	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAlert() {
		return alert;
	}
	public void setAlert(String alert) {
		this.alert = alert;
	}
	@Override
	public String toString() {
		return "ShippingDTO [order_id=" + order_id + ", userid=" + userid + ", name=" + name + ", product_id="
				+ product_id + ", product_name=" + product_name + ", price=" + price + ", amount=" + amount
				+ ", pay_date=" + pay_date + ", receiver=" + receiver + ", address=" + address + ", alert=" + alert
				+ "]";
	}
	
	

}
