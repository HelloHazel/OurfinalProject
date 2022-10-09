package com.example.finalproject.model.community.dao;

import java.util.List;

import com.example.finalproject.model.community.dto.CommCmtDTO;

public interface CommCmtDAO {
	
	public List<CommCmtDTO> list(int comm_no);
	public int count(int comm_no);
	public void create(CommCmtDTO dto);
	public void delete(int cmt_no);

}
