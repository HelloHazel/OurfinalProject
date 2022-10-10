package com.example.finalproject.model.faq.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.faq.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<FaqDTO> list(int start, int end) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("faq.faq_list", map);
	}

	@Override
	public int countFaq() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FaqDTO view(int faq_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void increaseViewcnt(int faq_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(FaqDTO dto) {
		sqlSession.insert("faq.insert", dto);
	}

	@Override
	public void update(FaqDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int faq_no) {
		// TODO Auto-generated method stub

	}

}
