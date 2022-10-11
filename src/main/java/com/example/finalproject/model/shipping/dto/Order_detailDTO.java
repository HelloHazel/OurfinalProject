package com.example.finalproject.model.shipping.dto;

public class Order_detailDTO {
	private int OD_NO;
	private int ORDER_ID;
	private int PRODUCT_ID;
	private int OD_COUNT;
	private int OD_PRICE;
	public int getOD_NO() {
		return OD_NO;
	}
	public void setOD_NO(int oD_NO) {
		OD_NO = oD_NO;
	}
	public int getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_ID(int oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}
	public int getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public int getOD_COUNT() {
		return OD_COUNT;
	}
	public void setOD_COUNT(int oD_COUNT) {
		OD_COUNT = oD_COUNT;
	}
	public int getOD_PRICE() {
		return OD_PRICE;
	}
	public void setOD_PRICE(int oD_PRICE) {
		OD_PRICE = oD_PRICE;
	}
	@Override
	public String toString() {
		return "Order_detailDTO [OD_NO=" + OD_NO + ", ORDER_ID=" + ORDER_ID + ", PRODUCT_ID=" + PRODUCT_ID
				+ ", OD_COUNT=" + OD_COUNT + ", OD_PRICE=" + OD_PRICE + "]";
	}
	
	
}
