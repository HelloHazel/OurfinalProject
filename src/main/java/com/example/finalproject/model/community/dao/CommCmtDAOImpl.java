package com.example.finalproject.model.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.community.dto.CommCmtDTO;

@Repository
public class CommCmtDAOImpl implements CommCmtDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CommCmtDTO> list(int comm_no) {
		return sqlSession.selectList("commCmt.listComment", comm_no);
	}

	@Override
	public int count(int comm_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(CommCmtDTO dto) {
		sqlSession.insert("commCmt.insertComment", dto);
	}

	@Override
	public void delete(int cmt_no) {
		sqlSession.delete("commCmt.delete", cmt_no);
	}

}
