package com.example.finalproject.service.shipping;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.shipping.dao.ShippingDAO;
import com.example.finalproject.model.shipping.dto.OrderListDTO;
import com.example.finalproject.model.shipping.dto.Order_detailDTO;
import com.example.finalproject.model.shipping.dto.PaymentDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.model.shop.dto.CartDTO;

@Service
public class ShippingServiceImpl implements ShippingService {
	@Inject
	ShippingDAO shippingDao;
	
	@Override
	public List<ShippingDTO> myShippingList(String userId){
		return shippingDao.myShippingList(userId);
	}

	@Override
	public List<CartDTO> listOrder(String userid) {
		return shippingDao.listOrder(userid);
	}

	@Override
	public void insert(ShippingDTO dto) {
		shippingDao.insert(dto);
	}
	
	@Override
	public void orderInfo_Details(Order_detailDTO orderDetail){
		shippingDao.orderInfo_Details(orderDetail);
	}
	
	@Override
	public List<OrderListDTO> orderView(String userId){
		return shippingDao.orderView(userId);
	}

	@Override
	public void pay(PaymentDTO dto) {
		shippingDao.pay(dto);
	}

}
