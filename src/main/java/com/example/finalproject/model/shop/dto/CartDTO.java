package com.example.finalproject.model.shop.dto;

public class CartDTO {
	private int cart_no;
	private String userid;
	private String name;
	private int product_id;
	private String product_name;
	private int price;
	private int money; //상품금액
	private int amount;
	//getter,setter,toString()
	
	public int getCart_no() {
		return cart_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
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
		return "CartDTO [cart_no=" + cart_no + ", userid=" + userid + ", name=" + name + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", price=" + price + ", money=" + money + ", amount=" + amount
				+ "]";
	}
}
