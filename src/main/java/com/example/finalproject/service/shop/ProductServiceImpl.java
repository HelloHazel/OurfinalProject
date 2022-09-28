package com.example.finalproject.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.shop.dao.ProductDAO;
import com.example.finalproject.model.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject //service는 dao랑 연결
	ProductDAO productDao;

	@Override
	public List<ProductDTO> listProduct() {
		return productDao.listProduct();
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return productDao.detailProduct(product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDao.updateProduct(dto);

	}

	@Override
	public void deleteProduct(int product_id) {
		productDao.deleteProduct(product_id);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		productDao.insertProduct(dto);

	}

	@Override
	public String fileInfo(int product_id) {
		return productDao.fileInfo(product_id);
	}

}
