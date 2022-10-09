package com.example.finalproject.model.shop.dao;

import java.util.List;

import com.example.finalproject.model.shop.dto.ProductDTO;

public interface ProductDAO {
	List<ProductDTO> listProduct(); //상품 목록
	ProductDTO detailProduct(int product_id); //상품 상세 보기 (product_id값을 받아서 파라미터로 쓴다)
	void updateProduct(ProductDTO dto); //수정
	void deleteProduct(int product_id);//삭제
	void insertProduct(ProductDTO dto);//삽입
	String fileInfo(int product_id); //파일 첨부
	public ProductDTO read(int product_id) throws Exception;//레코드 조회

}
