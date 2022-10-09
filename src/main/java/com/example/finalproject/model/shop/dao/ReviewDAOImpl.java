package com.example.finalproject.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.shop.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReviewDTO> list(int product_id) {
		return sqlSession.selectList("review.listReview", product_id);
	}

	@Override
	public int count(int product_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//댓글 추가
	@Override
	public void create(ReviewDTO dto) {
		sqlSession.insert("review.insertReview", dto);

	}

}
