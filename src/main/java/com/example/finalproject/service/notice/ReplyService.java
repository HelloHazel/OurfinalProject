package com.example.finalproject.service.notice;

import java.util.List;

import com.example.finalproject.model.notice.dto.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReplyDTO dto);
}
