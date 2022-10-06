package com.example.finalproject.service.shipping;

import java.util.List;

import com.example.finalproject.model.shipping.dto.ShippingDTO;

public interface ShippingService {

	public List<ShippingDTO> myShippingList(String userId);

}
