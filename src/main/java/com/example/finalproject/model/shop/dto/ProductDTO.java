package com.example.finalproject.model.shop.dto;

public class ProductDTO {
	
	private int product_id;
	private String product_name;
	private int price;
	private String product_desc;
	private String product_kind;
	private String product_url;
	//getter,setter,toString()
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
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getProduct_kind() {
		return product_kind;
	}
	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price
				+ ", product_desc=" + product_desc + ", product_kind=" + product_kind + ", product_url=" + product_url
				+ "]";
	}

}
