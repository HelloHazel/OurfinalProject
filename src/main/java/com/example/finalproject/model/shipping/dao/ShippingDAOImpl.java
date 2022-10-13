package com.example.finalproject.model.shipping.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.shipping.dto.Order_detailDTO;
import com.example.finalproject.model.shipping.dto.ShippingDTO;
import com.example.finalproject.model.shop.dto.CartDTO;


@Repository
public class ShippingDAOImpl implements ShippingDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ShippingDTO> myShippingList(String userId) {
		return sqlSession.selectList("shipping.myShippingList",userId);
	}

	@Override
	public List<CartDTO> listOrder(String userid) {
		return sqlSession.selectList("cart.listCart", userid);
	}

	@Override
	public void insert(ShippingDTO dto) {
		sqlSession.insert("shipping.insertOrder",dto);
	}
	
	@Override
	public void orderInfo_Details(Order_detailDTO orderDetail) {
		sqlSession.insert("shipping.orderInfo_Details",orderDetail);
	}

}
