package com.example.finalproject.model.shop.dao;

import java.util.List;

import com.example.finalproject.model.shop.dto.ReviewDTO;

public interface ReviewDAO {
	public List<ReviewDTO> list(int product_id);
	public int count(int product_id);
	public void create(ReviewDTO dto);
	public void delete(int product_id) throws Exception; //댓글삭제
	public List<ReviewDTO> myReviewList(String userId);//나의 리뷰 목록
}
