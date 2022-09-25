package com.example.finalproject.model.shop.dto;

public class CartDTO {
	private int cart_no;
	private String userid;
	private int product_id;
	private int amount;
	//getter,setter,toString()
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", userid=" + userid + ", product_id=" + product_id + ", amount="
				+ amount + "]";
	}
}
