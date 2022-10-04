package com.example.finalproject.service.inquery;

import java.util.List;

import javax.inject.Inject;

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
	public InqueryDTO view(int no, int inc) throws Exception {
		if(inc == 1) inqueryDao.increase(inc);
		return inqueryDao.view(no);
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

}
