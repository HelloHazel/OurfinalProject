package com.example.finalproject.model.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<NoticeDTO> list() throws Exception {
		return sqlSession.selectList("notice.list");
	}

	@Override
	public int getTotalRow() throws Exception {
		return sqlSession.selectOne("notice.getTotalRow");
	}

	@Override
	public NoticeDTO view(int no) throws Exception {
		return sqlSession.selectOne("notice.view", no);
	}

	@Override
	public void increase(int no) throws Exception {
		sqlSession.update("notice.increase", no);
		
	}

	@Override
	public int write(NoticeDTO dto) throws Exception {
		return sqlSession.insert("notice.write", dto);
	}

	@Override
	public int update(NoticeDTO dto) throws Exception {
		return sqlSession.update("notice.update", dto);
	}

	@Override
	public int delete(int no) throws Exception {
		return sqlSession.delete("notice.delete", no);
	}

}
