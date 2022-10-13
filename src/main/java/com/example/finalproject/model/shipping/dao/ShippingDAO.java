package com.example.finalproject.model.shipping.dao;

import java.util.List;

import com.example.finalproject.model.shipping.dto.Order_detailDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.model.shop.dto.CartDTO;

public interface ShippingDAO {
	public List<ShippingDTO> myShippingList(String userId);
	public List<CartDTO> listOrder(String userid);//주문 리스트
	public void insert(ShippingDTO dto); //주문
	public void orderInfo_Details(Order_detailDTO orderDetail);
}
