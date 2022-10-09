package com.example.finalproject.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.shop.dto.ProductDTO;

@Repository //실질적인 DAO임을 알려주는 작업 
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ProductDTO> listProduct() { //목록보기
		return sqlSession.selectList("product.product_list");
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne("product.detail_product", product_id); //해당되는 productid
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("product.update_product", dto);

	}

	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.product_delete", product_id);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("product.insert", dto);

	}

	@Override
	public String fileInfo(int product_id) {
		return sqlSession.selectOne("product.fileInfo", product_id);
	}

	@Override
	public ProductDTO read(int product_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
