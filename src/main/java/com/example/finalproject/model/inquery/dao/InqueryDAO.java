package com.example.finalproject.model.inquery.dao;

import java.util.List;

import com.example.finalproject.model.inquery.dto.InqueryDTO;

public interface InqueryDAO {
	public List<InqueryDTO> list() throws Exception;
	public int getTotalRow() throws Exception;
	public int question(InqueryDTO dto) throws Exception;
	public InqueryDTO view(int no) throws Exception;
	public void increase(int no) throws Exception;
	public int answer(InqueryDTO dto) throws Exception;
	public int increaseOrdNo(InqueryDTO dto) throws Exception;
	public int update(InqueryDTO dto) throws Exception;
	public int delete(int no) throws Exception;
	public List<InqueryDTO> myquerylist(String userId);
}