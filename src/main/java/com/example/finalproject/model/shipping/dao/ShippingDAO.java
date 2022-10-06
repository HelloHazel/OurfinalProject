package com.example.finalproject.model.shipping.dao;

import java.util.List;

import com.example.finalproject.model.shipping.dto.ShippingDTO;



public interface ShippingDAO {
	public List<ShippingDTO> myShippingList(String userId);
}
