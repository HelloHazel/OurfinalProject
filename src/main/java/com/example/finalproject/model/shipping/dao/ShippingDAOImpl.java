package com.example.finalproject.model.shipping.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.shipping.dto.ShippingDTO;


@Repository
public class ShippingDAOImpl implements ShippingDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ShippingDTO> myShippingList(String userId) {
		return sqlSession.selectList("shipping.myShippingList",userId);
	}

}
