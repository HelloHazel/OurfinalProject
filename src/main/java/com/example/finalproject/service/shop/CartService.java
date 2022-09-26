package com.example.finalproject.service.shop;

import java.util.List;

import com.example.finalproject.model.shop.dto.CartDTO;

public interface CartService {
	public List<CartDTO> cartMoney();//장바구니 차트 출력
	public void insert(CartDTO dto);//장바구니에 상품 저장
	public List<CartDTO> listCart(String userid);//장바구니 상품 리스트
	public void delete(int cart_no); //장바구니 개별 상품 삭제
	public void deleteAll(String userid);//장바구니 전체 지우기
	public void update(int cart_no);//차트 관련
	public int sumMoney(String userid);//장바구니 상품 합계 금액 처리
	public int countCart(String userid, int product_id);//상품 갯수
	public void updateCart(CartDTO dto);//장바구니 속 전체 상품 수정
	public void modifyCart(CartDTO dto);//장바구니 개별상품 수량 수정

}
