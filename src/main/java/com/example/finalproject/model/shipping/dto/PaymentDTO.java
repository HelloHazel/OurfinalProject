package com.example.finalproject.model.shipping.dto;

import java.util.Date;

public class PaymentDTO {
	private String pay_no;
	private Date pay_Date;
	private String pay_method;
	private String order_id;
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public Date getPay_Date() {
		return pay_Date;
	}
	public void setPay_Date(Date pay_Date) {
		this.pay_Date = pay_Date;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	@Override
	public String toString() {
		return "PaymentDTO [pay_no=" + pay_no + ", pay_Date=" + pay_Date + ", pay_method=" + pay_method + ", order_id="
				+ order_id + "]";
	}
	
	
}
