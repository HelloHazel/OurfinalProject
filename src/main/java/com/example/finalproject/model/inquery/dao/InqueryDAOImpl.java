package com.example.finalproject.model.inquery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.inquery.dto.InqueryDTO;

@Repository
public class InqueryDAOImpl implements InqueryDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<InqueryDTO> list() throws Exception {
		return sqlSession.selectList("inquery.list");
	}
	
	@Override
	public int getTotalRow() throws Exception {
		return sqlSession.selectOne("inquery.getTotalRow");
	}
	
	@Override
	public int question(InqueryDTO dto) throws Exception{
		return sqlSession.insert("inquery.question", dto);
	}

	@Override
	public InqueryDTO view(int no) throws Exception {
		return sqlSession.selectOne("inquery.view", no);
	}
	
	@Override
	public void increase(int no) throws Exception {
		sqlSession.update("inquery.increase", no);
	}
	
	@Override
	public int answer(InqueryDTO dto) throws Exception {
		return sqlSession.insert("inquery.answer", dto);
	}
	
	@Override
	public int increaseOrdNo(InqueryDTO dto) throws Exception {
		return sqlSession.update("inquery.increaseOrdNo", dto);
	}
	
	@Override
	public int update(InqueryDTO dto) throws Exception {
		return sqlSession.update("inquery.update", dto);
	}
	
	@Override
	public int delete(int no) throws Exception {
		return sqlSession.delete("inquery.delete", no);
	}
	
	@Override
	public List<InqueryDTO> myquerylist(String userId) {
		return sqlSession.selectList("inquery.myquerylist", userId);
	}
}