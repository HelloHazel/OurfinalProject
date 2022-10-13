package com.example.finalproject.service.faq;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.faq.dao.FaqDAO;
import com.example.finalproject.model.faq.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	FaqDAO faqDao;
	
	@Override
	public List<FaqDTO> list(int start, int end) throws Exception {
		return faqDao.list(start, end);
	}

	@Override
	public int countFaq() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FaqDTO view(int faq_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void increaseViewcnt(int faq_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(FaqDTO dto) {
		faqDao.insert(dto);
	}

	@Override
	public void update(FaqDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int faq_no) {
		faqDao.delete(faq_no);
	}

}
