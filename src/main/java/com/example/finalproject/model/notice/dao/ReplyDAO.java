package com.example.finalproject.model.notice.dao;

import java.util.List;

import com.example.finalproject.model.notice.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReplyDTO dto);
}
