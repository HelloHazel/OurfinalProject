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
		noticeDao.deleteFile(fullName);

	}

	@Override
	public List<String> getAttach(int bno) {
		return noticeDao.getAttach(bno);
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub

	}

	@Transactional
	@Override
	public void create(NoticeDTO dto) throws Exception {
		noticeDao.create(dto);
		//attach 테이블에 레코드 추가
		String[] files=dto.getFiles();//첨부파일 이름 배열
		if(files==null) return; //첨부파일이 없으면 skip
		for(String name : files) {
			noticeDao.addAttach(name);//attach 테이블에 insert
		}
	}

	@Transactional
	@Override
	public void update(NoticeDTO dto) throws Exception {
		noticeDao.update(dto);
		//attach테이블도 함께 수정이 되어야한다.
		String[] files=dto.getFiles();
		if(files==null) return;
		for(String name : files) {
			System.out.println("첨부파일 이름 : " + name);
			noticeDao.updateAttach(name, dto.getBno());
		}
	}

	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		//reply 레코드 삭제
				//attach 레코드 삭제
				//notice 레코드 삭제
				noticeDao.delete(bno);

	}

	@Override
	public List<NoticeDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		return noticeDao.listAll(search_option, keyword, start, end);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno) != null) {
			//최근에 조회수를 올린 시간
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		//일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) {//24*60*60*1000 (하루)
			noticeDao.increaseViewcnt(bno);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}

	}

	@Override
	public int countArticle() throws Exception {
		return noticeDao.countArticle();
	}

	@Override
	public NoticeDTO read(int bno) throws Exception {
		return noticeDao.read(bno);
	}

}
