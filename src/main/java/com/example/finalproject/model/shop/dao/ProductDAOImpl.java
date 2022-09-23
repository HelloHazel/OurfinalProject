package com.example.finalproject.model.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.finalproject.model.shop.dto.ProductDTO;

@Repository //실질적인 DAO임을 알려주는 작업 
public class ProductDAOImpl implements ProductDAO {

	@Override
	public List<ProductDTO> listProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(int product_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public String fileInfo(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
