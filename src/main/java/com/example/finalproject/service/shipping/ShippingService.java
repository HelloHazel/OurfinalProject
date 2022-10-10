package com.example.finalproject.service.shipping;

import java.util.List;

import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.model.shop.dto.CartDTO;

public interface ShippingService {

	public List<ShippingDTO> myShippingList(String userId);
	public List<CartDTO> listOrder(String userid);//리스트
	public void insert(ShippingDTO dto); //주문 저장
}
