package com.example.finalproject.service.shipping;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.shipping.dao.ShippingDAO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;

@Service
public class ShippingServiceImpl implements ShippingService {
	@Inject
	ShippingDAO shippingDao;
	
	@Override
	public List<ShippingDTO> myShippingList(String userId){
		return shippingDao.myShippingList(userId);
	}

}
