package com.example.finalproject.model.community.dao;

import java.util.List;

import com.example.finalproject.model.community.dto.CommCmtDTO;

public interface CommCmtDAO {
	//댓글 리스트
	public List<CommCmtDTO> list(int comm_no);
	//댓글 갯수
	public int count(int comm_no);
	//댓글 작성
	public void create(CommCmtDTO dto);
	//댓글 삭제
	public void delete(int cmt_no);

}
