package com.example.finalproject.service.community;

import java.util.List;

import com.example.finalproject.model.community.dto.CommCmtDTO;

public interface CommCmtService {
	
	public List<CommCmtDTO> list(int comm_no);
	public int count(int comm_no);
	public void create(CommCmtDTO dto);
	public void delete(int cmt_no);

}
