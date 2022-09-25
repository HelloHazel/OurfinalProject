package com.example.finalproject.model.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.finalproject.model.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void deleteFile(String fullName) {
		sqlSession.delete("notice.deleteFile", fullName);

	}

	@Override
	public List<String> getAttach(int bno) {
		return sqlSession.selectList("notice.getAttach", bno);
	}

	@Override
	public void addAttach(String fullName) {
		sqlSession.insert("notice.addAttach", fullName);

	}

	@Override
	public void updateAttach(String fullName, int bno) {
		Map<String,Object> map=new HashMap<>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		sqlSession.insert("notice.updateAttach", map);
		//게시물notice는 update이지만 첨부파일attach는 기존 파일이 있다 하더라도 기존것은 그대로 두거나
		//또는 새파일을 올려 수정하는 것이기 때문에 insert()를 씀

	}

	@Override
	public void create(NoticeDTO dto) throws Exception {
		sqlSession.insert("notice.insert", dto);

	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		sqlSession.update("notice.update", dto);

	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("notice.delete", bno);

	}

	//게시물 목록
	@Override
	public List<NoticeDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("notice.listAll", map);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("notice.increaseViewcnt", bno);

	}

	@Override
	public int countArticle() throws Exception {
		return sqlSession.selectOne("notice.countArticle");
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		return sqlSession.selectOne("notice.read", bno);
	}

}
