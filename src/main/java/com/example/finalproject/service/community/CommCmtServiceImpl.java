package com.example.finalproject.service.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.finalproject.model.community.dao.CommCmtDAO;
import com.example.finalproject.model.community.dto.CommCmtDTO;

@Service
public class CommCmtServiceImpl implements CommCmtService {

	@Inject
	CommCmtDAO commCmtDao;
	
	
	@Override
	public List<CommCmtDTO> list(int comm_no) {
		return commCmtDao.list(comm_no);
	}

	@Override
	public int count(int comm_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(CommCmtDTO dto) {
		commCmtDao.create(dto);
	}

	@Override
	public void delete(int cmt_no) {
		commCmtDao.delete(cmt_no);
	}

}
