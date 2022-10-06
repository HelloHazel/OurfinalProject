package com.example.finalproject.service.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.finalproject.model.notice.dto.NoticeDTO;

public interface NoticeService {
			// 리스트
			public List<NoticeDTO> list() throws Exception;
			// 전체 데이터 개수
			public int getTotalRow() throws Exception;
			// 보기
			public NoticeDTO view(int no) throws Exception;
			// 조회수
			public void increase(int no, HttpSession session) throws Exception;
			// 글쓰기
			public int write(NoticeDTO dto) throws Exception;
			// 수정
			public int update(NoticeDTO dto) throws Exception;
			// 삭제
			public int delete(int no) throws Exception;
}
