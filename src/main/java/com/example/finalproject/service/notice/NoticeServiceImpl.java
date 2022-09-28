package com.example.finalproject.service.notice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.notice.dao.NoticeDAO;
import com.example.finalproject.model.notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO noticeDao;

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(NoticeDTO dto) throws Exception {
			noticeDao.create(dto);
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<NoticeDTO> listAll() throws Exception {
		return noticeDao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int countArticle() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
