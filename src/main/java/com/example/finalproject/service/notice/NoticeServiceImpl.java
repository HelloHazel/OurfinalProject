package com.example.finalproject.service.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.notice.dao.NoticeDAO;
import com.example.finalproject.model.notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO noticeDao;

	@Override
	public List<NoticeDTO> list(String search_option, String keyword, int start, int end) throws Exception {	
		return noticeDao.list(search_option,keyword,start,end);
	}

	@Override
	public int getTotalRow() throws Exception {
		return noticeDao.getTotalRow();
	}

	@Override
	public NoticeDTO view(int no) throws Exception {
		return noticeDao.view(no);
	}

	@Override
	public void increase(int no, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+no) != null) {
			//최근에 조회수를 올린 시간
			update_time=(long)session.getAttribute("update_time_"+no);
		}
		long current_time=System.currentTimeMillis();
		//일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) {//24*60*60*1000 (하루)
			noticeDao.increase(no);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+no, current_time);
		}
	}

	@Override
	public int write(NoticeDTO dto) throws Exception {
		return noticeDao.write(dto);
	}

	@Override
	public int update(NoticeDTO dto) throws Exception {
		return noticeDao.update(dto);
	}

	@Override
	public int delete(int no) throws Exception {
		return noticeDao.delete(no);
	}

}
