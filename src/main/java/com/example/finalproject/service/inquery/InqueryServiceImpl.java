package com.example.finalproject.service.inquery;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.inquery.dao.InqueryDAO;
import com.example.finalproject.model.inquery.dto.InqueryDTO;

@Service
public class InqueryServiceImpl implements InqueryService {

	@Inject
	InqueryDAO inqueryDao;
	
	@Override
	public List<InqueryDTO> list() throws Exception {
		return inqueryDao.list();
	}
	
	@Override
	public int getTotalRow() throws Exception {
		return inqueryDao.getTotalRow();
	}
	
	@Override
	public int question(InqueryDTO dto) throws Exception {
		return inqueryDao.question(dto);
	}
	
	@Override
	public InqueryDTO view(int no) throws Exception {
		return inqueryDao.view(no);
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
			inqueryDao.increase(no);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+no, current_time);
		}
	}
	
	@Override
	public int answer(InqueryDTO dto) throws Exception {
		dto.setOrdNo(dto.getOrdNo() + 1);
		dto.setLevNo(dto.getLevNo() + 1);
		dto.setParentNo(dto.getNo());
		
		// 순서번호 1 증가 시키기
		inqueryDao.increaseOrdNo(dto);
		return inqueryDao.answer(dto);
	}
	
	@Override
	public int update(InqueryDTO dto) throws Exception{
		return inqueryDao.update(dto);
	}
	
	@Override
	public int delete(int no) throws Exception {
		return inqueryDao.delete(no);
	}
	
	@Override
	public List<InqueryDTO> myquerylist(String userId) {
		return inqueryDao.myquerylist(userId);
	}

}