package com.example.finalproject.service.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		noticeDao.update(dto);

	}

	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		noticeDao.delete(bno);

	}

	@Override
	public List<NoticeDTO> listAll(int start, int end) throws Exception {
		return noticeDao.listAll(start, end);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		// 일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) {
			noticeDao.increaseViewcnt(bno);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return noticeDao.countArticle(search_option, keyword);
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		return noticeDao.read(bno);
	}

}
