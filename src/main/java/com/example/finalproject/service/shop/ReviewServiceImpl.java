package com.example.finalproject.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.shop.dao.ReviewDAO;
import com.example.finalproject.model.shop.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO reviewDao;

	@Override
	public List<ReviewDTO> list(int product_id) {
		return reviewDao.list(product_id);
	}

	@Override
	public int count(int product_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReviewDTO dto) {
		reviewDao.create(dto);

	}

}
